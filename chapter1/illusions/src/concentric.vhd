use work.vhdldraw_pkg.all;

entity concentric is
end entity;

architecture arch of concentric is
begin
	process is
		constant width : natural := 840;
		constant height : natural := 480;
		variable vhdldraw : vhdldraw_t;

		-- you might want to add some auxiliary subprograms or constants / variables in here
	begin
		vhdldraw.init(width, height);

		-- draw the illusion here

		vhdldraw.show("concentric.ppm");
		wait;
	end process;

end architecture;
