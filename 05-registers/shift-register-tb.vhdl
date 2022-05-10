-- Run simulation for a total of 60 ps. --
library IEEE;
use IEEE.std_logic_1164.all;

entity sreg_tb is
end sreg_tb;

architecture sreg_tb_arch of sreg_tb is
    component Shift_Reg port (
        clk, reset, shift, d0 : in  std_logic;
        q                     : out std_logic_vector(3 downto 0)
    );
    end component;

    signal clk, reset, shift, d0 : std_logic;
    signal q                     : std_logic_vector(3 downto 0);
begin
    SReg: Shift_Reg port map (clk => clk, reset => reset, shift => shift, d0 => d0, q => q);

    sreg_tb_proc : process
    begin
        -- start of test bench --

            clk   <= '0';
            reset <= '1';
            shift <= '0';
            d0    <= '0';
            wait for 5 ps;

            clk   <= '1';
            reset <= '1';
            shift <= '0';
            d0    <= '0';
            wait for 5 ps;

            -- this is how to test and report issues
            -- assert (the test) report (message on test == false) severity ("failure" for stopping the simulation)
            assert q = "0000" report "Reset pin not working." severity failure;

            clk   <= '0';
            reset <= '0';
            shift <= '1';
            d0    <= '1';
            wait for 5 ps;

            clk   <= '1';
            reset <= '0';
            shift <= '1';
            d0    <= '1';
            wait for 5 ps;

            assert q = "0001" report "Failed to load 0001 into the register." severity failure;

            clk   <= '0';
            reset <= '0';
            shift <= '0';
            d0    <= '1';
            wait for 5 ps;

            clk   <= '1';
            reset <= '0';
            shift <= '0';
            d0    <= '1';
            wait for 5 ps;

            assert q = "0001" report "Failed to keep value 0001 after setting shift to 0." severity failure;

            clk   <= '0';
            reset <= '0';
            shift <= '1';
            d0    <= '0';
            wait for 5 ps;

            clk   <= '1';
            reset <= '0';
            shift <= '1';
            d0    <= '0';
            wait for 5 ps;

            assert q = "0010" report "Failed to load 0010 to the register." severity failure;

            clk   <= '0';
            reset <= '0';
            shift <= '1';
            d0    <= '1';
            wait for 5 ps;

            clk   <= '1';
            reset <= '0';
            shift <= '1';
            d0    <= '1';
            wait for 5 ps;

            assert q = "0101" report "Failed to load 0101 to the register." severity failure;

            clk   <= '0';
            reset <= '0';
            shift <= '1';
            d0    <= '0';
            wait for 5 ps;

            clk   <= '1';
            reset <= '0';
            shift <= '1';
            d0    <= '0';
            wait for 5 ps;

            assert q = "1010" report "Failed to load 1010 to the register." severity failure;

            assert false report "Test bench completed.";

            end process ; -- sreg_tb_pro
end sreg_tb_arch ; -- sreg_tb_arch