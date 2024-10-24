library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.vhdldraw_pkg.all;

entity example is
end entity;

architecture beh of example is
begin

	stimulus : process is
		variable draw : vhdldraw_t;
		variable col : color_t;
		variable slv : std_logic_vector(7 downto 0);
		type col_arr_t is array(natural range<>) of color_t;
		constant cols : col_arr_t := (BLACK, WHITE, RED, GREEN, BLUE, ORANGE, PURPLE, CYAN, YELLOW, MAGENTA, PINK, GRAY, BROWN);
	begin
		draw.init(16 * cols'length, 16);
		for x in 0 to cols'length-1 loop
			draw.setColor(cols(x));
			draw.fillSquare(16 * x, 0, 16);
		end loop;
		draw.show("color_palette.ppm");

		-- Resize vhdlDraw frame
		draw.init(400, 400);

		-- filled shapes
		draw.setColor(from_rgb332(7, 0, 0));
		draw.fillSquare(draw.getWidth/4, draw.getHeight/4, draw.getWidth/4);
		draw.setColor(GREEN);
		draw.fillRectangle(-draw.getWidth/4, -draw.getHeight/4, draw.getWidth/2, draw.getWidth/2);

		draw.setColor(BLUE);
		draw.fillCircle(draw.getWidth/2, draw.getHeight/2, draw.getWidth/8);
		draw.setColor(ORANGE);
		draw.fillCircle(draw.getWidth, draw.getHeight, draw.getWidth/4);

		if draw.getColor = ORANGE then
			draw.setColor(PURPLE);
		end if;
		draw.fillEllipse(7*draw.getWidth/8, 0, draw.getWidth/16, draw.getHeight / 8);
		draw.setColor(CYAN);
		draw.fillEllipse(7*draw.getWidth/8, draw.getHeight / 4, 3*draw.getWidth/16, draw.getHeight / 8);

		draw.setColor(YELLOW);
		draw.fillTriangle(0,7*draw.getHeight/8, draw.getWidth/8,draw.getHeight, -draw.getWidth,2*draw.getHeight);

		draw.setColor(MAGENTA);
		draw.fillTriangle(draw.getWidth/8,draw.getHeight, 0,7*draw.getHeight/8,  draw.getWidth/2,draw.getHeight/2);

		draw.setColor(PINK);
		draw.fillPolygon((200,160, 210,190, 240,200, 210,210, 200,240, 190,210, 160,200, 190,190));

		draw.show("filled.ppm");

		-- outlines
		draw.clear;
		draw.setColor(from_rgb332(7, 0, 0));
		draw.drawSquare(draw.getWidth/4, draw.getHeight/4, draw.getWidth/4);
		draw.setColor(GREEN);
		draw.drawRectangle(-draw.getWidth/4, -draw.getHeight/4, draw.getWidth/2, draw.getWidth/2);

		draw.setLineWidth(2);
		draw.setColor(BLUE);
		draw.drawCircle(draw.getWidth/2, draw.getHeight/2, draw.getWidth/8);
		draw.setColor(ORANGE);
		draw.drawCircle(draw.getWidth, draw.getHeight, draw.getWidth/4);

		draw.setLineWidth(1);
		if draw.getColor = ORANGE then
			draw.setColor(PURPLE);
		end if;
		draw.drawEllipse(7*draw.getWidth/8, 0, draw.getWidth/16, draw.getHeight / 8);
		draw.setColor(CYAN);
		draw.drawEllipse(7*draw.getWidth/8, draw.getHeight / 4, 3*draw.getWidth/16, draw.getHeight / 8);

		draw.setColor(YELLOW);
		draw.drawTriangle(0,7*draw.getHeight/8, draw.getWidth/8,draw.getHeight, -draw.getWidth,2*draw.getHeight);

		draw.setColor(MAGENTA);
		draw.drawTriangle(draw.getWidth/8,draw.getHeight, 0,7*draw.getHeight/8,  draw.getWidth/2,draw.getHeight/2);

		draw.setColor(BROWN);
		draw.drawPoint(draw.getWidth/2, draw.getHeight/8);
		draw.setLineWidth(7);
		draw.drawPoint(draw.getWidth/2, 7*draw.getHeight/8);
		draw.setColor(GRAY);
		draw.drawLine(-10, -10, draw.getWidth+10, draw.getHeight+10);

		draw.setLineWidth(4);
		draw.setColor(PINK);
		draw.drawPolygon((200,160, 210,190, 240,200, 210,210, 200,240, 190,210, 160,200, 190,190));

		draw.show("outlined.ppm");

		wait;
	end process;

end architecture;
