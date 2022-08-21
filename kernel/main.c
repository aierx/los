#include "lib.h"
#include "printk.h"
#include "gate.h"
#include "trap.h"

void Start_Kernel(void)
{
	int *addr = (int *)0xffff800000a00000;


	Pos.XResolution = 1440;
	Pos.YResolution = 900;

	Pos.XPosition = 0;
	Pos.YPosition = 0;

	Pos.XCharSize = 8;
	Pos.YCharSize = 16;

	Pos.FB_addr = (int *)0xffff800000a00000;
	Pos.FB_length = (Pos.XResolution * Pos.YResolution * 4);

	color_printk(YELLOW,BLACK,"Hello World!\n");

	load_TR(8);

	set_tss64(
		0xffff800000007c00, 
		0xffff800000007c00, 
		0xffff800000007c00, 
		0xffff800000007c00, 
		0xffff800000007c00, 
		0xffff800000007c00, 
		0xffff800000007c00, 
		0xffff800000007c00, 
		0xffff800000007c00, 
		0xffff800000007c00);

	sys_vector_init();

	int i;
	// i = 1/0;
	// i = *(int *)0xffff80000aa00000;

	while(1)
		;
}