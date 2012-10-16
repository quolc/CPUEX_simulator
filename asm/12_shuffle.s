	jmpi	_min_caml_start
foo.12:
	prt	r2
	prt	r5
	prt	r6
	prt	r7
	prt	r8
	prt	r9
	jmp	r31
bar.24:
	addi	r29, r9, 0
	addi	r9, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	addi	r8, r29, 0
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	jmpi	foo.12
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r0, 1
	addi	r5, r0, 2
	addi	r6, r0, 3
	addi	r7, r0, 4
	addi	r8, r0, 5
	addi	r9, r0, 6
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	bar.24
	ldw	r31, r1, 1
	ldw	r1, r1, 0
   # main program end
	hlt
