-- Another implementation of a simple 4bits multiplexer. --
library IEEE;
use IEEE.std_logic_1164.all;

entity my_4bit_mux is
  port (
    A, B, C, D: in  std_logic;
    SEL       : in  std_logic_vector(1 downto 0);
    MX_OUT    : out std_logic
  );
end my_4bit_mux;

architecture my_4bit_mux_arch1 of my_4bit_mux is
begin
    with SEL select
        MX_OUT <= A when "00",
                  B when "01",
                  C when "10",
                  D when "11",
                  '0' when others;
end my_4bit_mux_arch1 ; -- my_4bit_mux_arch1