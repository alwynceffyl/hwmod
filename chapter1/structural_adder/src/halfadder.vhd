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

architecture beh of halfadder is
begin
	and_gate_inst : entity work.and_gate
	port map (a, b, cout);
	
	xor_gate_inst : entity work.xor_gate
	port map (a, b, sum);
end architecture;
	
	