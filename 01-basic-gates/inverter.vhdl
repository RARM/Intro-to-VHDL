library IEEE;
use IEEE.std_logic_1164.all;

entity my_inverter is
  port (
    X:     in  std_logic;
    NOT_X: out std_logic
  );
end my_inverter;

architecture behavior of my_inverter is
begin
    NOT_X <= not X;
end behavior ;