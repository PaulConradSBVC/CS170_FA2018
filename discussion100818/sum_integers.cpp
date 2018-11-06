#include <cstdio>
using namespace std;

int main()
{
	int value;

	printf("Enter an integer and I'll add all integers from 1 to your entered integer: ");
	scanf("%d",&value);

	int r0=1;	// use register r0 as counter

	int r2=0;	// r2 holds the sum
	int r1 = value;
	while(r0 <= r1 )
	{
		r2=r2+r0;
		r0++;
	}

	printf("Sum of integers from 1 to %d is %d\n",r1,r2);

	return 0;
}
