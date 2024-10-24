library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.sram_pkg.all;

entity sram_tb is
end entity;

architecture tb of sram_tb is
	signal A : addr_t;
	signal IO : word_t;
	signal CE_N, OE_N, WE_N, LB_N, UB_N : std_ulogic := '1';
begin

	stimulus : process is
		procedure read(addr : integer; variable data : out word_t) is
		begin
			-- Implement your read procedure that reads from address "addr" and writes the read data into "data"
		end procedure;

		procedure write(addr : integer; data : word_t) is
		begin
			-- Implement your write procedure that writes "data" to the address "addr"
		end procedure;

		variable read_data : word_t;
		constant testdata : std_ulogic_vector := x"BADC0DEDC0DEBA5E";
	begin
		-- Initialization
		A <= (others => '0');
		CE_N <= '1';
		WE_N <= '1';
		OE_N <= '1';
		IO <= (others => 'Z');
		-- This enables reading and writing of both bytes -> you can always keep this low
		LB_N <= '0';
		UB_N <= '0';
		wait for 20 ns;

		-- write to and read from memory

		wait;
	end process;

	dut : entity work.sram
	port map(
		A => A,
		IO => IO,
		CE_N => CE_N,
		OE_N => OE_N,
		WE_N => WE_N,
		LB_N => LB_N,
		UB_N => UB_N
	);
end architecture;
