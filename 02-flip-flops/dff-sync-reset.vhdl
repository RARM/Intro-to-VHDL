-- D Flip-Flop with synchronous reset --
library IEEE;
use IEEE.std_logic_1164.all;

entity dff_sync is
  port (
    d, clk, reset : in  std_logic;
    q             : out std_logic
  ) ;
end dff_sync;

architecture dff_arch of dff_sync is
begin
    dff_proc_1 : process( clk )
    begin
        if (rising_edge(clk)) then -- ( clk'event and clk='1' )
            if (reset = '1') then
                q <= '0'; -- sync reset
            else
                q <= d;
            end if ;
        end if ;
    end process ; -- dff_proc_1
end dff_arch ; -- dff_arch