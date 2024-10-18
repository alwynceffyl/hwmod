use work.math_pkg.all;

entity math_tb is
end entity;

architecture test of math_tb is
begin
	process
	begin
		assert log2c(1) = 0 report "log2c(1)" severity error;
		assert log2c(2) = 1 report "log2c(2)" severity error;
		assert log2c(3) = 2 report "log2c(3)" severity error;
		assert log2c(4) = 2 report "log2c(4)" severity error;
		assert log2c(5) = 3 report "log2c(3)" severity error;
		assert log2c(6) = 3 report "log2c(6)" severity error;
		assert log2c(7) = 3 report "log2c(7)" severity error;
		assert log2c(8) = 3 report "log2c(8)" severity error;
		assert log2c(9) = 4 report "log2c(9)" severity error;
		assert log2c(15) = 4 report "log2c(15)" severity error;
		assert log2c(16) = 4 report "log2c(16)" severity error;

		assert max3(1, 2, 3) = 3 severity error;
		assert max3(1, 2, -3) = 2 severity error;
		assert max3(1, -2, -3) = 1 severity error;
		assert max3(-1, -2, -3) = -1 severity error;

		assert min3(1, 2, 3) = 1 severity error;
		assert min3(1, 2, -3) = -3 severity error;
		assert min3(1, -2, -3) = -3 severity error;
		assert min3(-1, -2, -3) = -3 severity error;

		wait;
	end process;
end architecture;



