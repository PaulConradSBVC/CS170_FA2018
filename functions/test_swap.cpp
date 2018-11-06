#include <cstdio>

// prototypes
extern "C" void swap(int &x, int &y);
extern "C" void mystery_swap(int &x, int &y);

int main()
{
	int a, b;

	printf("Integer Swapper!\n\nEnter two integers (seperated by space): ");

	scanf("%d %d", &a, &b);

	printf("a=%d, b=%d\n", a, b);

	swap(a,b);

	printf("a=%d, b=%d\n", a, b);
	return 0;
}
