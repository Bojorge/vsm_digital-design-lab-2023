library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_problema_2_7seg is
end entity testbench_problema_2_7seg;

architecture testbench of testbench_problema_2_7seg is
    signal A : std_logic_vector(3 downto 0) := "0000";
    signal B : std_logic_vector(3 downto 0) := "0000";
    signal Cin : std_logic := '0';
    signal HEXA : std_logic_vector(6 downto 0);

    component problema_2_7seg is
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            HEXA : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    DUT : problema_2_7seg
        port map (
            A,
            B,
            Cin,
            HEXA
        );

    -- Simulación de entrada
    process
    begin
        A <= "0010";
        B <= "0101";
        Cin <= '0';
        wait for 10 ns;

        A <= "0111";
        B <= "1000";
        Cin <= '0';
        wait for 10 ns;

        -- Agregar más 

        wait;
    end process;

end architecture testbench;
