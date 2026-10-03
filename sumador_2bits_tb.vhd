library IEEE;                               -- Biblioteca estándar IEEE
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;                   -- Permite conversiones numéricas

entity sumador_2bits_tb is                  -- Testbench sin entradas ni salidas
end sumador_2bits_tb;

architecture Behavioral of sumador_2bits_tb is

    signal A_tb : std_logic_vector(1 downto 0) := "00";  -- Entrada A
    signal B_tb : std_logic_vector(1 downto 0) := "00";  -- Entrada B
    signal S_tb : std_logic_vector(2 downto 0);           -- Resultado
    signal FIN_tb : std_logic := '0';   -- Marca el final de la simulación

begin

    DUT: entity work.sumador_2bits           -- Circuito que será probado
        port map (
            A => A_tb,
            B => B_tb,
            S => S_tb
        );

    stimulus: process
    begin

        -- Prueba 1: 0 + 0 = 0
        A_tb <= "00";
        B_tb <= "00";
        wait for 10 ns;

        assert S_tb = "000"
        report "Error en 0 + 0"
        severity error;

        -- Prueba 2: 1 + 1 = 2
        A_tb <= "01";
        B_tb <= "01";
        wait for 10 ns;

        assert S_tb = "010"
        report "Error en 1 + 1"
        severity error;

        -- Prueba 3: 2 + 1 = 3
        A_tb <= "10";
        B_tb <= "01";
        wait for 10 ns;

        assert S_tb = "011"
        report "Error en 2 + 1"
        severity error;

        -- Prueba 4: 2 + 3 = 5
        A_tb <= "10";
        B_tb <= "11";
        wait for 10 ns;

        assert S_tb = "101"
        report "Error en 2 + 3"
        severity error;

        -- Prueba 5: 3 + 3 = 6
        A_tb <= "11";
        B_tb <= "11";
        wait for 10 ns;

        assert S_tb = "110"
        report "Error en 3 + 3"
        severity error;

        FIN_tb <= '1';                      -- Evento al llegar a 50 ns

        report "Simulacion del sumador finalizada correctamente"
        severity note;

        wait;                                -- Finaliza el proceso
    end process;

end Behavioral;