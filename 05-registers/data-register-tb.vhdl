-- Data Register Test Bench --
library IEEE;
use IEEE.std_logic_1164.all;

entity dr_tb is
end dr_tb;

architecture test of dr_tb is
    component Data_Reg
        port (
            clk, reset, load : in  std_logic;
            d                : in  std_logic_vector(3 downto 0);
            q                : out std_logic_vector(3 downto 0)
        ) ;
    end component ;

    signal clk, rst, load  : std_logic;
    signal data, o         : std_logic_vector(3 downto 0);

begin
    DReg: Data_Reg port map (clk => clk, reset => rst, load => load, d => data, q => o);

    dr_ts_proc : process
    begin
        
        clk <= '1';
        rst <= '1';
        load <= '0';
        data <= "0000";
        wait for 5 ps;

        clk <= '0';
        rst <= '1';
        load <= '0';
        data <= "0000";
        wait for 5 ps;

        clk <= '1';
        rst <= '0';
        load <= '1';
        data <= "0101";
        wait for 5 ps;

        clk <= '0';
        rst <= '0';
        load <= '0';
        data <= "1010";
        wait for 5 ps;

        report "Reached end of test bench.";
        wait;

    end process ; -- dr_ts_proc
end test ; -- test