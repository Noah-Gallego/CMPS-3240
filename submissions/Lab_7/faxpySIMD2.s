.text

.global faxpy
faxpy:
	stp	x29, x30, [sp, -16]!	// save frame
	add	x29, sp, 0
	mov	w5, 0			// i = 0
_looptop:
	cmp	w5, w0
	beq	_loopquit
	ld1	{v1.2s}, [x1], 8	// load 2 floats from x
	ld1	{v2.2s}, [x2], 8	// load 2 floats from y
	fadd	v0.2s, v1.2s, v2.2s	// add 2 lanes
	st1	{v0.2s}, [x3], 8	// write to result
	add	w5, w5, 2		// i += 2
	b	_looptop
_loopquit:
	ldp	x29, x30, [sp], 16
	ret
