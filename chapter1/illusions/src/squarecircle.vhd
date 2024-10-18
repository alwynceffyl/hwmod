use work.vhdldraw_pkg.all;

entity squarecircle is
end entity;

architecture arch of squarecircle is
begin
	process is
		constant size : natural := 600;
		variable vhdldraw : vhdldraw_t;

		-- you might want to add some auxiliary subprograms or constants / variables in here
	begin
		vhdldraw.init(size);

		-- draw the illusion here

		vhdldraw.show("squarecircle.ppm");
		wait;
	end process;

end architecture;
