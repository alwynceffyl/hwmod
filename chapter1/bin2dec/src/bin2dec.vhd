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
	main : process (bin_in)
		variable temp : natural := 0;
		variable num : natural :=0;
		variable l : natural :=0;

		pure function bintodec (bin : std_ulogic_vector ) return natural is
			variable dec : natural :=0;
			begin
				for i in 0 to bin'length-1 loop
					if(bin(i)='1') then 
						dec := dec + (2**i);
					end if;
				end loop;
		return dec;
		end function;
		
	begin 
		

		temp := bintodec(bin_in);
		dec_out <= temp;		
		bcd_out <= (others => '0');
		while(temp>0) loop
			num := temp mod 10;
			bcd_out(4 *l+3 downto l*4)  <= std_ulogic_vector(to_unsigned(num, 4));
			temp := temp / 10;
			l:=l+1;
		end loop;
 	end process;
 end architecture;