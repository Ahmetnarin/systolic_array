
LIBRARY ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity systolic_array_tb is
--  Port ( );
end systolic_array_tb;

architecture Behavioral of systolic_array_tb is
------------------------------------------------------------
component systolic_array is
generic (N: integer :=8);
 Port ( 
        clk: in std_logic;
        reset: in std_logic;
        --ready : in std_logic;


        a00: in std_logic_vector (N-1 downto 0);
        a01: in std_logic_vector (N-1 downto 0);
        a02: in std_logic_vector (N-1 downto 0);
        a10: in std_logic_vector (N-1 downto 0);
        a11: in std_logic_vector (N-1 downto 0);
        a12: in std_logic_vector (N-1 downto 0);
        a20: in std_logic_vector (N-1 downto 0);
        a21: in std_logic_vector (N-1 downto 0);
        a22: in std_logic_vector (N-1 downto 0);
        -----------------------------------------------
        b00: in std_logic_vector (N-1 downto 0);
        b01: in std_logic_vector (N-1 downto 0);
        b02: in std_logic_vector (N-1 downto 0);
        b10: in std_logic_vector (N-1 downto 0);
        b11: in std_logic_vector (N-1 downto 0);
        b12: in std_logic_vector (N-1 downto 0);
        b20: in std_logic_vector (N-1 downto 0);
        b21: in std_logic_vector (N-1 downto 0);
        b22: in std_logic_vector (N-1 downto 0);
        -----------------------------------------------
        c1: out std_logic_vector (2*N-1 downto 0);
        c2: out std_logic_vector (2*N-1 downto 0);
        c3: out std_logic_vector (2*N-1 downto 0);
        c4: out std_logic_vector (2*N-1 downto 0);
        c5: out std_logic_vector (2*N-1 downto 0);
        c6: out std_logic_vector (2*N-1 downto 0); 
        c7: out std_logic_vector (2*N-1 downto 0);
        c8: out std_logic_vector (2*N-1 downto 0)
 );
end component;
-----------------------------------------------------------------------
---input signals--
----------------------------------------------------------------------

 signal clk:  std_logic := '0';
 signal  reset:  std_logic;
 signal a00: std_logic_vector (7 downto 0);
 signal a01: std_logic_vector (7 downto 0);
 signal a02: std_logic_vector (7 downto 0);
 signal a10: std_logic_vector (7 downto 0);
 signal a11: std_logic_vector (7 downto 0);
 signal a12: std_logic_vector (7 downto 0);
 signal a20: std_logic_vector (7 downto 0);
 signal a21: std_logic_vector (7 downto 0);
 signal a22: std_logic_vector (7 downto 0);

 signal b00: std_logic_vector (7 downto 0);
 signal b01: std_logic_vector (7 downto 0);
 signal b02: std_logic_vector (7 downto 0);
 signal b10: std_logic_vector (7 downto 0);
 signal b11: std_logic_vector (7 downto 0);
 signal b12: std_logic_vector (7 downto 0);
 signal b20: std_logic_vector (7 downto 0);
 signal b21: std_logic_vector (7 downto 0);
 signal b22: std_logic_vector (7 downto 0);




 
----------------------------------------------------------------------
-- output signals-----
---------------------------------------------------------------------- 
signal c0:     std_logic_vector (15 downto 0);
signal c1:     std_logic_vector (15 downto 0);
signal c2:     std_logic_vector (15 downto 0);
signal c3:     std_logic_vector (15 downto 0);
signal c4:     std_logic_vector (15 downto 0);
signal c5:     std_logic_vector (15 downto 0);
signal c6:     std_logic_vector (15 downto 0);
signal c7:     std_logic_vector (15 downto 0);
signal c8:     std_logic_vector (15 downto 0);
---------------------------------------------------------------------
begin
UUT: systolic_array 
GENERIC map(
 N=>8
  )
port map
     (
        clk=> clk,
        reset=> reset,
        a00=>a00,
        a01=>a01,
        a02=>a02,
        a10=>a10,
        a11=>a11,
        a12=>a12,
        a20=>a20,
        a21=>a21,
        a22=>a22,

        b00=>b00,
        b01=>b01,
        b02=>b02,
        b10=>b10,
        b11=>b11,
        b12=>b12,
        b20=>b20,
        b21=>b21,
        b22=>b22
    );
 --------------------------------------------------------------------
 -- Clock process definitions
 ----------------------------------------------------------------
 clock : process
  begin
      wait for 1 ns; clk  <= not clk;
  end process clock;     
  -------------------------------------------------------------------
  -- Stimulus process
-------------------------------------------------------------------
stim_proc: process
begin
-- hold reset state for 100 ns.
reset<='0';


a00 <= x"00";
a01 <= x"00";
a02 <= x"00";
a10 <= x"00";
a11 <= x"00";
a12 <= x"00";
a20 <= x"00";
a21 <= x"00";
a22 <= x"00";


b00 <= x"00";
b01 <= x"00";
b02 <= x"00";
b10 <= x"00";
b11 <= x"00";
b12 <= x"00";
b20 <= x"00";
b21 <= x"00";
b22 <= x"00";

wait for 10 ns;
reset<='1';

a00 <=x"01";
a01 <=x"02";
a02 <=x"03";
a10 <= x"04";
a11 <= x"05";
a12 <= x"06";
a20 <= x"07";
a21 <= x"08";
a22 <= x"09";
------------

b00 <= x"01";
b01 <= x"02";
b02 <= x"03";
b10 <= x"04";
b11 <= x"05";
b12 <= x"06";
b20 <= x"07";
b21 <= x"08";
b22 <= x"09";

--wait for 10 ns;
--Data <= "0111";
--wait for 10 ns;
--Data <= "1110";

wait;
end process stim_proc;
end Behavioral;
