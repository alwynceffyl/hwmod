
# ALU (Arithmetic logic unit)
**Points:** 1 ` | ` **Keywords:** combinational, arithmetic operations

[ALUs](https://en.wikipedia.org/wiki/Arithmetic_logic_unit) are combinational circuits that perform arithmetic and bitwise logic operations on integers.
They are an essential part of every processor.

Your task is to create an ALU with the interface below.
Put your implementation in the provided [`alu.vhd`](src/alu.vhd) file.

```vhdl
component alu is
	generic (
		DATA_WIDTH : positive := 32
	);
	port (
		op   : in  alu_op_t;
		a, b : in  std_ulogic_vector(DATA_WIDTH-1 downto 0);
		r    : out std_ulogic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
		z    : out std_ulogic := '0'
	);
end component;
```

The `alu` component is located in the package [`alu_pkg`](src/alu_pkg.vhd), which also declares the enumerated type used for the `op` input.
To specify the bit-width of the ALU the generic `DATA_WIDTH` it used.
This generic, defines the widths of the two operands `A` and `B` as well as the result output `R`.
Assume that is value is a power of 2.
The ALU also features the output flag `Z`, which is set for certain operations, to e.g., indicate if the result of a subtraction is zero.

The operations of the ALU are defined in the following table:

|op       | R                       | Z          |
|---------|-------------------------|------------|
|ALU_NOP  | B                       | don't care |
|ALU_SLT  | A < B ? 1 : 0, signed   | not R(0)   |
|ALU_SLTU | A < B ? 1 : 0, unsigned | not R(0)   |
|ALU_SLL  | A sll B(x downto 0)     | don't care |
|ALU_SRL  | A srl B(x downto 0)     | don't care |
|ALU_SRA  | A sra B(x downto 0)     | don't care |
|ALU_ADD  | A + B, signed           | don't care |
|ALU_SUB  | A - B, signed           | A = B      |
|ALU_AND  | A and B                 | don't care |
|ALU_OR   | A or B                  | don't care |
|ALU_XOR  | A xor B                 | don't care |

Use `'-'` (i.e., the IEEE 1164 value for don't care) for the "don't care" entries of the output `Z` and not arbitrary values.
Note that the shift operations `sll` (shift left logical), `srl` (shift right logical) and `sra` (shift right arithmetical) can be implemented conveniently with the functions `shift_left()` and `shift_right()` from the `numeric_std` package.
The variable `x` used in the table must be derived from the `DATA_WIDTH` generic (e.g., for 32 bits its value is 4). You might want to use the [math_pkg](../../lib/math/doc.md) for that purpose.

## Submission

Make sure that your `alu` is implemented correctly. For that purpose you can use the [alu_tb](tb/alu_tb.vhd) testbench skeleton.

After the submission we will test your code in order to find bugs.

[Return to main page](../../readme.md)
