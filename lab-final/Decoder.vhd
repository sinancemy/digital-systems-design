----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:25:20 05/13/2019 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Decoder is
	 Generic (N : INTEGER:=50*10**6;
             M: INTEGER:=65536);
			
    Port ( CLK : in STD_LOGIC;
			  NUM : in  STD_LOGIC_VECTOR (9 downto 0);
           SevenSegment : out  STD_LOGIC_VECTOR (6 downto 0);
           Anodes : out  STD_LOGIC_VECTOR (7 downto 0));
end Decoder;

architecture Behavioral of Decoder is
	-- 10-bit Unsigned Binary to 16-bit Binary Coded Decimal converter function
	signal NUM_BCD: STD_LOGIC_VECTOR(15 downto 0);
	function BCD_CONVERTER (bin : std_logic_vector(9 downto 0) ) return std_logic_vector is
		variable i : integer:=0;
		variable bcd : std_logic_vector(15 downto 0) := (others => '0');
		variable bint : std_logic_vector(9 downto 0) := bin; 
	begin
		for i in 0 to 9 loop
			bcd(15 downto 1) := bcd(14 downto 0);
			bcd(0) := bint(9);
			bint(9 downto 1) := bint(8 downto 0);
			bint(0) :='0';
			if(i < 9 and bcd(3 downto 0) > "0100") then
				bcd(3 downto 0) := bcd(3 downto 0) + "0011";
				end if;
			if(i < 9 and bcd(7 downto 4) > "0100") then
				bcd(7 downto 4) := bcd(7 downto 4) + "0011";
				end if;
			if(i < 9 and bcd(11 downto 8) > "0100") then
				bcd(11 downto 8) := bcd(11 downto 8) + "0011";
				end if;
			if(i < 9 and bcd(15 downto 12) > "0100") then
				bcd(15 downto 12) := bcd(15 downto 12) + "0011";
				end if;
			end loop;
		return bcd;
	end BCD_CONVERTER;

begin
		-- NUM is converted to BCD form in order to be displayed on the seven segment display
		NUM_BCD <= BCD_CONVERTER(NUM);
		
		process(CLK)
		-- Seven Segment Decoder
		 variable Counter : INTEGER range 0 to M;
		 begin       
			  if(rising_edge(CLK)) then
					Counter :=Counter+1;
					if (Counter mod M = 0) then
						 if(NUM_BCD(3 downto 0)="0000") then
							  Anodes <= "11111110";
							  SevenSegment <= "0000001";
						 elsif (NUM_BCD(3 downto 0)="0001") then
							  Anodes <= "11111110";
							  SevenSegment <= "1001111"; 
						 elsif (NUM_BCD(3 downto 0)="0010") then
							  Anodes <= "11111110";
							  SevenSegment <= "0010010"; 
						 elsif (NUM_BCD(3 downto 0)="0011") then
							  Anodes <= "11111110";
							  SevenSegment <= "0000110"; 
						 elsif (NUM_BCD(3 downto 0)="0100") then
							  Anodes <= "11111110";
							  SevenSegment <= "1001100"; 
						 elsif (NUM_BCD(3 downto 0)="0101") then
							  Anodes <= "11111110";
							  SevenSegment <= "0100100"; 
						 elsif (NUM_BCD(3 downto 0)="0110") then
							  Anodes <= "11111110";
							  SevenSegment <= "0100000"; 
						 elsif (NUM_BCD(3 downto 0)="0111") then
							  Anodes <= "11111110";
							  SevenSegment <= "0001111"; 
						 elsif (NUM_BCD(3 downto 0)="1000") then
							  Anodes <= "11111110";
							  SevenSegment <= "0000000";
						 elsif (NUM_BCD(3 downto 0)="1001") then
							  Anodes <= "11111110";
							  SevenSegment <= "0000100";
						 end if;
					elsif (Counter mod M = 1*M/8) then
						 if(NUM_BCD(7 downto 4)="0000") then
							  Anodes <= "11111101";
							  SevenSegment <= "0000001"; 
						 elsif (NUM_BCD(7 downto 4)="0001") then
							  Anodes <= "11111101";
							  SevenSegment <= "1001111"; 
						 elsif (NUM_BCD(7 downto 4)="0010") then
							  Anodes <= "11111101";
							  SevenSegment <= "0010010"; 
						 elsif (NUM_BCD(7 downto 4)="0011") then
							  Anodes <= "11111101";
							  SevenSegment <= "0000110"; 
						 elsif (NUM_BCD(7 downto 4)="0100") then
							  Anodes <= "11111101";
							  SevenSegment <= "1001100"; 
						 elsif (NUM_BCD(7 downto 4)="0101") then
							  Anodes <= "11111101";
							  SevenSegment <= "0100100"; 
						 elsif (NUM_BCD(7 downto 4)="0110") then
							  Anodes <= "11111101";
							  SevenSegment <= "0100000"; 
						 elsif (NUM_BCD(7 downto 4)="0111") then
							  Anodes <= "11111101";
							  SevenSegment <= "0001111"; 
						 elsif (NUM_BCD(7 downto 4)="1000") then
							  Anodes <= "11111101";
							  SevenSegment <= "0000000"; 
						 elsif (NUM_BCD(7 downto 4)="1001") then
							  Anodes <= "11111101";
							  SevenSegment <= "0000100"; 
						 end if;
					elsif (Counter mod M = 2*M/8) then
						 if(NUM_BCD(11 downto 8)="0000") then
							  Anodes <= "11111011";
							  SevenSegment <= "0000001"; 
						 elsif (NUM_BCD(11 downto 8)="0001") then
							  Anodes <= "11111011";
							  SevenSegment <= "1001111"; 
						 elsif (NUM_BCD(11 downto 8)="0010") then
							  Anodes <= "11111011";
							  SevenSegment <= "0010010"; 
						 elsif (NUM_BCD(11 downto 8)="0011") then
							  Anodes <= "11111011";
							  SevenSegment <= "0000110"; 
						 elsif (NUM_BCD(11 downto 8)="0100") then
							  Anodes <= "11111011";
							  SevenSegment <= "1001100"; 
						 elsif (NUM_BCD(11 downto 8)="0101") then
							  Anodes <= "11111011";
							  SevenSegment <= "0100100"; 
						 elsif (NUM_BCD(11 downto 8)="0110") then
							  Anodes <= "11111011";
							  SevenSegment <= "0100000"; 
						 elsif (NUM_BCD(11 downto 8)="0111") then
							  Anodes <= "11111011";
							  SevenSegment <= "0001111"; 
						 elsif (NUM_BCD(11 downto 8)="1000") then
							  Anodes <= "11111011";
							  SevenSegment <= "0000000"; 
						 elsif (NUM_BCD(11 downto 8)="1001") then
							  Anodes <= "11111011";
							  SevenSegment <= "0000100"; 
						 end if;
					elsif (Counter mod M = 3*M/8) then
						 if(NUM_BCD(15 downto 12)="0000") then
							  Anodes <= "11110111";
							  SevenSegment <= "0000001"; 
						 elsif (NUM_BCD(15 downto 12)="0001") then
							  Anodes <= "11110111";
							  SevenSegment <= "1001111"; 
						 elsif (NUM_BCD(15 downto 12)="0010") then
							  Anodes <= "11110111";
							  SevenSegment <= "0010010"; 
						 elsif (NUM_BCD(15 downto 12)="0011") then
							  Anodes <= "11110111";
							  SevenSegment <= "0000110"; 
						 elsif (NUM_BCD(15 downto 12)="0100") then
							  Anodes <= "11110111";
							  SevenSegment <= "1001100"; 
						 elsif (NUM_BCD(15 downto 12)="0101") then
							  Anodes <= "11110111";
							  SevenSegment <= "0100100"; 
						 elsif (NUM_BCD(15 downto 12)="0110") then
							  Anodes <= "11110111";
							  SevenSegment <= "0100000"; 
						 elsif (NUM_BCD(15 downto 12)="0111") then
							  Anodes <= "11110111";
							  SevenSegment <= "0001111"; 
						 elsif (NUM_BCD(15 downto 12)="1000") then
							  Anodes <= "11110111";
							  SevenSegment <= "0000000"; 
						 elsif (NUM_BCD(15 downto 12)="1001") then
							  Anodes <= "11110111";
							  SevenSegment <= "0000100"; 
						 end if;
					elsif (Counter mod M = 4*M/8) then
						Anodes <= "11111111";
						SevenSegment <= "1111111"; 
					end if;
			  end if;
		 end process;

end Behavioral;

