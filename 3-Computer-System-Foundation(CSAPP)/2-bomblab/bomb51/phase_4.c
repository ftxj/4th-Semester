#include <stdio.h>
void foo(int* EDI, int* ESI, int* EAX)
{
	int EBP = 4203040, R12 = 4197504, EBX = 0;
	EBX = *EDI;
	if(*EDI <= 0)
	{
		*EAX = 0;
		return;
	}
	EBP = *ESI;
	*EAX = *ESI;
	if(*EDI == 1)
		return;
	(*EDI) = (*EDI) - 1;

	foo(EDI, ESI, EAX);

	R12 = *EAX + EBP;
	*EDI = EBX -  2;
	*ESI = EBP;

	foo(EDI, ESI, EAX);

	*EAX = *EAX + R12;
	return;
}

int main()
{
	int i = 4;
	int EDI = 9, ESI = 4,  EAX = 2;
	for(i = 4; i >=0; i--)
	{
		foo(&EDI,&ESI,&EAX);
       		printf("%d %d\n",EAX, ESI);	       
	       	ESI = i;
		EAX = i - 2;
	}
	return 0;
}

