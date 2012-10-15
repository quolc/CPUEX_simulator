	jmpi	_min_caml_start
fib.10:
	subis	r0, r2, 1
	jmpigt	jmple_else.24
	jmp	r31
jmple_else.24:
	subi	r5, r2, 1
	stw	r2, r1, -1
	addi	r2, r5, 0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	fib.10
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	subi	r5, r5, 2
	stw	r2, r1, -2
	addi	r2, r5, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	fib.10
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	add	r2, r5, r2
	jmp	r31
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r0, 40
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	fib.10
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	prt8	r2
	prt4	r2
	prt2	r2
	prt1	r2
   # main program end
	hlt
