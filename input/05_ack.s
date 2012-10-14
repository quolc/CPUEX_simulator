	jmpi	_min_caml_start
ack.15:
	subis	r0, r2, 0
	jmpigt	jmple_else.34
	addi	r2, r5, 1
	jmp	r31
jmple_else.34:
	subis	r0, r5, 0
	jmpigt	jmple_else.35
	subi	r2, r2, 1
	addi	r5, r0, 1
	jmpi	ack.15
jmple_else.35:
	subi	r6, r2, 1
	subi	r5, r5, 1
	stw	r6, r1, -1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	ack.15
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r2, 0
	ldw	r2, r1, -1
	jmpi	ack.15
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r0, 3
	addi	r5, r0, 10
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	ack.15
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	prt	r2
   # main program end
	hlt
