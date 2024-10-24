use work.vhdldraw_pkg.all;

entity vhdldraw_rect_tb is
end entity;

architecture tb of vhdldraw_rect_tb is
	shared variable vhdldraw : vhdldraw_t;
begin

	stimulus : process begin
		vhdldraw.init(64, 64);

		vhdldraw.setColor(RED);
		vhdldraw.fillRectangle(0, vhdldraw.getHeight-16, 16, 16);

		vhdldraw.setColor(GREEN);
		vhdldraw.fillRectangle(vhdldraw.getWidth-16, vhdldraw.getHeight-16, 16, 16);

		vhdldraw.setColor(BLUE);
		vhdldraw.fillRectangle(vhdldraw.getWidth-16, 0, 16, 16);

		vhdldraw.setColor(ORANGE);
		vhdldraw.fillRectangle(0, 0, 16, 16);

		vhdldraw.setColor(CYAN);
		vhdldraw.fillRectangle(vhdldraw.getWidth/2-8, vhdldraw.getHeight/2-8, 16, 16);

		vhdldraw.show("test.ppm");
		wait;
	end process;

end architecture;
