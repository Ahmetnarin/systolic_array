library ieee;
use ieee.std_logic_1164.all;

entity tb_systolic_multiplier is
end tb_systolic_multiplier;

architecture tb of tb_systolic_multiplier is

    component systolic_multiplier
        port (clk      : in std_logic;
              reset    : in std_logic;
              matrix_A : in matrix_type;
              matrix_B : in matrix_type;
              matrix_P : out product_matrix;
              complete : out std_logic;
              step     : out integer);
    end component;

    signal clk      : std_logic;
    signal reset    : std_logic;
    signal matrix_A : matrix_type;
    signal matrix_B : matrix_type;
    signal matrix_P : product_matrix;
    signal complete : std_logic;
    signal step     : integer;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : systolic_multiplier
    port map (clk      => clk,
              reset    => reset,
              matrix_A => matrix_A,
              matrix_B => matrix_B,
              matrix_P => matrix_P,
              complete => complete,
              step     => step);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        matrix_A <= '0';
        matrix_B <= '0';

        -- Reset generation
        -- EDIT: Check that reset is really your reset signal
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

--axistream 
-- Handshaking
-- valid and ready