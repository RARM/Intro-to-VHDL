library IEEE;
use IEEE.std_logic_1164.all;

use IEEE.std_logic_textio.all; -- these two used for the monitor process
use std.textio.all;            -- For syntax check, run: ghdl -s -fsynopsys add4-tb.vhdl

entity add4_tb is end entity add4_tb;

architecture test_add4 of add4_tb is

    component add_4 is
        port (
            Data1, Data2 : in  std_logic_vector(3 downto 0);
            Cin          : in  std_logic;
            Cout         : out std_logic;
            Sum          : out std_logic_vector(3 downto 0) 
        ) ;
    end component add_4;

    signal a_tb, b_tb : std_logic_vector(3 downto 0); -- input
    signal Cin        : std_logic;                    -- input
    signal Sum_tb     : std_logic_vector(3 downto 0); -- output
    signal Cout_tb    : std_logic;                    -- output
    signal expect     : std_logic_vector(3 downto 0); -- expected

begin
    -- Device Under Test (DUT) Instantiation
    DUT : add_4 port map (Data1 => a_tb, Data2 => b_tb, Cin => Cin, Cout => Cout_tb, Sum => Sum_tb);

    -- Simulus by hand drawn waves, poor coverage
    stim_proc : process
    begin
        wait for 0 ps;
            a_tb <= "0010"; b_tb <= "0010"; Cin <= '0'; expect <= "0100";
        wait for 10 ps;
            a_tb <= "1111"; b_tb <= "0000"; Cin <= '1'; expect <= "0000";
        wait for 10 ps;
            a_tb <= "0010"; b_tb <= "0100"; Cin <= '1'; expect <= "0111";
        wait;
    end process stim_proc; -- stim_proc

    -- Monitor
    txt_out : process( Sum_tb, Cout_tb )
        variable str_o : line;
    begin
        -- preparing the data in str_o
        write(str_o, string'(" a="));      write(str_o, a_tb);
        write(str_o, string'(" b="));      write(str_o, b_tb);
        write(str_o, string'(" cin="));    write(str_o, Cin);
        write(str_o, string'(" sum="));    write(str_o, Sum_tb);
        write(str_o, string'(" cout="));   write(str_o, Cout_tb);
        write(str_o, string'(" expect=")); write(str_o, expect);

        -- printing the data
        assert false report time'image(now) & str_o.all severity note;
    end process ; -- txt_out
end test_add4 ; -- test_add4