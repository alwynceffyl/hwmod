use work.vhdldraw_pkg.all;

entity creative is
end entity;

architecture arch of creative is
begin
	main : process is   -- process done
		variable draw : vhdldraw_t;
		constant width : natural := 1900;
		constant height : natural := 1000;
		constant blue_height : natural :=538;
		constant blue_width : natural :=760;
		variable counter : natural :=0;
		constant redwhitelines_h : natural :=77;
		variable lines : natural :=0;
		constant star_rows : natural := 9;
		constant star_cols : natural := 11;
		constant star_spacing_x : natural := 62;
		constant star_spacing_y : natural := 50;
		
		procedure drawStar(start_x, start_y : natural) is  --subprogram done
		begin
			draw.setColor(WHITE);
			draw.drawPolygon((start_x, start_y + 10,
								  start_x + 10, start_y + 30,
								  start_x + 40, start_y + 35,
								  start_x + 10, start_y + 40,
								  start_x, start_y + 60,
								  start_x - 10, start_y + 40,
								  start_x - 40, start_y + 35,
								  start_x - 10, start_y + 30));
		end procedure;
		
	begin
		draw.init(width, height);
		draw.setLineWidth(2);
		
		draw.setColor(RED);
		while(lines <= height) loop -- while loop done
			case counter mod 2 is --different if/case done
				when 0 =>
					draw.fillRectangle(0,lines, width, redwhitelines_h);
				when 1 =>
					null ;
				when others =>
					null ;
			end case; 
			counter := counter+1;
			lines := lines + redwhitelines_h;
		end loop;
		draw.setColor(BLUE);
		draw.fillRectangle(0,0, 760, 538);
		
		for row in 0 to star_rows - 1 loop   --for loop done
			for col in 0 to star_cols - 1 loop
				if (row + col) mod 2 = 0 then  		--different if/case done
					drawStar( col * star_spacing_x + 50, row * star_spacing_y + 30);
				end if;
			end loop;
		end loop;

		draw.show("creative.ppm");
		wait;
	end process;
end architecture;


