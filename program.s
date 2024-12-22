
.data
	N:	.word 5
	array:	.space 20
	str:	.asciiz "Enter 5 integers: "
	space:	.ascii " "
	newline:	.asciiz "\n"
	display_str:	.asciiz " Array of integers: "
	sort_str:		.asciiz " Sorting array..."



.text
	li	$t2,0
	la	$a1,array
	
	jal readArray
	
	jal	displayArray
	
	jal	sortArray
	
	li	$v0,10
	syscall
	


readArray:
	lw	$t0,N
	
	la		$a0,str
	li		$v0,4
	syscall
	
	read_loop:	
	
		beq	  $t0,0,exit
	
		li		$v0,5
		syscall
		sw		$v0,($a1)
		sub		$t0,$t0,1
		add		$a1,$a1,4
		j		read_loop
	
	
	
	
	
	


displayArray:
	
	la	$a0,display_str
	li	$v0,4
	syscall
	
	
	
	lw	$t0,N
	la	$t1,array
	
	display_loop:
		beq	$t0,0,exit
		lw	$a0,($t1)
		li		$v0,1
		syscall
		
		sub $t0,$t0,1
		
		
		
		add	$t1,$t1,4
		
		
		la	$a0,space
		li	$v0,4
		syscall
		
		j	display_loop
		
	
	
	
	
	

sortArray:
	la	$a0,sort_str
	li	$v0,4
	syscall
	
	lw	$t0,N
	sub	$t0,$t0,1
	li	$t1,0 #counter for i
	li	$t2,0#counter for j
	
	first_loop:
		beq $t1,$t0,exit1
			sub $t3,$t0,1
			second_loop:
				beq $t2,$t3,exit2
				j	swap
			
	
swap:
	add	$t4,$t2,1
	lw	$t6,array($t2)
	lw	$t7,array($t4)
	blt	$t6,$t7,second_loop
	add	$t5,$t2,0
	move	$t2,$t4
	move	$t4,$t5
	j		second_loop
	
	

exit:
	jr	$ra
	
	la	$a0,newline
	li	$v0,4
	syscall