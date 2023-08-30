library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( A : in std_logic;
           B : in std_logic;
           Cin : in std_logic;
           Sum : out std_logic;
           Cout : out std_logic);
end full_adder;

architecture Behavioral of full_adder is
begin
    Sum <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND (A XOR B));
end Behavioral;
