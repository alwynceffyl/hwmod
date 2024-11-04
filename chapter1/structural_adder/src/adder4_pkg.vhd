library ieee;
use ieee.std_logic_1164.all;

package adder4_pkg is
	component xor_gate is
		port (
			A : in std_ulogic;
			B : in std_ulogic;

			Z : out std_ulogic
		);
	end component;
	
	component and_gate is
		port (
			A : in std_ulogic;
			B : in std_ulogic;

			Z : out std_ulogic
		);
	end component;

	component or_gate is
		port (
			A : in std_ulogic;
			B : in std_ulogic;

			Z : out std_ulogic
		);
	end component;

	component halfadder is
		port (
			A : in std_ulogic;
			B : in std_ulogic;

			Sum  : out std_ulogic;
			Cout : out std_ulogic
		);
	end component;

	component fulladder is
		port (
			A    : in std_ulogic;
			B    : in std_ulogic;
			Cin  : in std_ulogic;

			Sum  : out std_ulogic;
			Cout : out std_ulogic
		);
	end component;

	component adder4 is
		port (
			A    : in std_ulogic_vector(3 downto 0);
			B    : in std_ulogic_vector(3 downto 0);
			Cin  : in std_ulogic;

			S  : out std_ulogic_vector(3 downto 0);
			Cout : out std_ulogic
		);
	end component;
end package;
