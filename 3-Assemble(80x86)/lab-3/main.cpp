#include <stdio.h>
#include <string.h>
#pragma inline
extern "C" void _Cdecl ave_s(char *A);


int main()
{
	int i,j,m;
	unsigned k;
	char c[80],ch;
	char d[11];
	char *p = c;
	while(1)
	{
	scanf("%d",&i);
	if(i == 1) 
	{
      for(j=1;j<=5;j++)
      {
      	printf("Please input student %d :\n",j);
        for(m=0;m<11;m++)
        {
        	d[m]=1;
        }
        scanf("%s",d);
        for(m=0;m<10;m++)
        {
        	p[m]=d[m];
        }
        p = p + 10;
        scanf("%u",&k);
        *p = (char)k;
        p++;
        scanf("%u",&k);
        *p = (char)k;
        p++;
        scanf("%u",&k);
        *p = (char)k;
        p= p + 4;        
      }
	}
	else if(i == 2)
	{
		ave_s(c);
	}
	else if(i == 5)
	{
		printf("%s\n",c);
		return 0;
	}
	else if(i == 6)
	{
		for(m=0;m<80;m++)
		{
			putchar(c[m]);
		}
	}
	}

}