----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:58:30 04/26/2019 
-- Design Name: 
-- Module Name:    DAC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- OPERATIONS(1)itional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DAC is

Generic (N : INTEGER:=50*10**6;
                M: INTEGER:=65536);
					 
Port (MCLK : in STD_LOGIC;
		A : in STD_LOGIC_VECTOR(7 downto 0);
		OPERATIONS : in STD_LOGIC_VECTOR(5 downto 0); -- from MSB to LSB: SUB ADD NOT XOR OR AND
		RESULT : out STD_LOGIC_VECTOR(7 downto 0);
		SevenSegment : out STD_LOGIC_VECTOR (6 downto 0);
		Anodes : out STD_LOGIC_VECTOR (7 downto 0));
		
end DAC;

architecture Behavioral of DAC is

	signal CLK_DIV : STD_LOGIC;
	signal OUT1: STD_LOGIC_VECTOR (3 downto 0);
	signal OUT2: STD_LOGIC_VECTOR (3 downto 0);
	signal OUT3: STD_LOGIC_VECTOR (3 downto 0);
	signal X_DEC : STD_LOGIC;
	signal INTER_RESULT : STD_LOGIC_VECTOR(7 downto 0);
	 
	begin
		process(MCLK)
			variable Counter : INTEGER range 0 to N;
			begin   
				if rising_edge(MCLK) then
					Counter := Counter + 1;
					if (Counter = N/15-1) then
						Counter := 0;
						CLK_DIV <= not CLK_DIV;             
					end if;
				end if;
		end process;
		
		Converter : entity work.Converter(Behavioral)
			PORT MAP(
				INTER_RESULT => INTER_RESULT,
				OUT1 => OUT1,
				OUT2 => OUT2,
				OUT3 => OUT3
			);
		
		Computer : entity work.Computer(Behavioral)
			PORT MAP(
				CLK_DIV => CLK_DIV,
				A => A,
				X_DEC => X_DEC,
				OPERATIONS => OPERATIONS,
				RESULT => RESULT,
				INTER_RESULT => INTER_RESULT
			);
	 
		Decoder : entity work.SevenSegmentDecoder(Behavioral)
			PORT MAP(
				SevenSegment => SevenSegment,
				Anodes => Anodes,
				OUT1 => OUT1,
				OUT2 => OUT2,
				OUT3 => OUT3,
				X_DEC => X_DEC,
				MCLK => MCLK
			);

end Behavioral;