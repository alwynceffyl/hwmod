library ieee;
use ieee.std_logic_1164.all;
use work.adder4_pkg.all;

entity adder4 is
	port (
		A    : in std_ulogic_vector(3 downto 0);
		B    : in std_ulogic_vector(3 downto 0);
		Cin  : in std_ulogic;

		S    : out std_ulogic_vector(3 downto 0);
		Cout : out std_ulogic
	);
end entity;

architecture arch of adder4 is
	signal c : std_ulogic_vector(4 downto 0);
begin
	c(0) <= Cin;
	Cout <= c(4);

	gen1 : for i in 3 downto 0 generate
		full1 : entity work.fulladder
		port map (
			A => A(i),
			B => B(i),
			Cin => c(i),
			Sum => S(i),
			Cout => c(i+1)
		);
	end generate;

end arch ;