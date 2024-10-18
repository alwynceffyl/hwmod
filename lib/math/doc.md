
# Mathematical Support Package

The mathematical support package `math_pkg` provides some convenient mathematical functions that would
otherwise require multiple function calls and / or type casts.

## Dependencies
* None

## Required Files
 * `math_pkg.vhd`

## Supported Functions

* `function log2c(constant value : in integer) return integer;` Calculates the logarithm dualis (base 2) of the integer operand and rounds it up to the next integer. Its main usage is to calculate the minimum required number of bits to store a certain integer value. This is often used to determine the address width (i.e., size) of some memory.

* `function log10c(constant value : in integer) return integer;`
Calculates the logarithm base 10 of the integer operand and rounds it up to the next integer.

* `function max/min(constant value1, value2 : in integer) return integer;`
Determines the maximum / minimum of the two integer operands and returns it.
These functions are required, because after all these years Quartus still does not support the build-inminimum / maximum  functions.

* `function max3/min3(constant value1, value2, value3 : in integer) return integer;`
Determines the maximum / minimum of the three integer operands and returns it.
