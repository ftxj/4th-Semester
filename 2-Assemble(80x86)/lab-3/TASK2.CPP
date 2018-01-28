#include <stdio.h>
#pragma inline
int main()
{
	int count;

	asm mov count,5
	printf("count = %d",count);
	scanf("%d",&count);
	return 0;
}