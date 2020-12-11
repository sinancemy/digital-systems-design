----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:41:59 03/27/2019 
-- Design Name: 
-- Module Name:    SevenSegmentDecoder - Behavioral 
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

entity SevenSegmentDecoder is
		Port ( 
				Score : in  STD_LOGIC_VECTOR (3 downto 0);
				SevenSegment : out  STD_LOGIC_VECTOR (6 downto 0);
				SegmentAnodes : out  STD_LOGIC_VECTOR (7 downto 0));
end SevenSegmentDecoder;

architecture Behavioral of SevenSegmentDecoder is
begin		
		process(Score) is
		begin
			if (Score="0000") then
				SegmentAnodes <= "11111110";
				SevenSegment <= "0000001"; -- "0"
			elsif (Score="0001") then
				SegmentAnodes <= "11111110";
				SevenSegment <= "1001111"; -- "1"
			elsif (Score="0010") then
				SegmentAnodes <= "11111110";
				SevenSegment <= "0010010"; -- "2"
			elsif (Score="0011") then
				SegmentAnodes <= "11111110";
				SevenSegment <= "0000110"; -- "3"
			elsif (Score="0100") then
				SegmentAnodes <= "11111110";
				SevenSegment <= "1001100"; -- "4"
			elsif (Score="0101") then
				SegmentAnodes <= "11111110";
				SevenSegment <= "0100100"; -- "5"
			elsif (Score="0110") then
				SegmentAnodes <= "11111110";
				SevenSegment <= "0100000"; -- "6"
			elsif (Score="0111") then
				SegmentAnodes <= "11111110";
				SevenSegment <= "0001111"; -- "7"
			elsif (Score="1000") then
				SegmentAnodes <= "11111110";
				SevenSegment <= "0000000"; -- "8"
			elsif (Score="1001") then
				SegmentAnodes <= "11111110";
				SevenSegment <= "0000100"; -- "9"
			else
				SegmentAnodes <= "11111110";
				SevenSegment <= "0110000"; -- "E"
			end if;
		end process;

end Behavioral;

