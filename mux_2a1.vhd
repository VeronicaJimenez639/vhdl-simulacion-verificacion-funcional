library IEEE;                           -- Biblioteca estándar IEEE
use IEEE.STD_LOGIC_1164.ALL;            -- Permite utilizar señales std_logic

entity mux_2a1 is
    Port (
        A   : in  std_logic;            -- Entrada A
        B   : in  std_logic;            -- Entrada B
        SEL : in  std_logic;            -- Señal de selección
        Y   : out std_logic             -- Salida del multiplexor
    );
end mux_2a1;

architecture Dataflow of mux_2a1 is
begin

    Y <= A when SEL = '0' else B;       -- Selecciona A o B según SEL

end Dataflow;