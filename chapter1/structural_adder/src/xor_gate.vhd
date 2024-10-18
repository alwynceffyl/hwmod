library ieee;
use ieee.std_logic_1164.all;
use work.adder4_pkg.all;

entity xor_gate is
	port (
		A : in std_ulogic;
		B : in std_ulogic;

		Z : out std_ulogic
	);
end entity;

-- implement the xor_gate architecture
