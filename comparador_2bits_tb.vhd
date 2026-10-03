library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparador_2bits_tb is
end comparador_2bits_tb;

architecture Behavioral of comparador_2bits_tb is

    signal A_tb     : std_logic_vector(1 downto 0) := "00"; -- Entrada A
    signal B_tb     : std_logic_vector(1 downto 0) := "00"; -- Entrada B
    signal MAYOR_tb : std_logic;                            -- A > B
    signal IGUAL_tb : std_logic;                            -- A = B
    signal MENOR_tb : std_logic;                            -- A < B
    signal FIN_tb   : std_logic := '0';                     -- Fin de simulación

begin

    DUT: entity work.comparador_2bits
        port map (
            A     => A_tb,
            B     => B_tb,
            MAYOR => MAYOR_tb,
            IGUAL => IGUAL_tb,
            MENOR => MENOR_tb
        );

    stimulus: process
    begin

        -- Prueba 1: A = B
        A_tb <= "00";
        B_tb <= "00";
        wait for 10 ns;

        assert IGUAL_tb = '1'
        report "Error en A=0, B=0"
        severity error;

        -- Prueba 2: A < B
        A_tb <= "01";
        B_tb <= "10";
        wait for 10 ns;

        assert MENOR_tb = '1'
        report "Error en A=1, B=2"
        severity error;

        -- Prueba 3: A > B
        A_tb <= "11";
        B_tb <= "01";
        wait for 10 ns;

        assert MAYOR_tb = '1'
        report "Error en A=3, B=1"
        severity error;

        -- Prueba 4: A = B
        A_tb <= "10";
        B_tb <= "10";
        wait for 10 ns;

        assert IGUAL_tb = '1'
        report "Error en A=2, B=2"
        severity error;

        -- Prueba 5: A < B
        A_tb <= "00";
        B_tb <= "11";
        wait for 10 ns;

        assert MENOR_tb = '1'
        report "Error en A=0, B=3"
        severity error;

        FIN_tb <= '1';

        report "Simulacion del comparador finalizada correctamente"
        severity note;

        wait;
    end process;

end Behavioral;