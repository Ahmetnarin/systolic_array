
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


        a1: in std_logic_vector (N-1 downto 0);
        a2: in std_logic_vector (N-1 downto 0);
        a3: in std_logic_vector (N-1 downto 0);
        -----------------------------------------------
        b1: in std_logic_vector (N-1 downto 0);
        b2: in std_logic_vector (N-1 downto 0);
        b3: in std_logic_vector (N-1 downto 0);
        -----------------------------------------------
        c1: out std_logic_vector (2*N-1 downto 0);
        c2: out std_logic_vector (2*N-1 downto 0);
        c3: out std_logic_vector (2*N-1 downto 0);
        c4: out std_logic_vector (2*N-1 downto 0);
        c5: out std_logic_vector (2*N-1 downto 0);
        c6: out std_logic_vector (2*N-1 downto 0); 
        c7: out std_logic_vector (2*N-1 downto 0);
        c8: out std_logic_vector (2*N-1 downto 0);
        c9: out std_logic_vector (2*N-1 downto 0)
 );
end component;
-----------------------------------------------------------------------
---input signals--
----------------------------------------------------------------------

 signal clk:  std_logic := '0';
 signal  reset:  std_logic;
 signal  a1:  std_logic_vector (7 downto 0);
 signal  a2:  std_logic_vector (7 downto 0);
 signal  a3:  std_logic_vector (7 downto 0);
 signal  b1:  std_logic_vector (7 downto 0);
 signal  b2:  std_logic_vector (7 downto 0);
 signal  b3:  std_logic_vector (7 downto 0);
----------------------------------------------------------------------
-- output signals-----
---------------------------------------------------------------------- 
signal c1:     std_logic_vector (15 downto 0);
signal c2:     std_logic_vector (15 downto 0);
signal c3:     std_logic_vector (15 downto 0);
signal c4:     std_logic_vector (15 downto 0);
signal c5:     std_logic_vector (15 downto 0);
signal c6:     std_logic_vector (15 downto 0);
signal c7:     std_logic_vector (15 downto 0);
signal c8:     std_logic_vector (15 downto 0);
signal c9:     std_logic_vector (15 downto 0);
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
        a1=>a1,
        a2=>a2,
        a3=>a3,
        b1=>b1,
        b2=>b2,
        b3=>b3,
        c1=>c1,
        c2=>c2,
        c3=>c3,
        c4=>c4,
        c5=>c5,
        c6=>c6,
        c7=>c7,
        c8=>c8,
        c9=>c9
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
reset<='1';
a1 <=x"00";
a2 <=x"00";
a3 <=x"00";
b1 <=x"00";
b2 <=x"00";
b3 <=x"00";
wait for 10 ns;
reset<='0';
a1 <=x"0A";
a2 <=x"0A";
a3 <=x"0A";
------------
b1 <=x"0B";
b2 <=x"0B";
b3 <=x"0B";

--wait for 10 ns;
--Data <= "0111";
--wait for 10 ns;
--Data <= "1110";

wait;
end process stim_proc;
end Behavioral;
