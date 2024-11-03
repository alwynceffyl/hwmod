use work.vhdldraw_pkg.all;

entity ouchi is
end entity;

architecture arch of ouchi is
begin
	process is
		constant window_size : natural := 800;
		constant width : natural := 32;
		constant height : natural := 8;
		variable vhdldraw : vhdldraw_t;
		
		constant figure_centre_w : natural := 200;
		constant figure_centre_h : natural := 224;
		constant center_rec_w : natural :=8;
		constant center_rec_h : natural :=32;

		variable x: natural :=0;
		variable y: natural :=0;
		variable counter : natural := 0;
		constant small_windows_x : natural := window_size/2+ figure_centre_w/2;
		constant small_windows_y : natural := window_size/2+ figure_centre_h/2;


	begin
		vhdldraw.init(window_size);
		while(y<= window_size) loop
			while(x<=window_size) loop
				vhdldraw.drawRectangle(x, y, width, height);
				if(counter mod 2 = 0) then
					vhdldraw.fillRectangle(x, y, width, height);
				end if;
				counter :=counter +1;
				x := x + width;
			end loop;
			x := 0;
			y := y + height;
			counter :=counter +1;
		end loop;
		

		counter :=0;
		x := window_size/2-figure_centre_w/2;
		y := window_size/2-figure_centre_h/2;
		vhdldraw.setColor(WHITE);
		vhdldraw.fillRectangle(x, y, figure_centre_w, figure_centre_h);
		vhdldraw.setColor(BLACK);
		--vhdldraw.drawRectangle(x, y, figure_centre_w, figure_centre_h);

		while(y< small_windows_y) loop
			while(x< small_windows_x) loop
				vhdldraw.drawRectangle(x, y, center_rec_w, center_rec_h);
				if(counter mod 2 = 0) then
					vhdldraw.fillRectangle(x, y, center_rec_w, center_rec_h);
				end if;
				counter :=counter +1;
				x := x+ center_rec_w;
			end loop;
			x := window_size/2-figure_centre_w/2;
			y := y + center_rec_h;
		end loop;

		vhdldraw.show("ouchi.ppm");
		wait;
	end process;

end architecture;
