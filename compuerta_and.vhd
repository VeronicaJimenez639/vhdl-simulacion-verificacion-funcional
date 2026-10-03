library IEEE;                          -- Biblioteca estándar IEEE
use IEEE.STD_LOGIC_1164.ALL;           -- Permite usar el tipo std_logic

entity compuerta_and is
    Port (
        A : in  std_logic;             -- Entrada A
        B : in  std_logic;             -- Entrada B
        Y : out std_logic              -- Salida del circuito
    );
end compuerta_and;

architecture Behavioral of compuerta_and is
begin

    Y <= A and B;                      -- Operación lógica AND entre A y B

end Behavioral;
