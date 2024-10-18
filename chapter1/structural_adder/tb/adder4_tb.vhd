library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.adder4_pkg.all;

entity adder4_tb is
end entity;

architecture tb of adder4_tb is
	-- You might want to add some signals
begin

	-- Instantiate the unit under test (adder4)

	-- Stimulus process
	stimulus: process
		-- implement this procedure!
		procedure test_values(value_a, value_b, value_cin : integer) is
		begin
			-- assert that Sum is correct
			-- assert Cout is correct
		end procedure;
	begin
		report "simulation start";
		
		-- Apply test stimuli
		test_values(0,0,0);

		report "simulation end";
		-- End simulation
		wait;
	end process;
end architecture;

