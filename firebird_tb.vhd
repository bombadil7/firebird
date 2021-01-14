library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity firebird_tb is
end firebird_tb;

architecture behavior of firebird_tb is

    -- Component declaration for UUT
   component firebird is
		port (  lsig, rsig, clk, rst : in std_logic;
			leftlight, rightlight : out std_logic_vector(2 downto 0)
		);
   end component;

   -- Inputs
   signal lsig : std_logic := '0';
   signal rsig : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

   -- Outputs
   signal leftlight : std_logic_vector(2 downto 0);
   signal rightlight : std_logic_vector(2 downto 0);

begin

    -- Instantiate the UUT
    uut: firebird port map(
		lsig => lsig,
		rsig => rsig,
		clk => clk,
		rst => rst,
		leftlight => leftlight,
		rightlight => rightlight
    );

    -- Stimulus goes here
    tb : process
    begin
        wait for 100 ns;


        wait;
    end process;

end behavior;
