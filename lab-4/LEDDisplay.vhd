----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:20:09 03/27/2019 
-- Design Name: 
-- Module Name:    LEDDisplay - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LEDDisplay is
    Port ( CLK_DIV : in  STD_LOGIC;
           LEDS : out  STD_LOGIC_VECTOR (9 downto 0);
			  L_LED : out STD_LOGIC := '1';
			  R_LED : out STD_LOGIC := '1');
end LEDDisplay;

architecture Behavioral of LEDDisplay is
		signal STATE : integer := 1;	
begin
		process (CLK_DIV, STATE)
		begin
			if(rising_edge(CLK_DIV)) then
			
				STATE <= STATE + 1;
				if(STATE = 1) then
					LEDS <= "1000000000";
					L_LED <= '1';
					R_LED <= '0';
				elsif(STATE = 2) then
					LEDS <= "0100000000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 3) then
					LEDS <= "0010000000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 4) then
					LEDS <= "0001000000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 5) then
					LEDS <= "0000100000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 6) then
					LEDS <= "0000010000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 7) then
					LEDS <= "0000001000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 8) then
					LEDS <= "0000000100";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 9) then
					LEDS <= "0000000010";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 10) then
					LEDS <= "0000000001";
					L_LED <= '0';
					R_LED <= '1';
				elsif(STATE = 11) then
					LEDS <= "0000000010";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 12) then
					LEDS <= "0000000100";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 13) then
					LEDS <= "0000001000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 14) then
					LEDS <= "0000010000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 15) then
					LEDS <= "0000100000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 16) then
					LEDS <= "0001000000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 17) then
					LEDS <= "0010000000";
					L_LED <= '0';
					R_LED <= '0';
				elsif(STATE = 18) then
					LEDS <= "0100000000";
					L_LED <= '0';
					R_LED <= '0';
					STATE <= 1;
				else
					LEDS <= "0000000000";
					L_LED <= '0';
					R_LED <= '0';
					STATE <= 1;
				end if;
			end if;
		end process;

end Behavioral;

