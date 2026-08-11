.data
x:      .zero 8000              // int x[2000]
y:      .zero 8000              // int y[2000]
result: .zero 8000              // int result[2000]
alpha:  .word 13                // int alpha = 13
fmt:    .asciz "Iteration %d\n"

.text
.global main

main:
    // save frame pointer and link register
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // load base addresses of arrays
    ldr x20, =x
    ldr x21, =y
    ldr x22, =result

    // load alpha value
    ldr x25, =alpha
    ldr w23, [x25]              // w23 = 13

    // loop setup
    mov x19, #0                 // i = 0
    mov x24, #2000            // loop limit

looptop:
    cmp x19, x24
    beq loopexit

    // printf("Iteration %d\n", i)
    ldr x0, =fmt
    mov x1, x19
    bl printf

    // load x[i] using postindex, advances pointer
    ldr w1, [x20], #4

    // load y[i] using postindex, advances pointer
    ldr w2, [x21], #4

    // result[i] = alpha * x[i] + y[i]
    mul w3, w23, w1
    add w3, w3, w2

    // store result[i] using postindex, advances pointer
    str w3, [x22], #4

    // i++
    add x19, x19, #1
    b looptop

loopexit:
    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
