library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
library work;
use work.systolic_nxn_pack.all;

entity systolic_multiplier is
generic (N: integer :=8);
  Port (    clk: in std_logic;
            reset: in std_logic;
            matrix_A: in  matrix_type;
            matrix_B : in matrix_type;
            matrix_P : out product_matrix;
            complete: out std_logic;
            step :out integer
        );
end systolic_multiplier;

architecture Behavioral of systolic_multiplier is
--Only advance matrix multiplication when incomplete
signal a_wire: matrix_type;
signal b_wire: matrix_type;
component processing_element 
generic 
(
	 N: integer :=8
);
port 
(
  clk: in std_logic;
  reset: in std_logic;
  a_in: in std_logic_vector (N-1 downto 0);
  b_in: in std_logic_vector (N-1 downto 0);
  a:    out std_logic_vector (N-1 downto 0);
  b:    out std_logic_vector (N-1 downto 0);
  pe:   out std_logic_vector (2*N-1 downto 0)
);
end component;
begin
------------------------------
   Gen_1 : for i in 0 to 7 generate
    Gen_2: for j in 0 to 7 generate
        inst_pe: processing_element 
            GENERIC map
            (
                 N=>8
            )
                
            port map
            (
                clk=> clk,
                reset=> reset,
                a_in=>a_wire(i)(j),
                b_in=>b_wire(i)(j),
                a=>a_wire(i)(j),
                b=>b_wire(i)(j),
                pe=>matrix_P(i)(j)
            );
      end generate;   
    end generate;

end Behavioral;
