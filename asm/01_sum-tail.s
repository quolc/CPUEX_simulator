	jmpi	_min_caml_start
sum.8:
	subis	r0, r5, 0
	jmpigt	jmple_else.19
	jmp	r31
jmple_else.19:
	add	r2, r2, r5
	subi	r5, r5, 1
	jmpi	sum.8
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r0, 0
	addi	r5, r0, 10000
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	sum.8
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	prt	r2
   # main program end
	hlt
