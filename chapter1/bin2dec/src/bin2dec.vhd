library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.math_pkg.all;
use work.bin2dec_pkg.all;

entity bin2dec is
	port (
		bin_in   : in  std_ulogic_vector;
		dec_out  : out integer;
		bcd_out  : out std_ulogic_vector
	);
end entity;

architecture beh of bin2dec is 

begin
	main : process (all)
		variable x : natural := 0;
		variable stellen : natural :=0;
		variable num : natural :=0;
		variable i : natural :=0;

	begin 
		for i in 0 to bin_in'length-1 loop
			if(bin_in(i)='1') then 
				x := x + (2**i);
			end if;
		end loop;

		dec_out <= x;


		report "num: " & to_string(x) ;

		--stellen := dec_out'length/4 -1;
		--report "num: " & to_string(stellen) ;
		

		bcd_out <= (others => '0');
		while(x>0) loop
			num := x mod 10;
			bcd_out(4 *i+3 downto i*4)  <= std_ulogic_vector(to_unsigned(num, 4));
			report "num: " & to_string(num) ;
			x := x / 10;
			i:=i+1;
		end loop;
 	end process;
 end architecture;