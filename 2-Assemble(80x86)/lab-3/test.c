#include<stdio.h>
int main()
{
	char in_name[11];
	while(1)
    {
        printf("Please enter the student's name to inquire!\n");
        gets(in_name);
        if(in_name[0]=='\0')
            continue;
        if((in_name[0]=='q'||in_name[0]=='Q')&&(in_name[1]=='\0'))
            break;

        break;
    }
	return 0;
}
