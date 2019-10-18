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
    a1: in std_logic_vector (N-1 downto 0);
    a2: in std_logic_vector (N-1 downto 0);
    a3: in std_logic_vector (N-1 downto 0);
    b1: in std_logic_vector (N-1 downto 0);
    b2: in std_logic_vector (N-1 downto 0);
    b3: in std_logic_vector (N-1 downto 0);

    
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
  a:    out std_logic_vector (N-1 downto 0);
  b:    out std_logic_vector (N-1 downto 0);
  pe:   out std_logic_vector (2*N-1 downto 0)
);
end component;
signal a12: std_logic_vector (N-1 downto 0);
signal a23: std_logic_vector (N-1 downto 0);
signal a45: std_logic_vector (N-1 downto 0);
signal a56: std_logic_vector (N-1 downto 0);
signal a78: std_logic_vector (N-1 downto 0);
signal a89: std_logic_vector (N-1 downto 0);
signal b14: std_logic_vector (N-1 downto 0);
signal b25: std_logic_vector (N-1 downto 0);
signal b36: std_logic_vector (N-1 downto 0);
signal b47: std_logic_vector (N-1 downto 0);
signal b58: std_logic_vector (N-1 downto 0);
signal b69: std_logic_vector (N-1 downto 0);


begin
---------------------------------------------
inst_pe_1: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
      clk=> clk,
      reset=> reset,
      a_in=>a1,
      b_in=>b1,
      a=>a12,
      b=>b14,
      pe=>c1
    );
-----------------------------------------------
inst_pe_2: processing_element 
GENERIC map(
 N=>8
  )
port map
  (
      clk=> clk,
      reset=> reset,
      a_in=>a12,
      b_in=>b2,
      a=>a23,
      b=>b25,
      pe=>c2
  );
------------------------------------------------------
inst_pe_3: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a23,
      b_in=>b3,
    --  a=>,
      b=>b36,
      pe=>c3
      );
--------------------------------------------------------
inst_pe_4: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
    clk=> clk,
    reset=> reset,
    a_in=>a2,
    b_in=>b14,
    a=>a45,
    b=>b47,
    pe=>c4
    );
-------------------------------------------------
inst_pe_5: processing_element 
  GENERIC map(N=>8)
  port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a45,
      b_in=>b25,
      a=>a56,
      b=>b58,
      pe=>c5
      );
--------------------------------------------------
inst_pe_6: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a56,
      b_in=>b36,
     -- a=>,
      b=>b69,
      pe=>c6
      );
-------------------------------------------------------
inst_pe_7: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a3,
      b_in=>b47,
      a=>a78,
     -- b=>,
      pe=>c7
      );
------------------------------------------------------------------------
inst_pe_8: processing_element 
GENERIC map(
 N=>8
  )
port map
     (
    clk=> clk,
    reset=> reset,
     a_in=>a78,
      b_in=>b58,
      a=>a89,
     -- b=>,
      pe=>c8
      );
--------------------------------------------------------------------
inst_pe_9: processing_element 
GENERIC map(
 N=>8
  )
port map
  (
    clk=> clk,
    reset=> reset,
    a_in=>a89,
    b_in=>b69,
     -- a=>,
    --  b=>,
    pe=>c9
  );

end Behavioral;
