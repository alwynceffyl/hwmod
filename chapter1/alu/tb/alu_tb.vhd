library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.math_pkg.all;
use work.alu_pkg.all;

entity alu_tb is
end entity;

architecture test of alu_tb is
		constant DATA_WIDTH : natural := 32;
		signal op :  alu_op_t;
		signal a, b :   std_ulogic_vector(DATA_WIDTH-1 downto 0);
		signal r :  std_ulogic_vector(DATA_WIDTH-1 downto 0);
		signal z    : std_ulogic;
begin
	uut : entity work.alu
	generic map (
			DATA_WIDTH => DATA_WIDTH
	)

	port map (
		a => a,
		b => b,
		r => r,
		z => z,
		op => op
	);

	stimuli : process
	begin
	report "here it begins";
		op <= ALU_NOP;
		a <= std_ulogic_vector(to_unsigned(0, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(0, DATA_WIDTH));
		wait for 10 ns;
		assert r  =  b  report "error in r should be b, " & to_string(to_integer(unsigned(b))) severity error;
		assert z  =  '-'  report "error in z should be -,  " & to_string(z) severity error;

		op <= ALU_SLT;
		a <= std_ulogic_vector(to_unsigned(-5, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(5, DATA_WIDTH));
		wait for 10 ns;
		assert  to_integer(unsigned(r)) = 1 report "ALU_SLT result r: " & to_string(to_integer(unsigned(r))) severity error;
		assert  z = '0'  report "ALU_SLT result z: " & to_string(not r(0)) severity error;

		op <= ALU_SLTU;
		a <= std_ulogic_vector(to_unsigned(2, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(5, DATA_WIDTH));
		wait for 10 ns;
		assert  to_integer(unsigned(r)) = 1 report "ALU_SLT result r: " & to_string(to_integer(unsigned(r))) severity error;
		assert  z = '0'  report "ALU_SLT result z: " & to_string(not r(0)) severity error;


		op <= ALU_SLT;
		a <= std_ulogic_vector(to_unsigned(2, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(5, DATA_WIDTH));
		wait for 10 ns;
		assert  to_integer(unsigned(r)) = 1 report "ALU_SLT result r: " & to_string(to_integer(unsigned(r))) severity error;
		assert  z = '0'  report "ALU_SLT result z: " & to_string(not r(0)) severity error;
		wait;
	end process;
end architecture;

