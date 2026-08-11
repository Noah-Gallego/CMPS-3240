.text

.global faxpy
faxpy:
	stp	x29, x30, [sp, -16]!	// save frame
	add	x29, sp, 0
	mov	w5, 0			// i = 0
_looptop:
	cmp	w5, w0
	beq	_loopquit
	ld1	{v1.4s}, [x1], 16	// load 4 floats from x
	ld1	{v2.4s}, [x2], 16	// load 4 floats from y
	fadd	v0.4s, v1.4s, v2.4s	// add 4 lanes
	st1	{v0.4s}, [x3], 16	// write to result
	add	w5, w5, 4		// i += 4
	b	_looptop
_loopquit:
	ldp	x29, x30, [sp], 16
	ret
