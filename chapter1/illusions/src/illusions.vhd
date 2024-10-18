use work.vhdldraw_pkg.all;

entity illusions is
end entity;


architecture arch of illusions is
begin

	checkerboard : entity work.checkerboard;
	ouchi : entity work.ouchi;
	concentric : entity work.concentric;
	squarecircle : entity work.squarecircle;

end architecture;
