library IEEE;                          -- Biblioteca estándar IEEE
use IEEE.STD_LOGIC_1164.ALL;           -- Permite utilizar señales std_logic

entity compuerta_and_tb is             -- Entidad del testbench, sin puertos externos
end compuerta_and_tb;

architecture Behavioral of compuerta_and_tb is

    signal A_tb : std_logic := '0';    -- Señal de prueba para la entrada A
    signal B_tb : std_logic := '0';    -- Señal de prueba para la entrada B
    signal Y_tb : std_logic;           -- Señal que recibe la salida del circuito
    signal FIN_tb : std_logic := '0';     -- Marca el final de la simulación

begin

    DUT: entity work.compuerta_and     -- Instancia del circuito que se va a probar
        port map (
            A => A_tb,                 -- Conecta A con la señal de prueba A_tb
            B => B_tb,                 -- Conecta B con la señal de prueba B_tb
            Y => Y_tb                  -- Conecta la salida Y con Y_tb
        );

    stimulus: process                  -- Proceso encargado de generar los estímulos
    begin

        -- Prueba 1: A=0, B=0
        A_tb <= '0';
        B_tb <= '0';
        wait for 10 ns;                -- Mantiene la combinación durante 10 ns

        assert Y_tb = '0'              -- Verifica que la salida esperada sea 0
        report "Error en A=0, B=0"
        severity error;

        -- Prueba 2: A=0, B=1
        A_tb <= '0';
        B_tb <= '1';
        wait for 10 ns;

        assert Y_tb = '0'
        report "Error en A=0, B=1"
        severity error;

        -- Prueba 3: A=1, B=0
        A_tb <= '1';
        B_tb <= '0';
        wait for 10 ns;

        assert Y_tb = '0'
        report "Error en A=1, B=0"
        severity error;

        -- Prueba 4: A=1, B=1
        A_tb <= '1';
        B_tb <= '1';
        wait for 10 ns;

        assert Y_tb = '1'              -- Verifica el único caso donde AND debe dar 1
        report "Error en A=1, B=1"
        severity error;

        FIN_tb <= '1';                 -- Genera un evento a los 40 ns

        report "Simulacion finalizada correctamente"
        severity note;                 -- Mensaje al terminar todas las pruebas

        wait;                           -- Detiene el proceso al finalizar
    end process;

end Behavioral;