library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package sram_pkg is

	subtype byteena_t is std_ulogic_vector(1 downto 0);
	subtype addr_t is std_ulogic_vector(19 downto 0);
	subtype word_t is std_logic_vector(15 downto 0);
	type memory_t is array(natural range<>) of word_t;

	-- datasheet page 9 (https://www.issi.com/WW/pdf/61WV102416ALL.pdf)
	-- Read times
	constant TRC : time := 10 ns;
	constant TAA : time := 10 ns;
	constant TOHA  : time := 2.5 ns;
	constant TACE : time := 10 ns;
	constant TDOE : time := 6.5 ns;
	constant THZOE : time := 4 ns;
	constant TLZOE : time := 0 ns;
	constant THZCE : time := 4 ns;
	constant TLZCE : time := 3 ns;
	constant TBA : time := 6.5 ns;
	constant THZB : time := 3 ns;
	constant TLZB : time := 0 ns;
	constant TPU : time := 0 ns;
	constant TPD : time := 10 ns;

	-- Write times
	constant TWC : time := 10 ns;
	constant TSCE : time := 8 ns;
	constant TAW : time := 8 ns;
	constant THA : time := 0 ns;
	constant TSA : time := 0 ns;
	constant TPWB : time := 8 ns;
	constant TPWE1 : time := 8 ns;
	constant TPWE2 : time := 10 ns;
	constant TSD : time := 6 ns;
	constant THD : time := 0 ns;
	constant THZWE : time := 5 ns;
	constant TLZWE : time := 2 ns;

end package;
