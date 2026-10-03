library IEEE;                           -- Biblioteca estándar IEEE
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2a1_tb is                    -- Testbench sin puertos externos
end mux_2a1_tb;

architecture Behavioral of mux_2a1_tb is

    signal A_tb   : std_logic := '0';   -- Señal de prueba A
    signal B_tb   : std_logic := '0';   -- Señal de prueba B
    signal SEL_tb : std_logic := '0';   -- Señal de selección
    signal Y_tb   : std_logic;          -- Salida del circuito
    signal FIN_tb : std_logic := '0';   -- Marca el final de la simulación

begin

    DUT: entity work.mux_2a1            -- Instancia del multiplexor
        port map (
            A   => A_tb,
            B   => B_tb,
            SEL => SEL_tb,
            Y   => Y_tb
        );

    stimulus: process
    begin

        -- Prueba 1: SEL=0 selecciona A=0
        A_tb   <= '0';
        B_tb   <= '1';
        SEL_tb <= '0';
        wait for 10 ns;

        assert Y_tb = '0'
        report "Error en prueba 1"
        severity error;

        -- Prueba 2: SEL=1 selecciona B=1
        SEL_tb <= '1';
        wait for 10 ns;

        assert Y_tb = '1'
        report "Error en prueba 2"
        severity error;

        -- Prueba 3: SEL=0 selecciona A=1
        A_tb   <= '1';
        B_tb   <= '0';
        SEL_tb <= '0';
        wait for 10 ns;

        assert Y_tb = '1'
        report "Error en prueba 3"
        severity error;

        -- Prueba 4: SEL=1 selecciona B=0
        SEL_tb <= '1';
        wait for 10 ns;

        assert Y_tb = '0'
        report "Error en prueba 4"
        severity error;

        FIN_tb <= '1';                  -- Genera un evento al finalizar

        report "Simulacion del MUX finalizada correctamente"
        severity note;

        wait;
    end process;

end Behavioral;