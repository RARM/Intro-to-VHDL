library IEEE;
use IEEE.std_logic_1164.all;

entity bidir is
  port (
    OE    : in    std_logic;
    Dout  : in    std_logic_vector(3 downto 0);
    Din   : out   std_logic_vector(3 downto 0);
    IOpin : inout std_logic_vector(3 downto 0)
  ) ;
end bidir ;

architecture bidir_arch of bidir is
begin
    bi_proc : process( OE, Dout )
    begin
        Din <= IOpin;
        if    (OE = '1') then IOpin <= Dout;
        elsif (OE = '0') then IOpin <= "ZZZZ";
        else                  IOpin <= "XXXX";
        end if ;
    end process ; -- bi_proc
end architecture ; -- bidir_arch