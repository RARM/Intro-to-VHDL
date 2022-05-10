-- Custom 4-bit Adder
library IEEE;
use IEEE.std_logic_1164.all;

-- Full Adder
-- Entity
entity full_adder is
  port (
    Cin, A, B : in  std_logic;
    Sum, Cout : out std_logic
  ) ;
end full_adder;

-- Architecture
architecture structural of full_adder is
    signal AxorB: std_logic;
begin
    AxorB <= A xor B;
    Sum   <= AxorB xor Cin;
    Cout  <= (AxorB and Cin) or (A and B);
end structural  ; -- structural 

-- Use clauses are part of the unit declaration (package, entity, configuration, etc.) in VHDL.
library IEEE;
use IEEE.std_logic_1164.all;

-- 4-bit Adder
-- Entity
entity add_4 is
  port (
    Data1, Data2 : in  std_logic_vector(3 downto 0);
    Cin          : in  std_logic;
    Cout         : out std_logic;
    Sum          : out std_logic_vector(3 downto 0) 
  ) ;
end add_4;

-- Architecture
architecture dataflow of add_4 is
    component full_adder is
        port (
            Cin, A, B : in  std_logic;
            Sum, Cout : out std_logic
        ) ;
    end component;

    signal c1, c2, c3: std_logic;
begin
    FA1: full_adder port map ( Cin => Cin, A => Data1(0), B => Data2(0), Sum => Sum(0), Cout => c1   );
    FA2: full_adder port map ( Cin => c1,  A => Data1(1), B => Data2(1), Sum => Sum(1), Cout => c2   );
    FA3: full_adder port map ( Cin => c2,  A => Data1(2), B => Data2(2), Sum => Sum(2), Cout => c3   );
    FA4: full_adder port map ( Cin => c3,  A => Data1(3), B => Data2(3), Sum => Sum(3), Cout => Cout );
end dataflow ; -- dataflow?