library IEEE;
use IEEE.std_logic_1164.all;

entity problema_2_7seg is 
    port(
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        HEXA : out std_logic_vector(6 downto 0)
    );
end problema_2_7seg;

architecture structural of problema_2_7seg is
    component problema_2 is
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            Cout : out std_logic;
            Sum : out std_logic_vector(3 downto 0)
				
        );
    end component;

    component bcd_deco
        port (
            NUM : in std_logic_vector(3 downto 0);
            SEG : out std_logic_vector(6 downto 0)
        );
    end component;

    signal Cout : std_logic_vector(3 downto 0) := "0000";
    signal Sum : std_logic_vector(3 downto 0);
    signal SEG : std_logic_vector(6 downto 0);

begin
    adder : problema_2
        port map (
            A,
            B,
            Cin,
            Cout(0),
            Sum
        );

    bcd_conversion : bcd_deco
        port map (
            Sum,
            SEG
        );

    HEXA <= SEG;
end structural;