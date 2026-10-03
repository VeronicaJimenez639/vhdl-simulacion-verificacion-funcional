library IEEE;                              -- Biblioteca estándar IEEE
use IEEE.STD_LOGIC_1164.ALL;               -- Permite utilizar std_logic_vector

entity decodificador_2a4 is
    Port (
        A : in  std_logic_vector(1 downto 0);  -- Entrada binaria de 2 bits
        Y : out std_logic_vector(3 downto 0)   -- Cuatro salidas
    );
end decodificador_2a4;

architecture Behavioral of decodificador_2a4 is
begin

    process(A)                             -- Se ejecuta cuando cambia la entrada
    begin
        case A is
            when "00" => Y <= "0001";      -- Activa salida 0
            when "01" => Y <= "0010";      -- Activa salida 1
            when "10" => Y <= "0100";      -- Activa salida 2
            when "11" => Y <= "1000";      -- Activa salida 3
            when others => Y <= "0000";
        end case;
    end process;

end Behavioral;