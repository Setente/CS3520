# Ex3: Count Even Numbers in an Array

## What the program does
Loops through an array of 7 integers, counts how many are even, and prints the result (4).

## Register Usage
| Register | Purpose |
|----------|---------|
| `t0`     | Base address of the array |
| `t1`     | N (array length, 7) |
| `t2`     | Loop counter (i) |
| `t3`     | Count of even numbers |
| `t4`     | Calculated address of array[i] |
| `t5`     | Value of array[i] |
| `t6`     | Bitwise AND result (odd/even check) |
| `a0`     | Final count to be printed |
| `a7`     | Syscall code (1 for print, 10 for exit) |

## What was harder than expected
Using `andi` to check if a number is even. I had to remember that `andi t6, t5, 1` leaves a 1 if the number is odd and 0 if it's even. Then `bne t6, x0, skip` skips the increment for odd numbers. Also, multiplying `i` by 4 (`slli`) to get the correct byte offset for array indexing.