## determine Max value from 3 variables
## $8, $9 used for variable assignment
## $10 is base register 
## $11 holds result for A < B 
## $12 holds 1 for beq operation

.data
    x:  .word  1
    y:  .word  5
    z:  .word  4
    max:.word  0

.text
.globl main
main:
    
    lui $10, 0x1000         # initializes base register
    lw $8, 0($10)           # puts x into $8
    lw $9, 4($10)           # puts y into $9
    ori $12,$0,1            # puts 1 into $12 
    
    
    slt $11, $8, $9         # checks if x < y
    
    beq $11, $12, first     # if x < y then goes to first 
    sll $0, $0, $0          # load delay 
    lw $9, 8($10)           # loads z into $9
    sll $0, $0, $0          # load delay
    slt $11, $8, $9         # checks if x < z
    
    beq $11, $12, second    # if x < z jumps to second
    sll $0, $0, $0          # load delay
    
    sw $8, 12($10)          # saves $8 to max
    j end                   # jumps to end
    sll $0, $0, $0          # load delay
    
first:                      # for if x < y           
    lw $8, 8($10)           # loads z into $8
    sll $0, $0, $0          # load delay
    slt $11, $8, $9         # checks if z < y
    beq $11,$12, third      # if z < y jumps to third
    sll $0, $0, $0          # load delay
   
    sw $8, 12($10)          # saves $8 to max 
    sll $0, $0, $0          # load delay 
    j end                   # jumps to end
    sll $0, $0, $0          # load delay
    
second: 
    sll $0,$0,$0            # load delay 
    sw $9, 12($10)          # saves $9 to max
    sll $0, $0, $0          # load delay 
        
    j end                   # jumps to end
    sll $0, $0, $0          # load delay
third:
    sll $0,$0,$0            # load delay 
    sw $9, 12($10)          # saves $9 to max
    sll $0, $0, $0          # load delay
        
    j end                   # jumps to end
    sll $0, $0, $0          # load delay
    
end:                        # end branch
    sll $0, $0, $0          