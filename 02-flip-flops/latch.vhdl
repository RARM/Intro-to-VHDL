-- latch.vhdl - demonstrates how to create a latch
library IEEE;
use IEEE.std_logic_1164.all;

entity DLatches is
  port(
    d, gate, clr : in  std_logic;
    q            : out std_logic
  );
end DLatches;

architecture LArch of DLatches is
begin
    latch_proc_1 : process( gate, d )
    begin
        if (clr = '1') then
            q <= '0';
        elsif (gate = '1') then
            q <= d;
        end if;
        -- no gate = '0' or else statement, so gate is inferred
    end process latch_proc_1;

end LArch ; -- LArch