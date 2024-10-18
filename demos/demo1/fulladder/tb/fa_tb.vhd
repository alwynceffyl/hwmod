library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fa_tb is
end entity;

architecture tb of fa_tb is
	signal a, b, cin, sum, cout : std_ulogic;
begin

	stimulus : process is
		variable in_vec : std_ulogic_vector(2 downto 0);
	begin
		for i in 0 to 2**in_vec'length-1 loop
			in_vec := std_logic_vector(to_unsigned(i, in_vec'length));
			a <= in_vec(0);
			b <= in_vec(1);
			cin <= in_vec(2);
			wait for 1 ns;
		end loop;
		wait;
	end process;

	dut : entity work.fa
	port map(
		a => a,
		b => b,
		cin => cin,
		sum => sum,
		cout => cout
	);

end architecture;
