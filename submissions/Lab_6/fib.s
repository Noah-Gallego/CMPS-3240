.data
.global string1
string1:
	.ascii	"The 13th Fibonacci number is %d!\n\0"

.text
.extern printf
.global main
main:
### SET UP FRAME RECORD ###
stp	x29, x30, [sp, -16]!
add	x29, sp, 0

### MAIN() LOGIC ###
# Call fib(13)
mov	x0, 13
bl	fib
# Set up printf args
add	x1, x0, 0
ldr	x0, =string1
bl	printf

### TAKE DOWN FRAME RECORD ###
ldp	x29, x30, [sp], 16
mov	w0, 0
ret

.global fib
fib:
### SET UP FRAME RECORD ###
stp	x29, x30, [sp, -32]!
add	x29, sp, 0
# Shadow input argument
str	x0, [sp, 16]

### LOGIC FOR FIB() ###
cmp	x0, 1
# If n <= 1, return n
ble	return_n

# Calculate fib(n-1)
sub	x0, x0, 1
bl	fib
# Save fib(n-1) across the second call
str	x0, [sp, 24]

# Calculate fib(n-2)
ldr	x0, [sp, 16]
sub	x0, x0, 2
bl	fib

# x0 = fib(n-2) + fib(n-1)
ldr	x1, [sp, 24]
add	x0, x0, x1
b	return

return_n:
# x0 already holds n (0 or 1)

return:
ldp	x29, x30, [sp], 32
ret
