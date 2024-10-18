library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity va_tb is
end entity;

architecture tb of va_tb is
	signal a, b : std_ulogic_vector(7 downto 0);
	signal sum : std_ulogic_vector(8 downto 0);
begin

	stimulus : process is
	begin
		for i in 0 to 2**a'length-1 loop
			a <= std_logic_vector(to_unsigned(i, a'length));
			for j in 0 to 2**a'length-1 loop
				b <= std_logic_vector(to_unsigned(j, a'length));
				wait for 1 ns;
				assert to_integer(unsigned(sum)) = i+j report "FAIL! Expected " & to_string(i+j) & " but got " & to_string(to_integer(unsigned(sum)));
			end loop;
		end loop;
		wait;
	end process;

	dut : entity work.va
	port map(
		a => a,
		b => b,
		sum => sum
	);

end architecture;
