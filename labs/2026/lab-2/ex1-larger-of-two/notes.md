# Ex1: Larger of Two Integers

## What the program does
Loads two integers (`a = 15` and `b = 42`) from the `.data` section, compares them, and prints the larger value (`42`) to the console using a system call.

## Register Usage
| Register | Purpose |
|----------|---------|
| `t0`     | Holds the value of `a` (15) |
| `t1`     | Holds the value of `b` (42) |
| `a0`     | Holds the final value to be printed (the larger number) |
| `a7`     | Holds the syscall code (1 for print integer, 10 for exit) |

## What was harder than expected
Remembering to load the **address** of the variables first using `la` before I could load the **value** using `lw`. Also, understanding that `bgt` (branch if greater than) is used to jump to the block that prints `a`, but if the branch is not taken, the code naturally falls through to print `b`.