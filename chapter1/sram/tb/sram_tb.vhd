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
				
				A <= std_ulogic_vector(to_unsigned(addr, addr_t'length));
				wait for TAA + 1 ns  ;
				data := IO;
				--wait for TRC - (TAA + 1 ns)  ;
			end procedure;



		procedure write(addr : integer; data : word_t) is
		begin
			OE_N <= '0';
			wait for 10 ns;
			A <= std_ulogic_vector(to_unsigned(addr, addr_t'length));
			wait for TSA  ;
			CE_N <= '0';
			WE_N <= '0';
			wait for THZWE;
			IO <= data;
			wait for TSD;
			--   + TPWE2 - THZWE ;
			CE_N <= '1';
			WE_N <= '1';
			wait for TLZWE ;
			IO <= (others => 'Z');
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
		
		for i in 0 to testdata'length/16 -1 loop
			write(i, testdata(16*i to 16*i +15));
			wait for 10 ns;
		end loop;
		
		CE_N <= '0';
		OE_N <= '0';
		wait for 100 ns;

		for i in 0 to testdata'length/16 -1 loop	
			read(i,read_data);
			assert to_hstring(read_data) = to_hstring(testdata(16*i to 16*i +15)) report  "daten wurden falsch gelesen, sollte dies sein: " &  to_hstring(testdata(16*i to 16*i +15));
		end loop;
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
