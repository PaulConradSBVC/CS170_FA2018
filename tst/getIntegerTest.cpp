#include <cstdio>

extern "C" int getIntegerInRange(int min, int max);

int main()
{
	int x = getIntegerInRange(1,10);
	printf("Entered value = %d\n",x);
}
