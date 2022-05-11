-- This test bench demonstrate how to use 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use std.textio.all;

entity Counter_tb is end Counter_tb;

architecture test_bench of Counter is

    component Counter port (
        d                    : in  std_logic_vector(3 downto 0);
        clk, reset, load, en : in  std_logic;
        q                    : out std_logic_vector(3 downto 0)
    );
    end component Counter;

    constant delay : integer := 10; 
    constant n     : integer := 4;     -- width counter
    constant T     : time    := 20 ns; -- clock period

    -- := is used instead because it is an initialization
    signal clock   : std_logic := '0'; -- clock generator
    signal reset_tb   : std_logic := '0'; -- reset generator

    -- stimulus
    signal data_tb : std_logic_vector(n-1 downto 0) := "0000";
    signal load_tb    : std_logic := '0';
    signal en_tb      : std_logic := '0';

    -- expected output
    signal q_tb    : std_logic_vector(3 downto 0);
    signal check   : std_logic_vector(n-1 downto 0) := "0000";

begin

    DUT : Counter port map (
        d => data_tb,
        clk => clock,  reset => reset_tb,
        load => load_tb,  en => en_tb,
        q => q_tb
    );

    -- clock generator
    clk_gen : process
    begin
        clock <= '0';
        wait for T/2; -- constant defined above
        clock <= '1';
        wait for T/2;
    end process;

    reset_tb <= '1', '0' after 10 ns; -- runs just once at the beginning

    test_proc : process
        variable line_o : line;
    begin
        wait until falling_edge(reset_tb);
        wait until falling_edge(clock);
        
        -- testing load
        load_tb <= '1'; en_tb <= '0';
        data_tb <= "1010";

        wait until falling_edge(clock);

        if (q_tb /= "1010") then -- report a message if the load failed
            write(line_o, string'("Load fail "));
            write(line_o, q_tb);
            writeline(output, line_o);
        end if;

        -- further automated test
        check <= "1010";
        load_tb  <= '0';
        en_tb    <= '1';

        for i in 1 to 2**n loop
            check <= std_logic_vector(unsigned(check) + 1);
            wait until falling_edge(clock);
            if (q_tb /= check) then -- report if counter failed
                report "count fail at time count " & time'image(now) & integer'image(i);
            end if;
        end loop;
        wait;
    end process;

end architecture;