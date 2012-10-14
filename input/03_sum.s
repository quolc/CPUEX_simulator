	jmpi	_min_caml_start
sum.7:
	subis	r0, r2, 0
	jmpigt	jmple_else.17
	addi	r2, r0, 0
	jmp	r31
jmple_else.17:
	subi	r5, r2, 1
	stw	r2, r1, -1
	addi	r2, r5, 0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	sum.7
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	add	r2, r2, r5
	jmp	r31
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r0, 10000
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	sum.7
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	prt	r2
   # main program end
	hlt
