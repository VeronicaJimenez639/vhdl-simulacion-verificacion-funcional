library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador_2a4_tb is
end decodificador_2a4_tb;

architecture Behavioral of decodificador_2a4_tb is

    signal A_tb   : std_logic_vector(1 downto 0) := "00";  -- Entrada de prueba
    signal Y_tb   : std_logic_vector(3 downto 0);           -- Salida obtenida
    signal FIN_tb : std_logic := '0';                       -- Fin de simulación

begin

    DUT: entity work.decodificador_2a4
        port map (
            A => A_tb,
            Y => Y_tb
        );

    stimulus: process
    begin

        -- Prueba 1
        A_tb <= "00";
        wait for 10 ns;

        assert Y_tb = "0001"
        report "Error para A=00"
        severity error;

        -- Prueba 2
        A_tb <= "01";
        wait for 10 ns;

        assert Y_tb = "0010"
        report "Error para A=01"
        severity error;

        -- Prueba 3
        A_tb <= "10";
        wait for 10 ns;

        assert Y_tb = "0100"
        report "Error para A=10"
        severity error;

        -- Prueba 4
        A_tb <= "11";
        wait for 10 ns;

        assert Y_tb = "1000"
        report "Error para A=11"
        severity error;

        FIN_tb <= '1';

        report "Simulacion del decodificador finalizada correctamente"
        severity note;

        wait;
    end process;

end Behavioral;