library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity systolic_array is
  generic 
  (
    N: integer :=8
  );
   Port 
   ( 
    clk: in std_logic;
    reset: in std_logic;
    a00: in std_logic_vector (N-1 downto 0);
    a01: in std_logic_vector (N-1 downto 0);
    a02: in std_logic_vector (N-1 downto 0);
    a10: in std_logic_vector (N-1 downto 0);
    a11: in std_logic_vector (N-1 downto 0);
    a12: in std_logic_vector (N-1 downto 0);
    a20: in std_logic_vector (N-1 downto 0);
    a21: in std_logic_vector (N-1 downto 0);
    a22: in std_logic_vector (N-1 downto 0);


    b00: in std_logic_vector (N-1 downto 0);
    b01: in std_logic_vector (N-1 downto 0);
    b02: in std_logic_vector (N-1 downto 0);
    b10: in std_logic_vector (N-1 downto 0);
    b11: in std_logic_vector (N-1 downto 0);
    b12: in std_logic_vector (N-1 downto 0);
    b20: in std_logic_vector (N-1 downto 0);
    b21: in std_logic_vector (N-1 downto 0);
    b22: in std_logic_vector (N-1 downto 0);

    
    c0: out std_logic_vector (2*N-1 downto 0);
    c1: out std_logic_vector (2*N-1 downto 0);
    c2: out std_logic_vector (2*N-1 downto 0);
    c3: out std_logic_vector (2*N-1 downto 0);
    c4: out std_logic_vector (2*N-1 downto 0);
    c5: out std_logic_vector (2*N-1 downto 0);
    c6: out std_logic_vector (2*N-1 downto 0); 
    c7: out std_logic_vector (2*N-1 downto 0);
    c8: out std_logic_vector (2*N-1 downto 0)
   );
end systolic_array;

architecture Behavioral of systolic_array is
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
  a_out:    out std_logic_vector (N-1 downto 0);
  b_out:    out std_logic_vector (N-1 downto 0);
  pe:   out std_logic_vector (2*N-1 downto 0)
);
end component;
signal a01_pe: std_logic_vector (N-1 downto 0);
signal a12_pe: std_logic_vector (N-1 downto 0);
signal a34_pe: std_logic_vector (N-1 downto 0);
signal a45_pe: std_logic_vector (N-1 downto 0);
signal a67_pe: std_logic_vector (N-1 downto 0);
signal a78_pe: std_logic_vector (N-1 downto 0);
signal b03_pe: std_logic_vector (N-1 downto 0);
signal b36_pe: std_logic_vector (N-1 downto 0);
signal b14_pe: std_logic_vector (N-1 downto 0);
signal b47_pe: std_logic_vector (N-1 downto 0);
signal b25_pe: std_logic_vector (N-1 downto 0);
signal b58_pe: std_logic_vector (N-1 downto 0);
begin
---------------------------------------------
inst_pe_0: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
      clk=> clk,
      reset=> reset,
      a_in=>a00,
      b_in=>b00,
      a_out=>a01_pe,
      b_out=>b03_pe,
      pe=>c0
    );
-----------------------------------------------
inst_pe_1: processing_element 
GENERIC map(
 N=>8
  )
port map
  (
      clk=> clk,
      reset=> reset,
      a_in=>a01_pe,
      b_in=>b01,
      a_out=>a12_pe,
      b_out=>b14_pe,
      pe=>c1
  );
------------------------------------------------------
inst_pe_2: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a12_pe,
      b_in=>b02,
    --  a=>,
      b_out=>b25_pe,
      pe=>c2
      );
--------------------------------------------------------
inst_pe_3: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a10,
      b_in=>b03_pe,
      a_out=>a34_pe,
      b_out=>b36_pe,
      pe=>c3
      );
-------------------------------------------------
inst_pe_4: processing_element 
  GENERIC map(N=>8)
  port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a34_pe,
      b_in=>b14_pe,
      a_out=>a45_pe,
      b_out=>b47_pe,
      pe=>c4
      );
--------------------------------------------------
inst_pe_5: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a45_pe,
      b_in=>b25_pe,
     -- a=>,
      b_out=>b58_pe,
      pe=>c5
      );
-------------------------------------------------------
inst_pe_6: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a20,
    b_in=>b36_pe,
    a_out=>a67_pe,
     -- b=>,
      pe=>c6
      );
------------------------------------------------------------------------
inst_pe_7: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a67_pe,
      b_in=>b47_pe,
      a_out=>a78_pe,
     -- b=>,
      pe=>c7
      );
--------------------------------------------------------------------
inst_pe_8: processing_element 
GENERIC map(
 N=>8
  )
port map
  (
    clk=> clk,
    reset=> reset,
    a_in=>a78_pe,
    b_in=>b58_pe,
     -- a=>,
    --  b=>,
    pe=>c8
  );

end Behavioral;
