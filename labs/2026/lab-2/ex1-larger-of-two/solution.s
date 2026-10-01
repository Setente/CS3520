.data
a:  .word 15
b:  .word 42

.text
.globl main

main:
    # Load a into t0
    la t0, a
    lw t0, 0(t0)

    # Load b into t1
    la t1, b
    lw t1, 0(t1)

    # Compare: if a > b, branch to print_a
    bgt t0, t1, print_a

    # Otherwise, print b
    mv a0, t1
    j print_result

print_a:
    mv a0, t0

print_result:
    # Print integer
    li a7, 1
    ecall

    # Exit
    li a7, 10
    ecall