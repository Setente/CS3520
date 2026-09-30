.data
array: .word 2, 5, 8, 11, 14, 17, 20
n:     .word 7

.text
main:
    la t0, array       # t0 = base address of array
    lw t1, n           # t1 = n (7)
    li t2, 0           # t2 = i (loop counter)
    li t3, 0           # t3 = count of evens

loop:
    bge t2, t1, end_loop  # if i >= n, exit loop

    # Load array[i] into t5
    slli t4, t2, 2     # t4 = i * 4 (since each word is 4 bytes)
    add t4, t0, t4     # t4 = address of array[i]
    lw t5, 0(t4)       # t5 = array[i]

    # Test if array[i] is even using ANDI
    andi t6, t5, 1     # t6 = t5 & 1 (t6 = 1 if odd, 0 if even)
    bne t6, x0, skip   # if t6 != 0 (odd), skip the count increment

    addi t3, t3, 1     # count++ (only if even)

skip:
    addi t2, t2, 1     # i++
    j loop             # jump back to start of loop

end_loop:
    mv a0, t3          # move count to a0 for printing
    li a7, 1           # syscall 1 = print integer
    ecall
    
    li a7, 10          # syscall 10 = exit
    ecall