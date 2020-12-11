----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:23:38 05/13/2019 
-- Design Name: 
-- Module Name:    Random - Behavioral 
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

entity Random is
    Port ( CLK : in  STD_LOGIC;
           GEN : in  STD_LOGIC;
           UPPER : in  STD_LOGIC_VECTOR (9 downto 0);
           SevenSegment : out  STD_LOGIC_VECTOR (6 downto 0);
           Anodes : out  STD_LOGIC_VECTOR (7 downto 0));
end Random;

architecture Behavioral of Random is

		signal NUM : STD_LOGIC_VECTOR (9 downto 0);

begin
			Generator : entity work.Generator(Behavioral)
			PORT MAP(
				CLK => CLK,
				GEN => GEN,
				UPPER => UPPER,
				NUM => NUM
			);
			
			Decoder : entity work.Decoder(Behavioral)
			PORT MAP(
				CLK => CLK,
				NUM => NUM,
				SevenSegment => SevenSegment,
				Anodes => Anodes
			);
			
end Behavioral;

