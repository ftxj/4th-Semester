/*
    This is an ugly solution by ftxj
    very very ugly......
*/
#include "cachelab.h"
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#define LINE_LENGTH 23
#define new(type,n)  (type *)malloc((n) * sizeof(type))

typedef char* string;
typedef struct cache_line cacheline;
typedef struct cache_block cacheblock;
typedef struct cache cache;
typedef struct list List;

struct list{
    unsigned elm;
    List* next;
    List* front;
};

struct cache_line{
    unsigned validBit;
    unsigned long tagBit; 
};

struct cache_block{
    cacheline* lines;
    List* push_order;
};

struct cache{
    cacheblock* d_cache;
    void (*push)(cacheblock* fuck, unsigned elm);
    unsigned (*pop)(cacheblock* fuck);
    unsigned S; 
    unsigned E;
    unsigned b;
    unsigned s;
};

void initCache(cache* Xintel, unsigned s, unsigned E, unsigned b);
void initBlock(cacheblock *Xintel_Block, unsigned S);

void mainJudge(cache Xintel, string filename, int flag);
void loadJudge(cache Xintel, string line, int flag);
void storeJudge(cache Xintel, string line, int flag);
void modifyJudge(cache Xintel, string line, int flag);

unsigned getblock(cache Xintel, string line);
unsigned long gettagBit(cache Xintel, string line);
unsigned long getnum(string line);

void minPush(cacheblock* fuck, unsigned l);
unsigned minPop(cacheblock* fuck);

void printUsage(void);

int hit = 0, miss = 0, vication = 0;
int main(int argc, char** argv)
{   
    int s = 0, E = 0, b = 0, flag = 0, h = 0;
    char* trace_file;
    const char* optstring = "hvs:E:b:t:";
    char opt;
    //deal with the short-option
    while((opt=getopt(argc,argv,optstring))!=-1) 
    {
        switch (opt) {
            case 'h':
                printUsage();
                h = 1;
                break;
            case 'v':
                flag = 1; 
                break;
            case 's':
                s = atoi(optarg);
                break;
            case 'E':
                E = atoi(optarg);
                break;
            case 'b':
                b = atoi(optarg);
                break;
            case 't':
                trace_file = optarg;
                break;
            case '?':
                printUsage();
                h = 1;
                break;
        }
    }    
    if(!h)
    {
        cache Xintel;
        initCache(&Xintel, s, E,b);
        mainJudge(Xintel, trace_file, flag);
        printSummary(hit, miss + vication, vication);
    }
    return 0;
}

// 初始化cache
void initCache(cache *Xintel, unsigned s, unsigned E, unsigned b)
{
    int S = 1 << s, i = 0, j = 0;
    Xintel -> S = S;
    Xintel -> E = E;
    Xintel -> b = b;
    Xintel -> s = s;
    Xintel -> push = minPush;
    Xintel -> pop = minPop;
    Xintel -> d_cache = new(cacheblock, S);
    for(i = 0; i < S; ++i)
    {
        initBlock(&(Xintel -> d_cache[i]), E);
    }
}
// 初始化每一个人block和line
void initBlock(cacheblock *Xintel_Block, unsigned E)
{
    int j = 0;
    List* HEAD = new(List, 1);
    HEAD -> next = NULL;
    HEAD -> front = NULL;
    HEAD -> elm = -1;
    Xintel_Block -> lines = new(cacheline, E);
    Xintel_Block -> push_order = HEAD;
    for(j =0; j < E; ++j)
    {
        Xintel_Block -> lines[j].validBit = 0;
        Xintel_Block -> lines[j].tagBit = 0;
    }
}

void mainJudge(cache Xintel, string filename, int flag)
{
    string line = new(char, LINE_LENGTH);
    FILE* fp;
    fp = fopen(filename, "r");
    if(!fp) printf("File can't open!\n");
    while(fgets(line, LINE_LENGTH, fp) != NULL)
    {
        if(line[0] != ' ') continue;
        switch(line[1])
        {
            case 'L': loadJudge(Xintel, line, flag); break;
            case 'S': storeJudge(Xintel, line, flag); break;
            case 'M': modifyJudge(Xintel, line, flag); break;
            default: break;
        }
    }
    fclose(fp); 
}

void loadJudge(cache Xintel, string line, int flag)
{
    unsigned block = getblock(Xintel, line);
    unsigned long tag = gettagBit(Xintel, line);
    //line[strlen(line) - 1] = '\0';
    int j = 0;
    for(j = 0; j < Xintel.E; ++j)
    {
        if(Xintel.d_cache[block].lines[j].tagBit == tag 
            && Xintel.d_cache[block].lines[j].validBit == 1)
        {
            hit++;
            if(flag == 1) printf("%s hit \n", &line[1]);
            if(flag == 2) printf("%s hit ",&line[1]);
            if(flag == 3) printf("hit \n");
            Xintel.push(&(Xintel.d_cache[block]), j);
            return;
        }
    }
    for(j = 0; j < Xintel.E; ++j)
    {
        if(Xintel.d_cache[block].lines[j].validBit == 0)
        {
            miss++;
            if(flag == 1) printf("%s miss \n", &line[1]);
            if(flag == 2) printf("%s miss ",&line[1]);
            if(flag == 3) printf("miss \n");
            Xintel.push(&(Xintel.d_cache[block]),j);
            Xintel.d_cache[block].lines[j].validBit = 1;
            Xintel.d_cache[block].lines[j].tagBit = tag;
            return;
        }
    }
    unsigned l = Xintel.pop(&(Xintel.d_cache[block]));
    Xintel.push(&(Xintel.d_cache[block]), l);
    Xintel.d_cache[block].lines[l].tagBit = tag;
    if(flag == 1) printf("%s miss eviction \n", &line[1]);
    if(flag == 2) printf("%s miss eviction ",&line[1]);
    if(flag == 3) printf("miss eviction \n");
    vication++;
    return;
}

void minPush(cacheblock* fuck, unsigned l)
{
    List* node = new(List, 1);
    node -> next = NULL;
    node -> front = NULL;
    node -> elm = l;
    List* pre = NULL;
    List* beh = NULL;
    List* temp = fuck -> push_order;
    while(temp -> next != NULL)
    {
        if(temp -> elm == l)
        {
            pre = temp -> front;
            beh = temp -> next;
            pre -> next = beh;
            beh -> front = pre;
            free(temp);
            temp = beh;
        }
        else
        {
            temp = temp -> next;
        }
    }
    if(temp -> elm != l)
    {
        temp -> next = node;
        node -> front = temp;
    }
}

unsigned minPop(cacheblock* fuck)
{
    List* temp = NULL;
    List* beh = NULL;
    temp = fuck -> push_order -> next;
    if(!temp)
        return -1;
    beh = temp -> next;
    unsigned ret = temp -> elm;
    fuck -> push_order -> next = beh;
    if(beh)
        beh ->front = fuck -> push_order;
    free(temp);
    return ret; 
}
void storeJudge(cache Xintel, string line,int flag)
{
    loadJudge(Xintel, line, flag);
}

void modifyJudge(cache Xintel, string line, int flag)
{
    int temp = flag;
    if(flag == 1) flag = 2;
    loadJudge(Xintel, line, flag);
    if(flag == 2) flag = 3;
    loadJudge(Xintel, line, flag);
    flag = temp;
}

unsigned getblock(cache Xintel, string line)
{
    unsigned bitmask = (Xintel.S - 1) << Xintel.b;
    return (getnum(line) & bitmask) >> Xintel.b;
}

unsigned long gettagBit(cache Xintel, string line)
{   
    return getnum(line) >> (Xintel.s + Xintel.b);
}
void printUsage(void)
{
    printf("Usage: ./csim [-h] [-v] -s <s> -E <E> -b <b> -t <tracefile>\n");
    printf("-s: number of set index(2^s sets)\n");
    printf("-E: number of lines per set\n");
    printf("-b: number of block offset bits\n");
    printf("-t: trace file name\n");
}

unsigned long getnum(string line)
{
    unsigned long bit = 0, i = 3, j = 1;
    while(line[i + 1] != ',')
        ++i;
    while(line[i] != ' ')
    {
        if(line[i] >= '0' && line[i] <= '9')
            bit += (line[i] - '0') * j;
        else if(line[i] >= 'a' && line[i] <= 'f')
            bit += (line[i] - 'a' + 10) * j;
        else if(line[i] >= 'A' && line[i] <= 'F')
            bit += (line[i] - 'A' + 10) * j;
        j *= 16;
        --i;
    }
    return bit;
}