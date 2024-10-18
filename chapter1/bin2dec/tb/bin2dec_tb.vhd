library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.math_pkg.all;
use work.bin2dec_pkg.all;

entity bin2dec_tb is
end entity;

architecture tb of bin2dec_tb is
begin

	stimuli : process
	begin
		-- apply your stimulus here
		-- This is just a template - adjust to your needs!
		-- report to_string(bin_in) & " is decimal:" & to_string(dec_out) & " is BCD " & to_string(bcd_out);
		wait;
	end process;
end architecture;

