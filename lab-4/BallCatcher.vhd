----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:24:36 03/27/2019 
-- Design Name: 
-- Module Name:    BallCatcher - Behavioral 
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

entity BallCatcher is
    Port ( L_Button : in  STD_LOGIC;
           R_Button : in  STD_LOGIC;
           L_LED : in  STD_LOGIC;
           R_LED : in  STD_LOGIC;
			  CLK_DIV : in STD_LOGIC;
			  SCORE : out STD_LOGIC_VECTOR (3 downto 0) := "0000");
			  
end BallCatcher;

architecture Behavioral of BallCatcher is
			signal COUNTER : unsigned(3 downto 0) := "0000";
begin

		process (CLK_DIV, COUNTER, L_Button, L_LED, R_Button, R_LED) is
		begin
			if(rising_edge(CLK_DIV)) then
				if((L_Button = '1' AND L_LED = '1') OR (R_Button = '1' AND R_LED = '1')) then
					COUNTER <= COUNTER + 1;
					if(COUNTER = "1001") then
						COUNTER <= "0000";
					end if;
				end if;
			end if;
		end process;
		SCORE <= STD_LOGIC_VECTOR(COUNTER);
		
end Behavioral;

