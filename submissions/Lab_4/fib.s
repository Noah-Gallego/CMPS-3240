.text
.extern printf

.global main
main:
stp 	x29, x30, [sp, #-16]!
mov 	x29, sp

mov 	x19, #0
mov 	x20, #1
mov 	x21, #0
mov 	x22, #10

ldr 	x0, =string1
mov 	x1, x19
bl 	printf

ldr 	x0, =string1
mov 	x1, x20
bl 	printf

mov 	x21, #2

_looptop:
cmp 	x21, x22
bge 	_exit

add 	x23, x19, x20
mov 	x19, x20
mov 	x20, x23

ldr 	x0, =string1
mov 	x1, x20
bl 	printf

add 	x21, x21, #1
b 	_looptop

_exit:
ldp 	x29, x30, [sp], #16
mov 	x0, #0
ret

.data
.global string1
string1:
	.ascii	"%d\n"
