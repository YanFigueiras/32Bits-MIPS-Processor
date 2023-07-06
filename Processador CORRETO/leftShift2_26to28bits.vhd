LIBRARY IEEE;
use ieee.std_logic_1164.all;

Entity leftShift2_26to28bits is
port (
entrada: in std_logic_vector (25 downto 0);
saida: out std_logic_vector (27 downto 0)
);
end leftShift2_26to28bits;

architecture Leftshift2 of leftShift2_26to28bits is
begin
saida <= entrada(25 downto 0) & "00"; 
end Leftshift2;