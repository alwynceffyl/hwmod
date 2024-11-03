use work.vhdldraw_pkg.all;

entity squarecircle is
end entity;

architecture arch of squarecircle is
begin
	process is
		constant size : natural := 600;
		variable vhdldraw : vhdldraw_t;
		constant squares : natural :=50;
		constant space_between : natural :=5;
		constant linewidth : natural := 2;
		constant radius_circle : natural :=30;
		constant radius_circle_lw : natural :=4;
	begin
		vhdldraw.init(size);

		-- draw the illusion here

		vhdldraw.show("squarecircle.ppm");
		wait;
	end process;

end architecture;
