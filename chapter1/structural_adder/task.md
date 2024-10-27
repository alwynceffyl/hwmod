
# Structural Adder
**Points:** 1 ` | ` **Keywords:** structural modeling, combinational

Your task is to create a 4-bit ripple-carry adder using **structural modeling**.
Start by checking out the [Wikipedia article](https://en.wikipedia.org/wiki/Adder_(electronics)) about adders and studying the [`adder4_pkg.vhd`](src/adder4_pkg.vhd) package file and the components declared in it.

Then implement fitting entities and architectures for each component in the `adder4_pkg` in the following order:

- Create implementations (i.e., entities and architectures) for the basic logic gates (i.e., for the `and_gate`, the `xor_gate` and the `or_gate` components) in their respectively named files in `src/` (e.g., [and_gate.vhd](src/and_gate.vhd)).

- Now, implement the `halfadder` in [halfadder.vhd](src/halfadder.vhd) by creating instances of the basic gates and connect them accordingly.

- Then, instantiate and connect two half adders and an OR gate in order to build the `fulladder`. Put the respective code in [fulladder.vhd](src/fulladder.vhd).

As a reference, consider the following circuit diagram of a full adder below:

![Full Adder](.mdata/fulladder.svg)

- By connecting multiple full adders you can finally create a [4-bit Ripple-carry adder](https://en.wikipedia.org/wiki/Adder_(electronics)#Ripple-carry_adder).
This adder shall be implemented as the `adder4` entity in [adder.vhd](src/adder4.vhd).


# Testbench


Implement an exhaustive testbench for your `adder4` entity.
I.e., test your implementation by applying all possible input combinations for `A`, `B` and `Cin` while checking if `Sum` and `Cout` (set when the sum of `A` and `B` exceeds 4 bits) are correct.

A template for this testbench is already provided in [`tb/adder4_tb.vhd`](tb/adder4_tb.vhd).

This template already provides you with a `test_values` procedure skeleton.
Implement this procedure such that it applies its integer parameters `value_a`, `value_b` and `value_cin` to the UUT and then checks if the generated outputs are correct.
Use assertions for these checks.
If the assertions fail they shall generate an **Error** with the respective messages being of the following form (for `value_a=4`, `value_b=3`, `value_cin=0`)

```vhdl
  "Testcase 4 + 3 FAILED! Expected 7 but got 8"
  "Testcase 4 + 3 FAILED! Expected Cout 0 but got Cout 1"
```

You must **not** modify the signature of this procedure!


[Return to main page](../../readme.md)
