#include <cstdio>

extern "C" void tower(int, int, int, int);

int main()
{
    int n = 2; // Number of disks
    tower(n, 'A', 'C', 'B');  // A, B and C are names of rods
    return 0;
}
