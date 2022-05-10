-- Implementation of a simple 4bits multiplexer. --
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
    MX_OUT <= A when (SEL = "00") else
              B when (SEL = "01") else
              C when (SEL = "10") else
              D when (SEL = "11") else
              '0';
--  Other solution:                                               --
--  MX_OUT <= A when (SEL(1) = '0' AND SEL(0) = '0') else         --
--            B when (SEL(1) = '0' AND SEL(0) = '1') else         --
--            C when (SEL(1) = '1' AND SEL(0) = '0') else         --
--            D when (SEL(1) = '1' AND SEL(0) = '1') else         --
--            '0';                                                --
end my_4bit_mux_arch1 ; -- my_4bit_mux_arch1