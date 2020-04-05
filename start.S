.syntax unified
.cpu cortex-m4
//.fpu softvfp
.thumb 
// Global memory locations.
.global vtable
.global func
/*
 * vector table
 */
.type vtable, %object 
.type __hard_reset__, %function
vtable:
	.word __stack_start
	.word __hard_reset__+1
	.size vtable, .-vtable
__hard_reset__:
	bl func
	_loop: b _loop
