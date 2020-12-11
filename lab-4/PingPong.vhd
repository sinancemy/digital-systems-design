----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:40:19 03/27/2019 
-- Design Name: 
-- Module Name:    PingPong - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PingPong is
	Generic (N : INTEGER:=50*10**6);
   Port (L_Button : in  STD_LOGIC;
         R_Button : in  STD_LOGIC;
			MCLK : in  STD_LOGIC;
         LEDS : out  STD_LOGIC_VECTOR (9 downto 0);
         SevenSegment : out  STD_LOGIC_VECTOR (6 downto 0);
         SegmentAnodes : out  STD_LOGIC_VECTOR (7 downto 0));
end PingPong;

architecture Behavioral of PingPong is
			signal L_LED : STD_LOGIC;
			signal R_LED : STD_LOGIC;
			
			signal INTER_SCORE : STD_LOGIC_VECTOR (3 downto 0);
			
			signal CLK_DIV : STD_LOGIC;
begin

		process(MCLK)
			variable Counter : INTEGER range 0 to N;
			begin
			if rising_edge(MCLK) then
					Counter := Counter + 1;
				if (Counter = N/8-1) then
					Counter := 0;
					CLK_DIV <= not CLK_DIV;
				end if;
			end if;
		end process;

		LEDDisplay : entity work.LEDDisplay(Behavioral) PORT MAP(
				CLK_DIV => CLK_DIV,
				LEDS => LEDS,
				L_LED => L_LED,
				R_LED => R_LED
			);
		
		BallCatcher : entity work.BallCatcher(Behavioral) PORT MAP(
				L_Button => L_Button,
				R_Button => R_Button,
				L_LED => L_LED,
				R_LED => R_LED,
				CLK_DIV => CLK_DIV,
				SCORE => INTER_SCORE
			);
			
		SevenSegmentDecoder : entity work.SevenSegmentDecoder(Behavioral) PORT MAP(
				Score => INTER_SCORE,
				SevenSegment => SevenSegment,
				SegmentAnodes => SegmentAnodes
			);


end Behavioral;

