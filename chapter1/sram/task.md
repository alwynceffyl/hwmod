
# Sort
**Points:** 1 ` | ` **Keywords:** subprograms, testbench, reading specifications

In this task you will write a testbench for a simplified model of the *ISSI IS61WV102416* SRAM (which is the one on the FPGA board we will use later during this course).
Start by studying its [datasheet](https://www.issi.com/WW/pdf/61WV102416ALL.pdf).

In [sram.vhd](src/sram.vhd) you can find a simple model of this SRAM that supports the read cycles 1 and 2 (datasheet page 11), as well as the write cycles 1, 2 and 3 (pages 14 and 15).

**Important**: You must not change this model.

Your task is to implement procedures that perform any one of the read and any one of the write cycles (i..e, you only have to implement read cycle 1 **or** 2 and likewise for the write cycles).
You are already provided with a skeleton file in [sram_tb.vhd](tb/sram_tb.vhd) that contains procedure stubs for your implementation.
Your testbench shall write the sequence `x"BADC0DEDC0DEBA5E"` to the memory addresses `0-3` using your write procedure.
It shall then read the written sequence using your read procedure.
Assert that the data read is correct.

You can find the types used by the `sram` entity, as well as the timing values from the datasheet, in the [sram_pkg](src/sram_pkg.vhd).

Generate a wave file for the QuestaSim waveform viewer such that all accesses are visible when running `make sim_gui`.

**Hints**:

- The `byteen` signal of the procedures is a vector that enables the reading / writing for the bytes `IO(7 downto 0)` (if `byteen(0)` is set), respectively `IO(15 downto 8)` (if `byteen(1)` is set).

- The naming convention `_N` for signals / ports denotes an **active low** signal (e.g., `OE_N` has the semantic that the output is enabled when `OE_N` is **low** (`'0'`)).

- You might want to add a pause between different accesses to make the clearly visible (i.e., wait for some time).

- Make use of the timing constants in the [sram_pkg](src/sram_pkg.vhd). You can find their meaning on datasheet pages 9 (for read cycles) and 12 (for write cycles).

- Note that the `IO` port of the `sram` entity is of mode `inout`. Thus reads and writes happen via this port. Ensure that you apply a suitable value in your testbench during reads.


[Return to main page](../../readme.md)
