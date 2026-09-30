.data
N:      .word 10

.text
.globl main

main:
    # Load N into t0
    la t0, N
    lw t0, 0(t0)

    # Initialize sum (t1) = 0
    li t1, 0

    # Initialize i (t2) = 1
    li t2, 1

loop:
    # if i > N (t2 > t0), exit the loop
    bgt t2, t0, end_loop

    # sum = sum + i (t1 = t1 + t2)
    add t1, t1, t2

    # i = i + 1 (t2 = t2 + 1)
    addi t2, t2, 1

    # Jump back to the start of the loop
    j loop

end_loop:
    # Print the sum (which is in t1)
    mv a0, t1       # Move sum to a0 for printing
    li a7, 1        # Syscall 1 = print integer
    ecall

    # Exit the program
    li a7, 10       # Syscall 10 = exit
    ecall