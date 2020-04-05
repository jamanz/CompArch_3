.syntax unified
.global func

func:
	push {lr}
	mov r0, #11 	 //a
	mov r1, #6	 //b
	and r0, r1
	lsr r12, r0, #1  //r1=(a&b)>>
	mov r0, #5 	 //c
	bl factorial	 //r0=r0!
	add r1, r12, r0
	pop {pc} 

factorial:
	push {r0, lr}
	cmp r0, #1
	bgt else
	mov r0, #1
	mov pc, lr 
	 else:
	 	sub r0, #1 
		bl factorial 
		pop {r1, lr} 
		mul r0, r1
		mov pc, lr
