
# Vectoradder
**Points:** - ` | ` **Keywords:** testbench, control flow

Implement a testbench in [va_tb.vhd](tb/va_tb.vhd) for the **unsigned** vector adder provided in [va.vhd](src/va.vhd).
Below you can find the entity declaration of this adder.

```vhdl
entity va is
	port(
		a, b : in std_ulogic_vector;
		sum : out std_ulogic_vector
	);
end entity;
```

Your testbench shall exhaustively test all possible combinations for 8-bit wide inputs.
Use an `assert` statement to automatically check whether the adder is correct.

Furthermore, use the waveform viewer of QuestaSim to view the signal traces of your testbench.

[Return to main page](../../../readme.md)
