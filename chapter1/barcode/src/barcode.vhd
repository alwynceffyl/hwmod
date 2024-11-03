library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.math_pkg.all;
use work.barcode_pkg.all;
use work.vhdldraw_pkg.all;

entity barcode is
end entity;

architecture arch of barcode is

begin
	barcode_maker : process
		constant bar_width : natural := 2;                -- Width of a single bar ("module" in Wikipedia article)
		constant quiet_zone : natural := 15 * bar_width;  -- "quite zone" of the code (a bit more than in the Wikipedia article)
		constant input_str: string := "HW_MOD 2024W";

		variable vhdldraw : vhdldraw_t;

		variable width : natural := 400;         -- determine based on input string, 400 ist just a placeholder
		variable bar_height : natural := 6* width/10;           -- Calculate based on window width
		variable y_pos : natural;                -- y position for the barcode bars
		variable x_pos : natural := quiet_zone;  -- x position for drawing

		variable ascii: natural := 0;
		variable ascii_bitvector : std_ulogic_vector(10 downto 0);
		variable checksum : natural :=104;

		variable stopcode : std_ulogic_vector(12 downto 0) := "1100011101011";

		
	begin
		-- Initialize drawing window (having width / 10 as top and bottom margin looks nice,  / 10 works as bar height)
		vhdldraw.init(width, bar_height); -- This is just a dummy initialization -> adjust for total barcode width



		--start code 
		ascii_bitvector := code128_table(104);
		for k in ascii_bitvector'left downto ascii_bitvector'right loop
			if(ascii_bitvector(k) = '1') then 
				vhdldraw.setColor(BLACK);
				vhdldraw.fillRectangle(x_pos, 0, bar_width, bar_height);
			end if;
			x_pos := x_pos + bar_width;
		end loop;

		--start data 
		for i in 1 to input_str'length loop
			ascii := character'pos(input_str(i))-32;
			ascii_bitvector := code128_table(ascii);
			checkSum := checkSum + i * ascii;
			for k in ascii_bitvector'left downto ascii_bitvector'right loop
				if(ascii_bitvector(k) = '1') then 
				vhdldraw.setColor(BLACK);
				vhdldraw.fillRectangle(x_pos, 0, bar_width, bar_height);
			end if;
			x_pos := x_pos + bar_width;
			end loop;
		end loop;
		

		checkSum := checkSum mod 103;

		--start checksum 
		ascii_bitvector := code128_table(checkSum);
		for k in ascii_bitvector'left downto ascii_bitvector'right loop
			if(ascii_bitvector(k) = '1') then 
				vhdldraw.setColor(BLACK);
				vhdldraw.fillRectangle(x_pos, 0, bar_width, bar_height);
			end if;
			x_pos := x_pos + bar_width;
		end loop;

		-- stop code
		--from wikipedia the stopcode works, not the stopcode from code128_table
		for k in stopcode'left downto stopcode'right loop
			if(stopcode(k) = '1') then 
				vhdldraw.setColor(BLACK);
				vhdldraw.fillRectangle(x_pos, 0, bar_width, bar_height);
			end if;
			x_pos := x_pos + bar_width;
		end loop;
		-- Show the resulting barcode image
		vhdldraw.show(input_str & "_barcode.ppm");

		wait;  -- Wait indefinitely
	end process;
end architecture;
