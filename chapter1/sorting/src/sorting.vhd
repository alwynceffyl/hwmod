library ieee;
use ieee.math_real.all;

use work.vhdldraw_pkg.all;
use work.math_pkg.all;

entity sorting is
end entity;

architecture arch of sorting is
	type int_arr_t is array(integer range<>) of integer;

	-- You can use this for debugging
	procedure print_array(int_arr : int_arr_t) is
	begin
		for i in int_arr'low to int_arr'high loop
			report to_string(int_arr(i));
		end loop;
	end procedure;

-- implement one of the following two procedures
	procedure mergesort(data : inout int_arr_t) is
	begin
	 -- add your implementaion here. Note that you can add further subprograms as you please and we recommend you to do so
	end procedure;

	procedure quicksort(data : inout int_arr_t) is
	begin
	 -- add your implementaion here. Note that you can add further subprograms as you please and we recommend you to do so
	end procedure;

	procedure sort(data : inout int_arr_t) is
	begin
		-- uncomment the one you implemented
		-- mergesort(data);
		-- quicksort(data);
	end procedure;

	procedure draw_array(arr : int_arr_t; nr : inout integer) is
		variable draw : vhdldraw_t;
		constant width : natural := 400;
		constant height : natural := 300;
		variable bar_width : natural := width / arr'length;
	begin
		draw.init(width, height);
	-- don't forget to call draw.show
	end procedure;

begin

	main : process is
		variable arr0 : int_arr_t(-10 downto -19) := (10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
		variable arr1 : int_arr_t(-5 to 5) := (-12, 45, 78, -23, 56, 89, 34, 67, 91, -15, -42);
		variable arr2 : int_arr_t(5 downto 0) := (-10, -11, -12, -13, -17, -22);
		variable cnt : natural := 0;
	begin
		sort(arr0);
		print_array(arr0);
		report "###";
		draw_array(arr0, cnt);

		sort(arr1);
		print_array(arr1);
		report "###";
		draw_array(arr1, cnt);

		sort(arr2);
		print_array(arr2);
		report "###";
		draw_array(arr2, cnt);

		wait;
	end process;
end architecture;
