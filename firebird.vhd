library ieee;
use ieee.std_logic_1164.all;

entity firebird is 
port (  lsig, rsig, clk, rst : in std_logic;
        leftlight, rightlight : out std_logic_vector(2 downto 0)
	);
end firebird;

architecture arch of firebird is
begin

end arch;
