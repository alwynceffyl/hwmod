library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.math_pkg.all;
use work.alu_pkg.all;

entity alu is
	generic (
		DATA_WIDTH : positive := 32
	);
	port (
		op   : in  alu_op_t;
		a, b : in  std_ulogic_vector(DATA_WIDTH-1 downto 0);
		r    : out std_ulogic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
		z    : out std_ulogic := '0'
	);
end entity;

architecture alu_beh of alu is
	constant x : natural := log2c(DATA_WIDTH);

	


begin
	process(all) begin
		
	case op is 
		when ALU_NOP => 
			r <= b;
			z <= '-';

		when ALU_SLT => 
			r <= (std_ulogic_vector(to_unsigned(1, DATA_WIDTH))) when signed(a)< signed(b) else (others => '0');
			z <= not r(0);
		
		when ALU_SLTU =>
			r <= ( std_ulogic_vector(to_unsigned(1, DATA_WIDTH))) when unsigned(a)< unsigned(b) else (others => '0');
			z <= not r(0);
		
		when ALU_SLL => 
			r <=  std_ulogic_vector(shift_left(unsigned(a), to_integer(unsigned(b(x-1 downto 0)))));
			z <= '-';
		
		when ALU_SRL => 
			r <=  std_ulogic_vector(shift_right(unsigned(a), to_integer(unsigned(b(x-1 downto 0)))));
			z <= '-';
		
		when ALU_SRA =>
			r <=  std_ulogic_vector(shift_right(signed(a), to_integer(unsigned(b(x-1 downto 0)))));
			z <= '-';
		
		when ALU_ADD => 
			r <= std_ulogic_vector(signed(a) + signed(b));
			z <= '-';
		
		when ALU_SUB => 
		
			r <= std_ulogic_vector(signed(a) - signed(b));
			z <= '1' when signed(a)=signed(b) else '0';
		
		when ALU_AND => 
			r <= a and b;
			z <= '-';
		
		when ALU_OR => 
			r <= a or b;
			z <= '-';
		
		when ALU_XOR => 
			r <= a xor b;
			z <= '-';
		
		when others =>  --all choices must be covered
			r <= (others => '0');
			z <= '-';
		end case;
	end process;
end architecture;