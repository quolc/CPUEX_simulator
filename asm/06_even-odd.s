	jmpi	_min_caml_start
odd.19:
	subis	r0, r2, 0
	jmpigt	jmple_else.36
	subis	r0, r2, 0
	jmpilt	jmpge_else.37
	addi	r2, r0, 456
	jmp	r31
jmpge_else.37:
	addi	r2, r2, 1
	jmpi	even.17
jmple_else.36:
	subi	r2, r2, 1
	jmpi	even.17
even.17:
	subis	r0, r2, 0
	jmpigt	jmple_else.38
	subis	r0, r2, 0
	jmpilt	jmpge_else.39
	addi	r2, r0, 123
	jmp	r31
jmpge_else.39:
	addi	r2, r2, 1
	jmpi	odd.19
jmple_else.38:
	subi	r2, r2, 1
	jmpi	odd.19
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r0, 789
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	even.17
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	prt	r2
   # main program end
	hlt
