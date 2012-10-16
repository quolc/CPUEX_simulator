	jmpi	_min_caml_start
gcd.7:
	subis	r0, r2, 0
	jmpine	jmpeq_else.17
	addi	r2, r5, 0
	jmp	r31
jmpeq_else.17:
	subs	r0, r2, r5
	jmpigt	jmple_else.18
	sub	r5, r5, r2
	jmpi	gcd.7
jmple_else.18:
	sub	r2, r2, r5
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	jmpi	gcd.7
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r0, 21600
	addi	r5, r0, 5
	slli	r5, r5, 16
	oori	r5, r5, 9820
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	gcd.7
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	prt	r2
   # main program end
	hlt
