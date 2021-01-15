library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_div is
    port ( clkin : in std_logic;
            rst : in std_logic;
            clkout : out std_logic);
    end clk_div;
    
    architecture arch of clk_div is
        constant divider : integer := 10e6;
        signal counter : integer := 0;
        signal tmp : std_logic;
    begin
        divide : process (clkin)
        begin
            if (clkin'event and clkin='1') then
                if (rst='0') then
                    counter <= divider;
                    tmp <= '0';
                else 
                    if (counter = 0) then
                        counter <= divider;
                        tmp <= not tmp;
                    else
                        counter <= counter - 1;
                    end if;
                end if;
            end if;
            clkout <= tmp;
        end process;
    end arch;
    