## Compute (13x - 8xy + 15)/5
##
##
.data
    x: .word 5
    y: .word -5
    answer: .word 0
    remainder: .word 0

.text
.globl main

## $8 is for 3rd term and denominator and x
## $9 is for y and final result
## $10 loading and storing values
## $11 hold result

main:
    lui, $10, 0x1000    # base register init
    lw $8, 0($10)       # $8 is value of x
    lw $9, 4($10)       # $9 is value of y
    addi $11, $0, 13    # first term is added 
    mult $11, $8        # multpltied by x 
    mflo $11            # 13x
    
    sw $11, 8($10)      # saves word 13x 
    addi $11, $0, -8    # second term is added 
    mult $11, $8        # multiplies $8 and $11
    mflo $11            #    
    mult $11, $9        # multiplies $9 $11
    lw $9, 8($10)       # loads $9 with 13x
    mflo $11            # $11 = -8xy
    add $11, $9, $11    # adds $11 and $9
    sw $11, 8($10)      # saves word 13x - 8xy
    
    lw $9, 4($10)       # loads y into $9
    addi $8, $0, 15     # add last term to $8
    add $11, $11, $8    # 13x - 8xy + 15
    addi $8, $0, 5      # 5 into $8
    div $11, $8         # 13x - 8xy + 15/5 
    
    mflo $9             # result
    sw $9, 8($10)       # stores result at 0x10000008
    mfhi $9
    sw $9, 12($10)      # store remainder at 0x10000012
    