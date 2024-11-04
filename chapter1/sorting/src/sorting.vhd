library ieee;
use ieee.math_real.all;

use work.vhdldraw_pkg.all;
use work.math_pkg.all;

entity sorting is
end entity;

architecture arch of sorting is
	type int_arr_t is array(integer range<>) of integer;

	procedure print_array(int_arr : int_arr_t) is
	begin
		for i in int_arr'low to int_arr'high loop
			report "i: " & to_string(i) & " wert: " &to_string(int_arr(i));
		end loop;
	end procedure;

   
	procedure merge(data : inout int_arr_t; left, mid, right : integer; ascOrdesc : boolean) is
		
		variable n1 : integer := mid - left + 1;
    	variable n2 : integer := right - mid;

    	variable leftArr : int_arr_t(0 to n1 - 1);
    	variable rightArr : int_arr_t(0 to n2 - 1);

		variable i : integer := 0;
    	variable j : integer := 0;
    	variable k : integer := left;

	begin
		
    -- Copy data to temporary arrays
    for l in 0 to n1 - 1 loop
        leftArr(l) := data(left + l);
    end loop;
    for l in 0 to n2 - 1 loop
        rightArr(l) := data(mid + 1 + l);
    end loop;


    -- Merge the temporary arrays back into data
    while (i < n1) and (j < n2) loop
        if leftArr(i) <= rightArr(j) then
            data(k) := leftArr(i);
            i := i + 1;
        else
            data(k) := rightArr(j);
            j := j + 1;
        end if;
        k := k + 1;
    end loop;

    while i < n1 loop
        data(k) := leftArr(i);
        i := i + 1;
        k := k + 1;
    end loop;

    while j < n2 loop
        data(k) := rightArr(j);
        j := j + 1;
        k := k + 1;
   	end loop;
	end procedure;



	procedure mergesort(data : inout int_arr_t) is
		variable mid : integer := 0;
		variable left : integer := data'low;
		variable right : integer := data'high;

	begin
 
	if (left < right) then

		mid := left + (right - left) / 2;

		if(data'ascending) then
			mergeSort(data(left to mid));
			mergeSort(data(mid + 1 to right));
		else 
			mergeSort(data(mid downto left));
			mergeSort(data(right downto mid + 1));
		end if;
		merge(data, left, mid, right, data'ascending);
	end if;
	end procedure;

	
	procedure sort(data : inout int_arr_t) is
	begin
		 mergesort(data);
	end procedure;

	procedure draw_array(arr : int_arr_t; nr : inout integer) is
		variable draw : vhdldraw_t;
		constant width : natural := 400;
		constant height : natural := 300;
		variable bar_width : natural := width / arr'length;
		variable bar_height : integer :=0;

		variable x : integer :=0;
		variable y : integer :=0;


		variable scale : real := real(0);
		variable y_real : real := real(0);
		

 	begin
		draw.init(width, height);

		if(arr(arr'low)>= 0)  then 
			y_real := real(height);
			scale := real(height)/ real(arr(arr'high));
		elsif (arr(arr'high)<0) then
			y_real := real(0);
			scale := real(height)/real(abs(arr(arr'low)));
		else
			scale := real(height) / real(abs(arr(arr'low)) + (abs(arr(arr'high))));
			y_real := real(0) + real(scale * real(arr(arr'high)));
		end if;
			

		for i in arr'low to arr'high loop
			bar_height :=  integer(scale * real(abs(arr(i))));
			if arr(i) > 0 then 
				draw.setColor(RED);
				bar_height := -(bar_height) ;
			else
				draw.setColor(BLUE);
			end if;
			draw.fillRectangle(x,integer(y_real), bar_width,bar_height);
			draw.setColor(BLACK);
			draw.drawRectangle(x,integer(y_real), bar_width+1,bar_height);

			x := x + bar_width;
		end loop;
		draw.show("merge_sort_" & to_string(nr) & ".ppm");
		nr := nr +1;
	end procedure;

begin

	main : process is
		variable arr0 : int_arr_t(-10 downto -19) := (10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
		variable arr1 : int_arr_t(-5 to 5) := (-12, 45, 78, -23, 56, 89, 34, 67, 91, -15, -42);
		variable arr2 : int_arr_t(5 downto 0) := (-10, -11, -12, -13, -17, -22);
		variable arr3 : int_arr_t(1 to 200);
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


		for i in arr3'low to arr3'high loop 
			arr3(i) := i;
		end loop;
		sort(arr3);
		print_array(arr3);
		report "###";
		draw_array(arr3, cnt);

		wait;
	end process;
end architecture;
