use work.vhdldraw_pkg.all;

entity checkerboard is
end entity;

architecture arch of checkerboard is
begin
	process is
		constant size : natural := 40;
		constant cols : natural := 10;
		constant rows : natural := 11;

		variable vhdldraw : vhdldraw_t;
		variable color : color_t := GREEN;

		-- you might want to add some auxiliary subprograms or constants / variables in here
	begin
		vhdldraw.init(cols * size, rows * size);

		-- draw the illusion here

		vhdldraw.show("checkerboard.ppm");
		wait;
	end process;

end architecture;
