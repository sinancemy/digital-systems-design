----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:35:32 03/11/2019 
-- Design Name: 
-- Module Name:    BLU - Behavioral 
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

entity BLU is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           LU : out  STD_LOGIC);
end BLU;

architecture Behavioral of BLU is

			SIGNAL LOGIC_AND : STD_LOGIC;
			SIGNAL LOGIC_OR : STD_LOGIC;
			SIGNAL LOGIC_XOR : STD_LOGIC;
			SIGNAL LOGIC_XNOR : STD_LOGIC;
			
begin
			LOGIC_AND <=  (NOT S(0)) AND (NOT S(1)) AND (A AND B);
			LOGIC_OR <=   S(0) AND (NOT S(1)) AND (A OR B);
			LOGIC_XOR <=  (NOT S(0)) AND S(1) AND (A XOR B);
			LOGIC_XNOR <= S(0) AND S(1) AND (A XNOR B);
			
			LU <= LOGIC_AND OR LOGIC_OR OR LOGIC_XOR OR LOGIC_XNOR;
			
end Behavioral;

