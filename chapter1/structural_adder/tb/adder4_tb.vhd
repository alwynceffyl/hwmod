library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.adder4_pkg.all;

entity adder4_tb is
end entity;

architecture tb of adder4_tb is
	-- You might want to add some signals
	signal A, B, Sum: std_ulogic_vector(3 downto 0);
	signal Cin, Cout: std_ulogic;
begin

	-- Instantiate the unit under test (adder4)
	adder4_inst:  adder4
	port map (
	  A    => A,
	  B    => B,
	  Cin  => Cin,
	  S  => Sum,
	  Cout => Cout
	);
	-- Stimulus process
	stimulus: process
		-- implement this procedure!
		procedure test_values(value_a, value_b, value_cin : integer) is
			variable a_var, b_var: std_ulogic_vector(3 downto 0);
			variable cin_var : std_logic;
		begin
			a_var := std_ulogic_vector(to_unsigned(value_a, 4));
			b_var := std_ulogic_vector(to_unsigned(value_b, 4));

			if value_cin > 0 then 
				cin_var := '1';
			else
				cin_var := '0';
			end if; 
			A <= a_var;
			B <= b_var;
			Cin <= cin_var;
			wait for 1 ns;
			assert (value_a + value_b + value_cin) = to_integer(unsigned(Cout & Sum)) report "Error" severity error;
			-- assert that Sum is correct
			-- assert Cout is correct
		end procedure;
	begin
		report "simulation start";
		for x in 15 downto 0 loop
			for y in  15 downto 0 loop
				for z in 1 downto 0 loop
		-- Apply test stimuli
					test_values(x,y,z);
				end loop;
			end loop;
		end loop;

		report "simulation end";
		-- End simulation
		wait;
	end process;
end architecture;

