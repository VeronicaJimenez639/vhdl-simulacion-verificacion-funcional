library IEEE;                               -- Biblioteca estándar IEEE
use IEEE.STD_LOGIC_1164.ALL;                -- Permite utilizar std_logic_vector
use IEEE.NUMERIC_STD.ALL;                   -- Permite realizar operaciones aritméticas

entity sumador_2bits is
    Port (
        A : in  std_logic_vector(1 downto 0);   -- Primer número de 2 bits
        B : in  std_logic_vector(1 downto 0);   -- Segundo número de 2 bits
        S : out std_logic_vector(2 downto 0)    -- Resultado de 3 bits
    );
end sumador_2bits;

architecture Behavioral of sumador_2bits is
begin

    S <= std_logic_vector(
            resize(unsigned(A), 3) +            -- Convierte y amplía A a 3 bits
            resize(unsigned(B), 3)              -- Convierte y amplía B a 3 bits
         );

end Behavioral;