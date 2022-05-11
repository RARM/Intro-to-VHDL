library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Counter is
  port (
        clk, reset, load, en : in  std_logic;
        d                    : in  std_logic_vector(3 downto 0);
        q                    : out std_logic_vector(3 downto 0)
  ) ;
end Counter ;

architecture behavioral of Counter is
begin
    count_proc : process( clk, reset, load, en )
    begin
        if (reset = '1') then
            q <= "0000";
        elsif (rising_edge(clk)) then
            if (load = '1') then
                q <= d;
            elsif (en = '1') then
                q <= std_logic_vector(unsigned(q) + 1); -- requires 2008 standard
            end if ;
        end if;
    end process ;
end architecture ;