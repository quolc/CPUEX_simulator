	jmpi	_min_caml_start
f.8:
	ldw	r5, r30, 4
	subis	r0, r2, 0
	jmpine	jmpeq_else.21
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.21:
	subi	r2, r2, 1
	stw	r5, r1, -1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	add	r2, r5, r2
	jmp	r31
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r0, 10
	addi	r30, r4, 0
	addi	r4, r4, 8
	addi	r5, r0, h16(f.8)
	slli	r5, r5, 16
	addi	r5, r5, l16(f.8)
	stw	r5, r30, 0
	stw	r2, r30, 4
	addi	r2, r0, 123
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
