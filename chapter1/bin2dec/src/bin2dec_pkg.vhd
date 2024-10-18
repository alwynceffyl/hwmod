library ieee;
use ieee.std_logic_1164.all;

package bin2dec_pkg is
	component bin2dec is
		port (
			bin_in     : in  std_ulogic_vector;
			dec_out    : out integer;
			bcd_out    : out std_ulogic_vector
		);
	end component;
end package;


