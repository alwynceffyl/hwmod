library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.math_pkg.all;
use work.bin2dec_pkg.all;

entity bin2dec_tb is
end entity;


architecture test of bin2dec_tb is
	constant CONSTRAINED : natural :=8;
	signal bin_in   :   std_ulogic_vector(CONSTRAINED-1 downto 0);
	signal dec_out  :  integer;
	signal bcd_out  :  std_ulogic_vector(log10c(2**(CONSTRAINED +1))*4 -1 downto 0);
begin
	uut : entity work.bin2dec
	port map (
		bin_in => bin_in,
		dec_out => dec_out,
		bcd_out => bcd_out
	);

	stimuli : process
	begin
	report "here it begins";
		bin_in <= std_ulogic_vector(to_unsigned(249, CONSTRAINED));
		wait for 10 ns;
		report "dec_out:=" & to_string(dec_out);
		report "bdc_out:=" & to_string(bcd_out);
		wait;
	end process;
end architecture;

