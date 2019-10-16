

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;


entity processing_element is
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
end processing_element;
----------------------------------------------------
architecture Behavioral of processing_element is
signal temp_pe: std_logic_vector (2*N-1 downto 0);
begin
Pe_process :process (clk,reset,temp_pe)
		begin
		if rising_edge(clk)
		then
			if (reset='0')  -- will check the conditions to reach presclar value
			then
			a<=x"00";
			b<=x"00";
			pe<=x"0000";			
			temp_pe<=x"0000";
			else		     
				temp_pe <= temp_pe + a_in*b_in;  --// reset register
				a <= a_in;
				b <= b_in;			 
			end if;
		end if;	
		pe<=temp_pe;
		end process; 
end Behavioral;


























































































































































