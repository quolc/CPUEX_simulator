_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
   # main program start
	addi	r2, r0, 123
	prt	r2
	addi	r2, r0, -456
	prt	r2
	addi	r2, r0, 789
	prt	r2
   # main program end
	hlt
