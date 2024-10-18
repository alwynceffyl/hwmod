library ieee;
use ieee.std_logic_1164.all;
use work.adder4_pkg.all;

entity halfadder is
	port (
		A : in std_ulogic;
		B : in std_ulogic;

		Sum  : out std_ulogic;
		Cout : out std_ulogic
	);
end entity;

-- implement the halfadder architecture
