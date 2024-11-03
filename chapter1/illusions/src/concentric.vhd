use work.vhdldraw_pkg.all;

entity concentric is
end entity;

architecture arch of concentric is
begin
	process is
		constant width : natural := 840;
		constant height : natural := 480;
		variable vhdldraw : vhdldraw_t;
		constant max_radius : natural := 60;
		variable radius : natural := 60;
		variable x : natural := 60;
		variable y : natural :=60;

		variable r : natural := 220;
		variable g : natural := 220;
		variable b : natural := 220;

		variable diamond_x0 : natural :=0;
		variable diamond_y0 : natural :=60;
		variable diamond_x1 : natural :=60;
		variable diamond_y1 : natural :=0;
	begin
		vhdldraw.init(width, height);
		while(y < height) loop
			while (x < width) loop
				while(radius> 0) loop 
					vhdldraw.setColor(r,g,b);
					vhdldraw.fillCircle(x,y, radius);
					vhdldraw.setColor(BLACK);
					vhdldraw.setLineWidth(1);
					vhdldraw.drawCircle(x,y, radius);
					radius := radius -10;
					if(radius > 0) then
						r := r - 40;
						g := g - 40;
						b := b - 40;
					end if;
					
				end loop;
				x := x + 2* max_radius;
				r:= 220;
				g:=220;
				b:=220;
				radius := max_radius;
			end loop;
		y := y + 2 * max_radius;
		x := max_radius;
		end loop;
		
		vhdldraw.setColor(BLACK);
		vhdldraw.setLineWidth(2);
		
		while(diamond_y0 < height) loop
			while (diamond_x0 < width) loop
				vhdldraw.drawLine(diamond_x0,diamond_y0, diamond_x1, diamond_y1);
				vhdldraw.drawLine(diamond_x0,diamond_y0, diamond_x1, diamond_y1+2*max_radius);
				vhdldraw.drawLine(diamond_x1,diamond_y1+2*max_radius, diamond_x0+2*max_radius, diamond_y0);
				vhdldraw.drawLine(diamond_x1,diamond_y1, diamond_x1+max_radius, diamond_y1+max_radius);

				diamond_x0:=diamond_x0+ 2*max_radius;
				diamond_x1 := diamond_x0 +60;
			end loop;
			diamond_x0:=0;
			diamond_y0:=diamond_y0 + 2*max_radius;
			diamond_x1:=60;
			diamond_y1:=diamond_y0 - max_radius;
		end loop;
		vhdldraw.show("concentric.ppm");
		wait;
	end process;

end architecture;
