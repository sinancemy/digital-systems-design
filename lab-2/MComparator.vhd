----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:42 03/01/2019 
-- Design Name: 
-- Module Name:    MComparator - Behavioral 
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

entity MComparator is
    Port ( A3 : in  STD_LOGIC;
           B3 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           B2 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           A0 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           E : out  STD_LOGIC;
           GAB : out  STD_LOGIC;
           GBA : out  STD_LOGIC);
end MComparator;

architecture Behavioral of MComparator is
			signal AB3 : STD_LOGIC;
			signal AB2 : STD_LOGIC;
			signal AB1 : STD_LOGIC;
			signal AB0 : STD_LOGIC;
			
			signal COMP1 : STD_LOGIC;
			signal COMP2 : STD_LOGIC;
			signal COMP3 : STD_LOGIC;
			signal COMP4 : STD_LOGIC;
			signal COMP5 : STD_LOGIC;
			signal COMP6 : STD_LOGIC;

begin
			AB3 <= A3 XNOR B3;
			AB2 <= A2 XNOR B2;
			AB1 <= A1 XNOR B1;
			AB0 <= A0 XNOR B0;
			
			COMP1 <= ((NOT A2) AND B2) AND AB3;
			COMP2 <= ((NOT B2) AND A2) AND AB3;
			COMP3 <= ((NOT A1) AND B1) AND AB2 AND AB3;
			COMP4 <= ((NOT B1) AND A1) AND AB2 AND AB3;
			COMP5 <= ((NOT A0) AND B0) AND AB1 AND AB2 AND AB3;
			COMP6 <= ((NOT B0) AND A0) AND AB1 AND AB2 AND AB3;
			
			E <= AB3 AND AB2 AND AB1 AND AB0;
			
			GBA <= ((NOT A3) AND B3) OR COMP1 OR COMP3 OR COMP5;
			GAB <= ((NOT B3) AND A3) OR COMP2 OR COMP4 OR COMP6;

end Behavioral;

