library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity problema_2 is
    Port ( A : in std_logic_vector(3 downto 0);
           B : in std_logic_vector(3 downto 0);
           Cin : in std_logic;
           Sum : out std_logic_vector(3 downto 0);
           Cout : out std_logic);
end problema_2;

architecture Behavioral of problema_2 is
    signal carry : std_logic_vector(3 downto 0);
    component full_adder
        Port ( A : in std_logic;
               B : in std_logic;
               Cin : in std_logic;
               Sum : out std_logic;
               Cout : out std_logic);
    end component;
	 
begin
    carry(0) <= Cin;
	         FA_instance0: full_adder
        port map (
            A => A(0),
            B => B(0),
            Cin => carry(0),
            Sum => Sum(0),
            Cout => carry(1)
        );
		          FA_instance1: full_adder
        port map (
            A => A(1),
            B => B(1),
            Cin => carry(1),
            Sum => Sum(1),
            Cout => carry(2)
        );
		          FA_instance2: full_adder
        port map (
             A => A(2),
            B => B(2),
            Cin => carry(2),
            Sum => Sum(2),
            Cout => carry(3)
        );
		          FA_instance3: full_adder
        port map (
            A => A(3),
            B => B(3),
            Cin => carry(3),
            Sum => Sum(3),
            Cout => Cout
        );


end Behavioral;




