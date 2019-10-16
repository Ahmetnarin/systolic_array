library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package systolic_nxn_pack is
   type t_1d_array is array(integer range 0 to 7) of std_logic_vector(7 downto 0);
   type matrix_type is array(integer range 0 to 7) of t_1d_array;
   type t_1d_array_product is array(integer range 0 to 7) of std_logic_vector(15 downto 0);
   type product_matrix is array(integer range 0 to 7) of t_1d_array_product;
   
end  systolic_nxn_pack;
