library ieee;
use ieee.std_logic_1164.all;
use work.adder4_pkg.all;

entity fulladder is
	port (
		A    : in std_ulogic;
		B    : in std_ulogic;
		Cin  : in std_ulogic;

		Sum  : out std_ulogic;
		Cout : out std_ulogic
	);
end entity;

-- implement fulladder architecture
