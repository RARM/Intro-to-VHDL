-- 4-bit shift register. --
-- This code has to be compiled using language syntax 1076-2008 minimum,
-- to allow using output pins on internal logic.
library IEEE;
use IEEE.std_logic_1164.all;

entity Shift_Reg is
  port (
    clk, reset, shift, d0 : in  std_logic;
    q                     : out std_logic_vector(3 downto 0)
  ) ;
end Shift_Reg ;

architecture SReg_Arch of Shift_Reg is
begin
    sreg_proc : process( clk, reset )
    begin
        if (reset = '1') then
            q <= "0000"; -- resetting
        elsif ( rising_edge(clk) ) then
            if ( shift = '1' ) then -- processing input
                q(0) <= d0;         -- interesting observation: these pins
                q(1) <= q(0);       -- aren't assigned sequentially. The value of d0 
                q(2) <= q(1);       -- won't be carried over to q(3).
                q(3) <= q(2);       -- standard 2008 is need for this to work.
            end if ;
        end if ;
    end process ; -- sreg_proc
end architecture ; -- arch