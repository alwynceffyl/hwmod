
# Binary to Decimal
**Points:** 2 ` | ` **Keywords:** arithmetic operations, unconstrained types


Your task is to create a binary-to-decimal converter with unconstrained input and output vectors.
Make sure your implementation works for arbitrary sizes of the input vector `bin_in`.
Put your implementation in [src/bin2dec.vhd].

```vhdl
component bin2dec is
	port (
		bin_in     : in  std_ulogic_vector;
		dec_out    : out integer;
		bcd_out    : out std_ulogic_vector
	);
end component;
```

**Important**: You are not allowed to change the component's interface, and you are not supposed to add generics.

For example, if the input `bin_in` is "1101_1011" then `dec_out` shall output 219 and `bcd_out` "0010_0001_1001"

For the binary to integer conversion, you are **not** allowed to use the built-in conversion function `to_integer`.
You must implement the conversion yourself and write the result to the `dec_out` vector.

Additionally, you have to implement [BCD](https://en.wikipedia.org/wiki/Binary-coded_decimal) encoding for the input `bin_in`.
Note that we recommend converting the input to a decimal first.
Write the result to the `bcd_out` vector.

Determine vector bounds (especially for the BCD output vector) according to the size of the input vector `bin_in`.
To achieve this recall the attributes of array types.
Also, you might want to have a look at the functions provided by the [math_pkg](../../lib/math/math.md) package.

**Hint**: Determine how many decimal digits the input vector can possibly produce.
The length of the `bcd_out` vector is four times the number of needed digits for the decimal number.

## Testbench

Create a testbench for the `bin2dec` entity in the [bin2dec_tb.vhd](tb/bin2dec_tb.vhd).
Test that your implementation works for arbitrary input sizes.

Ensure your testbench:
 * Runs without any warnings or errors.
 * Includes assertions to verify that the outputs are correct for given inputs.


[Return to main page](../../readme.md)
