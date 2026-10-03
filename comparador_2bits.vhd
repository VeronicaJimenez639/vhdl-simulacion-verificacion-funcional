library IEEE;                               -- Biblioteca estándar IEEE
use IEEE.STD_LOGIC_1164.ALL;                -- Permite utilizar std_logic_vector
use IEEE.NUMERIC_STD.ALL;                   -- Permite comparar valores unsigned

entity comparador_2bits is
    Port (
        A     : in  std_logic_vector(1 downto 0); -- Primera entrada de 2 bits
        B     : in  std_logic_vector(1 downto 0); -- Segunda entrada de 2 bits
        MAYOR : out std_logic;                    -- A > B
        IGUAL : out std_logic;                    -- A = B
        MENOR : out std_logic                     -- A < B
    );
end comparador_2bits;

architecture Dataflow of comparador_2bits is
begin

    MAYOR <= '1' when unsigned(A) > unsigned(B) else '0'; -- Compara A > B
    IGUAL <= '1' when unsigned(A) = unsigned(B) else '0'; -- Compara A = B
    MENOR <= '1' when unsigned(A) < unsigned(B) else '0'; -- Compara A < B

end Dataflow;