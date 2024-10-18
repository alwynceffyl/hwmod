library ieee;
use ieee.std_logic_1164.all;

package alu_pkg is
	type alu_op_t is (
		ALU_NOP,
		ALU_SLT,
		ALU_SLTU,
		ALU_SLL,
		ALU_SRL,
		ALU_SRA,
		ALU_ADD,
		ALU_SUB,
		ALU_AND,
		ALU_OR,
		ALU_XOR
	);

	component alu is
		generic (
			DATA_WIDTH : positive := 32
		);
		port (
			op   : in  alu_op_t;
			a, b : in  std_ulogic_vector(DATA_WIDTH-1 downto 0);
			r    : out std_ulogic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
			z    : out std_ulogic := '0'
		);
	end component;
end package;


