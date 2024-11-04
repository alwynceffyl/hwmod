library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.math_pkg.all;
use work.bin2dec_pkg.all;

entity bin2dec_tb is
end entity;


architecture test of bin2dec_tb is
	constant CONSTRAINED_0 : natural :=4;
	constant CONSTRAINED_1 : natural :=8;
	constant CONSTRAINED_2 : natural :=16;

	signal bin_in_0   :   std_ulogic_vector(CONSTRAINED_0-1 downto 0) :=(others => '0');
	signal dec_out_0  :  integer;
	signal bcd_out_0  :  std_ulogic_vector(log10c(2**(CONSTRAINED_0))*4 -1 downto 0):=(others => '0');


	signal bin_in_1   :   std_ulogic_vector(CONSTRAINED_1-1 downto 0):=(others => '0');
	signal dec_out_1  :  integer;
	signal bcd_out_1  :  std_ulogic_vector(log10c(2**(CONSTRAINED_1))*4 -1 downto 0):=(others => '0');

	signal bin_in_2   :   std_ulogic_vector(CONSTRAINED_2-1 downto 0):=(others => '0');
	signal dec_out_2  :  integer;
	signal bcd_out_2  :  std_ulogic_vector(log10c(2**(CONSTRAINED_2))*4 -1 downto 0):=(others => '0');


	function calcbcd (bcd : std_ulogic_vector ) return integer is
		variable dec : integer :=0;
		begin
			for i in 0 to bcd'length/4-1 loop
					dec := dec+ to_integer(unsigned(bcd(4 *i+3 downto i*4))) * 10**i;
			end loop;
	return dec;
	end function;

begin
	uut_0 : entity work.bin2dec
	port map (
		bin_in => bin_in_0,
		dec_out => dec_out_0,
		bcd_out => bcd_out_0
	);

	uut_1 : entity work.bin2dec
	port map (
		bin_in => bin_in_1,
		dec_out => dec_out_1,
		bcd_out => bcd_out_1
	);

	uut_2 : entity work.bin2dec
	port map (
		bin_in => bin_in_2,
		dec_out => dec_out_2,
		bcd_out => bcd_out_2
	);

	stimuli : process
	begin
		bin_in_0 <= std_ulogic_vector(to_unsigned(3, CONSTRAINED_0));
		bin_in_1 <= std_ulogic_vector(to_unsigned(233, CONSTRAINED_1));
		bin_in_2 <= std_ulogic_vector(to_unsigned(3231, CONSTRAINED_2));
		wait for 10 ns;

		assert dec_out_0 = 3 report "dec_out :=" & to_string(dec_out_0) severity error;
		assert dec_out_0 = calcbcd(bcd_out_0) report "bcd_out:=" & to_string(calcbcd(bcd_out_0)) severity error;
		assert dec_out_1 = 233 report "dec_out :=" & to_string(dec_out_1) severity error;
		assert dec_out_1 = calcbcd(bcd_out_1) report "bcd_out:=" & to_string(calcbcd(bcd_out_1)) severity error;
		assert dec_out_2 = 3231 report "dec_out :=" & to_string(dec_out_2) severity error;
		assert dec_out_2 = calcbcd(bcd_out_2) report "bcd_out:=" & to_string(calcbcd(bcd_out_2)) severity error;


		wait;
	end process;
end architecture;

