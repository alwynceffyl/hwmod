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

		-- you might want to add some auxiliary subprograms or constants / variables in here
	begin
		vhdldraw.init(window_size);

		-- draw the illusion here

		vhdldraw.show("ouchi.ppm");
		wait;
	end process;

end architecture;
