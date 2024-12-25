

sortArray:
	add	$sp,$sp,4
	sw	$ra,($sp)
	
	
	la	$a0,sort_str
	li	$v0,4
	syscall
	
	lw	$t0,N
	sub	$t0,t0,1
	la	$t1,array
	li	$t2,0#i
	li	$t3,0#j
	
	first_loop:
		bge	$t2,$t0,done
			sub	$t4,$t0,$t2
			second_loop:
					bge	$t3,$t4,first_loop
					la	$a1,array
					move	$a2,$t3
					add	$t2,$t2,1
					add	$t3,$t3,1
					jal		swap
					j	second_loop
					
			
					
			
				
				
			