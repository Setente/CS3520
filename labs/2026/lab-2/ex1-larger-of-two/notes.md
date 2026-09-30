# Ex2: Sum of First N Integers

## What the program does
Calculates the sum of the first N integers (where N = 10) using a counted loop, and prints the result (55).

## Register Usage
| Register | Purpose |
|----------|---------|
| `t0`     | Holds N (10) |
| `t1`     | Holds the running total (sum) |
| `t2`     | Loop counter (i) |
| `a0`     | Holds the final sum to be printed |
| `a7`     | Holds the syscall code (1 for print, 10 for exit) |

## What was harder than expected
Translating the `for (i = 1; i <= N; i++)` loop into assembly. I had to initialize `i` to 1, use `bgt` to exit the loop when `i > N`, and remember to add the jump instruction (`j loop`) at the bottom so it repeats.