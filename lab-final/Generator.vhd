----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:24:34 05/13/2019 
-- Design Name: 
-- Module Name:    Generator - Behavioral 
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

entity Generator is

	 Generic (N : INTEGER:=1023
              );
    
	 Port ( CLK : in  STD_LOGIC;
           GEN : in  STD_LOGIC;
           UPPER : in  STD_LOGIC_VECTOR (9 downto 0);
           NUM : out  STD_LOGIC_VECTOR (9 downto 0));
end Generator;

architecture Behavioral of Generator is

		signal GEN_DELAY : std_logic := '0'; 
		signal GEN_RISING_EDGE : std_logic;

begin
		process(CLK)
			variable RND_COUNTER : INTEGER range 0 to N;
			begin
				if rising_edge(CLK) then
					-- For finding rising edge of button
					GEN_DELAY <= GEN;
					GEN_RISING_EDGE <= not GEN_DELAY and GEN; 
				
					-- Looping through 0 and the upper bound
					RND_COUNTER := RND_COUNTER + 1;
					if(RND_COUNTER = to_integer(unsigned(UPPER)) + 1) then
						RND_COUNTER := 0;
					end if;
					
					-- RND_COUNTER is assigned to NUM on the rising edge of the button
					if(GEN_RISING_EDGE = '1') then 
						NUM <= std_logic_vector(to_unsigned(RND_COUNTER, 10));
					end if;	
				end if;
		end process;

end Behavioral;

