library ieee;
use ieee.std_logic_1164.all;

entity firebird is 
port (  lsig, rsig, clk, rst : in std_logic;
		leftlight, rightlight : out std_logic_vector(2 downto 0)
	);
end firebird;

architecture arch of firebird is
    component clk_div is
    port ( clkin : in std_logic;
            rst : in std_logic;
            clkout : out std_logic);
    end component;

	type state is (OFF, L1, L2, L3, R1, R2, R3);
    signal pr_state, nx_state : state;
    signal slowclk : std_logic;
begin

    divider: clk_div port map (
        clkin => clk,
        rst => rst,
        clkout => slowclk
    );

    process (slowclk, rst)
    begin
        if (rst='0') then
            pr_state <= OFF;
        elsif (slowclk'event and slowclk='1') then
            pr_state <= nx_state;
        end if;
    end process;

    process (lsig, rsig, pr_state)
    begin
        case pr_state is
            when OFF => 
                if lsig='1' then nx_state <= L1;
                elsif rsig='1' then nx_state <= R1;
                else nx_state <= OFF;
                end if;
            when L1 => 
                if lsig='1' then nx_state <= L2;
                else nx_state <= OFF;
                end if;
            when L2 => 
                if lsig='1' then nx_state <= L3;
                else nx_state <= OFF;
                end if;
            when L3 => 
                nx_state <= OFF;
            when R1 => 
                if rsig='1' then nx_state <= R2;
                else nx_state <= OFF;
                end if;
            when R2 => 
                if rsig='1' then nx_state <= R3;
                else nx_state <= OFF;
                end if;
            when R3 => 
                nx_state <= OFF;
        end case;
    end process;

    process (pr_state)
    begin
        case pr_state is
            when OFF => 
                leftlight <= "000";
                rightlight <= "000"; 
            when L1 => 
                leftlight <= "001";
                rightlight <= "000"; 
            when L2 => 
                leftlight <= "011";
                rightlight <= "000"; 
            when L3 => 
                leftlight <= "111";
                rightlight <= "000"; 
            when R1 => 
                leftlight <= "000";
                rightlight <= "100"; 
            when R2 => 
                leftlight <= "000";
                rightlight <= "110"; 
            when R3 => 
                leftlight <= "000";
                rightlight <= "111"; 
        end case;
    end process;

end arch;