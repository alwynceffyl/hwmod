use work.vhdldraw_pkg.all;

entity creative is
end entity;

architecture arch of creative is
begin
	main : process is
		variable draw : vhdldraw_t;
	begin
		-- change the dimensions to anything you want
		draw.init(400, 400);
		draw.show("creative.ppm");
		wait;
	end process;
end architecture;
