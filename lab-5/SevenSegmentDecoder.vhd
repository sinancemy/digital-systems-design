----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:32:30 04/26/2019 
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

entity SevenSegmentDecoder is
			Generic (N : INTEGER:=50*10**6;
                M: INTEGER:=65536);
			Port (MCLK : in STD_LOGIC;
			
					OUT1 : in STD_LOGIC_VECTOR (3 downto 0);
					OUT2 : in STD_LOGIC_VECTOR (3 downto 0);
					OUT3 : in STD_LOGIC_VECTOR (3 downto 0);
			
					X_DEC : in STD_LOGIC;
					
					SevenSegment : out STD_LOGIC_VECTOR (6 downto 0);
					Anodes : out STD_LOGIC_VECTOR (7 downto 0));

end SevenSegmentDecoder;
	
architecture Behavioral of SevenSegmentDecoder is

begin

process(MCLK)
		 variable Counter : INTEGER range 0 to M;
		 begin       
			  if(rising_edge(MCLK)) then
					Counter :=Counter+1;
					if (Counter mod M = 0) then
						 if(OUT3="0000") then
							  Anodes <= "11111110";
							  SevenSegment <= "0000001";
						 elsif (OUT3="0001") then
							  Anodes <= "11111110";
							  SevenSegment <= "1001111"; 
						 elsif (OUT3="0010") then
							  Anodes <= "11111110";
							  SevenSegment <= "0010010"; 
						 elsif (OUT3="0011") then
							  Anodes <= "11111110";
							  SevenSegment <= "0000110"; 
						 elsif (OUT3="0100") then
							  Anodes <= "11111110";
							  SevenSegment <= "1001100"; 
						 elsif (OUT3="0101") then
							  Anodes <= "11111110";
							  SevenSegment <= "0100100"; 
						 elsif (OUT3="0110") then
							  Anodes <= "11111110";
							  SevenSegment <= "0100000"; 
						 elsif (OUT3="0111") then
							  Anodes <= "11111110";
							  SevenSegment <= "0001111"; 
						 elsif (OUT3="1000") then
							  Anodes <= "11111110";
							  SevenSegment <= "0000000";
						 elsif (OUT3="1001") then
							  Anodes <= "11111110";
							  SevenSegment <= "0000100";
						 end if;
					elsif (Counter mod M = 1*M/8) then
						 if(OUT2="0000") then
							  Anodes <= "11111101";
							  SevenSegment <= "0000001"; 
						 elsif (OUT2="0001") then
							  Anodes <= "11111101";
							  SevenSegment <= "1001111"; 
						 elsif (OUT2="0010") then
							  Anodes <= "11111101";
							  SevenSegment <= "0010010"; 
						 elsif (OUT2="0011") then
							  Anodes <= "11111101";
							  SevenSegment <= "0000110"; 
						 elsif (OUT2="0100") then
							  Anodes <= "11111101";
							  SevenSegment <= "1001100"; 
						 elsif (OUT2="0101") then
							  Anodes <= "11111101";
							  SevenSegment <= "0100100"; 
						 elsif (OUT2="0110") then
							  Anodes <= "11111101";
							  SevenSegment <= "0100000"; 
						 elsif (OUT2="0111") then
							  Anodes <= "11111101";
							  SevenSegment <= "0001111"; 
						 elsif (OUT2="1000") then
							  Anodes <= "11111101";
							  SevenSegment <= "0000000"; 
						 elsif (OUT2="1001") then
							  Anodes <= "11111101";
							  SevenSegment <= "0000100"; 
						 end if;
					elsif (Counter mod M = 2*M/8) then
						 if(OUT1="0000") then
							  Anodes <= "11111011";
							  SevenSegment <= "0000001"; 
						 elsif (OUT1="0001") then
							  Anodes <= "11111011";
							  SevenSegment <= "1001111"; 
						 elsif (OUT1="0010") then
							  Anodes <= "11111011";
							  SevenSegment <= "0010010"; 
						 elsif (OUT1="0011") then
							  Anodes <= "11111011";
							  SevenSegment <= "0000110"; 
						 elsif (OUT1="0100") then
							  Anodes <= "11111011";
							  SevenSegment <= "1001100"; 
						 elsif (OUT1="0101") then
							  Anodes <= "11111011";
							  SevenSegment <= "0100100"; 
						 elsif (OUT1="0110") then
							  Anodes <= "11111011";
							  SevenSegment <= "0100000"; 
						 elsif (OUT1="0111") then
							  Anodes <= "11111011";
							  SevenSegment <= "0001111"; 
						 elsif (OUT1="1000") then
							  Anodes <= "11111011";
							  SevenSegment <= "0000000"; 
						 elsif (OUT1="1001") then
							  Anodes <= "11111011";
							  SevenSegment <= "0000100"; 
						 end if;
					elsif (Counter mod M = 3*M/8) then
						 if (X_DEC='0') then
							  Anodes <= "11110111";
							  SevenSegment <= "1111111"; 
						 else
							  Anodes <= "11110111";
							  SevenSegment <= "1111110"; 
						 end if;
					end if;
			  end if;
		 end process;

end Behavioral;

