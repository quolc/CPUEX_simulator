	jmpi	_min_caml_start
adder.7:
	ldw	r5, r30, 4
	add	r2, r5, r2
	jmp	r31
make_adder.5:
	addi	r5, r4, 0
	addi	r4, r4, 8
	addi	r6, r0, h16(adder.7)
	slli	r6, r6, 16
	addi	r6, r6, l16(adder.7)
	stw	r6, r5, 0
	stw	r2, r5, 4
	addi	r2, r5, 0
	jmp	r31
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r0, 3
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	make_adder.5
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r30, r2
	addi	r2, r0, 7
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	prt	r2
   # main program end
	hlt
