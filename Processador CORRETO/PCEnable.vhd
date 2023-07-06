LIBRARY IEEE;
use ieee.std_logic_1164.all;

Entity PCEnable is
port (
zero: in std_logic;
branch: in std_logic;
pcWrite: in std_logic;
pcEn: out std_logic
);
end PCEnable;

architecture RTL of PCEnable is
begin
pcEn<= (branch and zero) or pcWrite;
end RTL;