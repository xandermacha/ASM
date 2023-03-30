## Compute 3x^4 - 2x^3 + 10x^2 - 13x + 14 using Horner's Method
##
## $9 is x
## $10 is accumulates result
## $11 is 2 
## $12 is 13

.text
.globl main
	
main:
    addiu $9, $0, -3    # initializes x 
    addiu $10, $0, 3    # initializes accumulator
    ori $11, $0, 2      # adds the first coefficent to $11
    ori $12, $0, 13     # adds last coefficent to $12
    
    mult $10, $9        # 3*x = 3x
    mflo $10            # moves the 3x to $10
    subu $10, $10, $11  # 3x - 2
    
    mult $10, $9        # $9 * sum of $10
    mflo $10            # moves result to $10
    addiu $10, $10, 10  # $10 + 10
    
    mult $10, $9        # sum of $10 * x
    mflo $10            # moves result into $10
    subu $10, $10, $12  # $10 - 13
    
    mult $10, $9        # $10 * $9
    mflo $10            # moves result into $10 
    
    addiu $10, $10, 14  # $10 + 14 giving final result