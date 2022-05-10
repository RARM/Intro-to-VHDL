-- dff with enable
library IEEE;
use IEEE.std_logic_1164.all;

entity dff_ce is
  port (
    d, clk, ce, reset : in  std_logic;
    q                 : out std_logic
  ) ;
end entity dff_ce;

architecture dff_ce_arch of dff_ce is
begin
    dff_proc_3 : process( clk, ce, reset )
    begin
        if (reset = '1') then
            q <= '0'; -- Async
        elsif (rising_edge(clk)) then
            if (ce = '1') then
                q <= d; -- Sync
            end if ;
        end if ;
    end process ; -- dff_proc_3
end dff_ce_arch ; -- dff_ce_arch