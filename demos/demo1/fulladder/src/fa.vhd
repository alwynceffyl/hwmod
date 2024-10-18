library ieee;
use ieee.std_logic_1164.all;

entity fa is
	port(
		a, b, cin  : in std_ulogic;
		sum, cout : out std_ulogic
	);
end entity;

architecture arch of fa is
begin

	process (a, b, cin) is
		variable x, y, z : std_ulogic;
	begin
		x := a and b;
		y := a xor b;
		z := x and cin;
		sum <= x xor cin;
		cout <= y or z;
	end process;

end architecture;
