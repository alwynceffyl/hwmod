library ieee;
use ieee.std_logic_1164.all;
use work.adder4_pkg.all;

entity and_gate is
	port (
		A : in std_ulogic;
		B : in std_ulogic;

		Z : out std_ulogic
	);
end entity;

architecture beh of and_gate is
	begin
		Z <= (A and B);
end architecture;
	
	
	