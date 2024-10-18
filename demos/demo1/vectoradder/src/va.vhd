library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity va is
	port(
		a, b : in std_ulogic_vector;
		sum : out std_ulogic_vector
	);
end entity;

architecture arch of va is
begin

	process (all) is
	begin
		sum <= std_ulogic_vector(unsigned('0' & a) + unsigned('0' & b));
	end process;

end architecture;
