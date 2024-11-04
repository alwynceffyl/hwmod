library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.math_pkg.all;
use work.alu_pkg.all;

entity alu_tb is
end entity;

architecture test of alu_tb is
		constant DATA_WIDTH : natural := 16;
		signal op :  alu_op_t;
		signal a, b :   std_ulogic_vector(DATA_WIDTH-1 downto 0);
		signal r :  std_ulogic_vector(DATA_WIDTH-1 downto 0);
		signal z    : std_ulogic;


		procedure checkOpt is
			variable dec : natural :=0;
			begin
				case op is 
				when ALU_NOP => 
					assert r  =  b  report "error in NOP, r should be b, " & to_string(to_integer(unsigned(b))) severity error;
					assert z  =  '-'  report "error in NOP,  z should be -,  " & to_string(z) severity error;

				when ALU_SLT  => 
				assert to_integer(signed(r))  =  0  report "error in SLT, r should be 0,  " & to_string(to_integer(signed(r))) severity error;
				assert z  =  not r(0)  report "error in SLT, z should be not r(0),  " & to_string(z) severity error;

				when ALU_SLTU  => 
				assert to_integer(unsigned(r))  =  0  report "error in SLTU, r should be 0,  " & to_string(to_integer(unsigned(r))) severity error;
				assert z  =  not r(0)  report "error in SLTU, z should be not r(0),  " & to_string(z) severity error;
				
				when ALU_SLL  => 
				assert to_integer(unsigned(r))  =  16  report "error in ALU_SLL, r should be 8,  " & to_string(to_integer(unsigned(r))) severity error;
				assert z  =  '-'  report "error in ALU_SLL, z should be  - ,  " & to_string(z) severity error;
				
				when ALU_SRL  => 
				assert to_integer(unsigned(r))  =  4  report "error in ALU_SRL, r should be 4,  " & to_string(to_integer(unsigned(r))) severity error;
				assert z  =  '-'  report "error in ALU_SRL, z should be  - ,  " & to_string(z) severity error;

				when ALU_ADD  => 
				assert to_integer(signed(r))  =  75  report "error in ALU_ADD, r should be 75,  " & to_string(to_integer(unsigned(r))) severity error;
				assert z  =  '-'  report "error in ALU_SRL, z should be  - ,  " & to_string(z) severity error;

				when ALU_SUB  => 
				assert to_integer(signed(r))  =  74  report "error in ALU_SUB, r should be 74,  " & to_string(to_integer(unsigned(r))) severity error;
				assert z  =  '0'  report "error in ALU_SUB, z should be  0 ,  " & to_string(z) severity error;

				when ALU_AND => 
				assert to_integer(unsigned(r))  =  4  report "error in ALU_AND, r should be 4,  " & to_string(to_integer(unsigned(r))) severity error;
				assert z  =  '-'  report "error in ALU_SUB, z should be - ,  " & to_string(z) severity error;

				when ALU_OR => 
				assert to_integer(unsigned(r))  =  14  report "error in ALU_OR, r should be 4,  " & to_string(to_integer(unsigned(r))) severity error;
				assert z  =  '-'  report "error in ALU_OR, z should be  - ,  " & to_string(z) severity error;


				when ALU_XOR => 
				assert to_integer(unsigned(r))  = 6  report "error in ALU_XOR, r should be 4,  " & to_string(to_integer(unsigned(r))) severity error;
				assert z  =  '-'  report "error in ALU_XOR, z should be  0 ,  " & to_string(z) severity error;

				when others => NULL;
				end case;
		end procedure;

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
		report "checking the nop operation";
		op <= ALU_NOP;
		a <= std_ulogic_vector(to_unsigned(0, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(0, DATA_WIDTH));
		wait for 10 ns;
		checkOpt;

		report "checking the slt operation";
		op <= ALU_SLT;
		a <= std_ulogic_vector(to_signed(255, DATA_WIDTH));
		b <= std_ulogic_vector(to_signed(126, DATA_WIDTH));
		wait for 10 ns;
		checkOpt;

		report "checking the sltu operation";
		op <= ALU_SLTU;
		a <= std_ulogic_vector(to_unsigned(255, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(126, DATA_WIDTH));
		wait for 10 ns;
		checkOpt;

		report "checking the sll operation";
		op <= ALU_SLL;
		a <= std_ulogic_vector(to_unsigned(1, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(4, DATA_WIDTH));
		wait for 10 ns;
		checkOpt;

		report "checking the srl operation";
		op <= ALU_SRL;
		a <= std_ulogic_vector(to_unsigned(8, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(1, DATA_WIDTH));
		wait for 10 ns;
		checkOpt;

		report "checking the sra operation";
		op <= ALU_SRA;
		a <= std_ulogic_vector(to_unsigned(8, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(1, DATA_WIDTH));
		wait for 10 ns;
		checkOpt;

		report "checking the add operation";
		op <= ALU_ADD;
		a <= std_ulogic_vector(to_signed(50, DATA_WIDTH));
		b <= std_ulogic_vector(to_signed(25, DATA_WIDTH));
		wait for 10 ns;
		checkOpt;

		report "checking the sub operation";
		op <= ALU_SUB;
		a <= std_ulogic_vector(to_unsigned(200, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(126, DATA_WIDTH));
		wait for 10 ns;
		checkOpt;

		report "checking the and operation";
		op <= ALU_AND;
		a <= std_ulogic_vector(to_unsigned(6, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(4, DATA_WIDTH));
		wait for 10 ns;
		checkOpt;
		

		report "checking the or operation";
		op <= ALU_OR;
		a <= std_ulogic_vector(to_unsigned(8, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(6, DATA_WIDTH));
		wait for 10 ns;

		checkOpt;


		report "checking the xor operation";
		op <= ALU_XOR;
		a <= std_ulogic_vector(to_unsigned(12, DATA_WIDTH));
		b <= std_ulogic_vector(to_unsigned(10, DATA_WIDTH));
		wait for 10 ns;
		checkOpt;

		wait;
	end process;
end architecture;

