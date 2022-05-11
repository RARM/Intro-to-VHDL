library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add4_tb2 is end entity add4_tb2;

architecture test_add4 of add4_tb2 is

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

    -- Much better coverage.
    Loop_proc : process
        variable i, j: integer;
        variable k: std_logic;
    begin
        for i in 0 to 15 loop
            a_tb <= std_logic_vector(to_signed(i, a_tb'length)); -- test all values for Data1
            for j in 0 to 15 loop
                b_tb <= std_logic_vector(to_signed(j, b_tb'length)); -- test all values for Data2
                for k in std_logic range '0' to '1' loop
                    Cin <= k;
                    if k = '0' then
                        expect <= std_logic_vector(to_signed(i, expect'length) + to_signed(j, expect'length));
                    else
                        expect <= std_logic_vector(to_signed(i, expect'length) + to_signed(j, expect'length) + to_signed(1, expect'length));
                    end if;
                    wait for 10 ps; -- total simulation time = 5120 ns
                    assert expect = Sum_tb -- should be improved to test for carry too...
                        report "Simulation stopped: failed test." severity failure;
                end loop ; -- k
            end loop ; -- j
        end loop ; -- i
    end process ; -- Loop_proc
end test_add4 ; -- test_add4