	jmpi	_min_caml_start
composed.10:
	ldw	r5, r30, 8
	ldw	r30, r30, 4
	stw	r5, r1, -1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
compose.7:
	addi	r6, r4, 0
	addi	r4, r4, 16
	addi	r7, r0, h16(composed.10)
	slli	r7, r7, 16
	addi	r7, r7, l16(composed.10)
	stw	r7, r6, 0
	stw	r5, r6, 8
	stw	r2, r6, 4
	addi	r2, r6, 0
	jmp	r31
dbl.13:
	add	r2, r2, r2
	jmp	r31
inc.15:
	addi	r2, r2, 1
	jmp	r31
dec.18:
	subi	r2, r2, 1
	jmp	r31
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r4, 0
	addi	r4, r4, 8
	addi	r5, r0, h16(dbl.13)
	slli	r5, r5, 16
	addi	r5, r5, l16(dbl.13)
	stw	r5, r2, 0
	addi	r5, r4, 0
	addi	r4, r4, 8
	addi	r6, r0, h16(inc.15)
	slli	r6, r6, 16
	addi	r6, r6, l16(inc.15)
	stw	r6, r5, 0
	addi	r6, r4, 0
	addi	r4, r4, 8
	addi	r7, r0, h16(dec.18)
	slli	r7, r7, 16
	addi	r7, r7, l16(dec.18)
	stw	r7, r6, 0
	stw	r5, r1, -1
	addi	r5, r6, 0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	compose.7
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	compose.7
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r30, r2
	addi	r2, r0, 123
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	prt	r2
   # main program end
	hlt
