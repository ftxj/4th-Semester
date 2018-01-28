#include <stdio.h>
#pragma inline
extern "C" void _Cdecl SUB2(char *A);
void SUB1(char *stu);
extern "C" void _Cdecl SUB3(char *A);
void SUB4(char *stu);
extern "C" void _Cdecl SUB5(void);
int main()
{
    int choose;
    char buf[80]="zhang";
    buf[10]=100;
    buf[11]=1;
    buf[12]=12;
    buf[13]=99;
    for(choose=0;choose<5;choose++)
    {
        buf[choose*16+14]='0';
        buf[choose*16+15]='0';
    }

    char *stu=buf;
    while(1){

        printf("\n\n               MENU\n");
        printf("      1.Logging the data of student'name and grades.\n");
        printf("      2.Calculate the average.\n");
        printf("      3.Calculate the rankings.\n");
        printf("      4.Output report card.\n");
        printf("      5.Exits program.\n      ");
        printf("Please input the number of function to choose(1-5):");
        scanf("%d",&choose);
        while(!(choose>0&&choose<=5))
        {
            printf("      INPUT ERROR!Please input again:");
            scanf("%d",&choose);
        }
        if(choose==1)
            SUB1(stu);
        if(choose==2)
            SUB2(stu);
        if(choose==3)
            SUB3(stu);
        if(choose==4)
            SUB4(stu);
        if(choose==5)
            SUB5();
    }
	return 0;
}
void SUB1(char *stu)
{
    int parial;
    int temp,flag=0;
    printf("\n\n      Please enter the serail number of the student want to modify:(Only 1-5!):");
    scanf("%d",&parial);
    while(!(parial>0&&parial<=5))
    {
        getchar();
        printf("      INPUT ERROR!Please input again:");
        scanf("%d",&parial);
    }
    parial=(parial-1)*16;

    printf("      Please enter the name of student:");
    scanf("%s",&stu[parial]);
    for(temp=0;temp<10;temp++)
    {
        if(flag)
        {
            stu[parial+temp]='\0';
        }
        if(!flag&&stu[parial+temp]=='\0')
        {
            flag=1;

        }
    }
    printf("      Please enter the Chinese grade(Only 0-100):");
    scanf("%d",&temp);
    stu[parial+10]=temp;
    printf("      Please enter the Math grade(Only 0-100):");
    scanf("%d",&temp);
    stu[parial+11]=temp;
    printf("      Please enter the English grade(Only 0-100)");
    scanf("%d",&temp);
    stu[parial+12]=temp;
    stu[parial+13]='\0';
    return ;
}

void SUB4(char *stu)
{
    printf("      this is sub4...!\n");
    int i,j,num;
    char c;
    printf("      name       Chinese Math English AVG RANK\n");
    for(j=0;j<80;j+=16)
    {
        printf("      %-10s",&stu[j]);
        num=stu[j+10];
        printf(" %-7d",num);
        num=stu[j+11];
        printf(" %-4d",num);
        num=stu[j+12];
        printf(" %-7d",num);
        num=stu[j+13];
        printf(" %-3d ",num);
        c=stu[j+14];
        printf("%d\n",(int)c);

    }
    getchar();
    getchar();
    return ;
}


