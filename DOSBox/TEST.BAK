#include <stdio.h>
#include <dos.h>

int main()
	{
	*(short far*) (0xb8000000L + 80*2*5) = 0x03 | (0x4e << 8);

	return 0;
	}

	// Near, far, whenever you are
	// I beleive my program to run
