----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:22:54 03/11/2019 
-- Design Name: 
-- Module Name:    MUX2x1 - Behavioral 
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

entity MUX2x1 is
    Port ( AU : in  STD_LOGIC_VECTOR (3 downto 0);
           LU : in  STD_LOGIC_VECTOR (3 downto 0);
           M : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (3 downto 0));
end MUX2x1;

architecture Behavioral of MUX2x1 is

begin

			F(0) <= (AU(0) AND M) OR (LU(0) AND (NOT M));
			F(1) <= (AU(1) AND M) OR (LU(1) AND (NOT M));
			F(2) <= (AU(2) AND M) OR (LU(2) AND (NOT M));
			F(3) <= (AU(3) AND M) OR (LU(3) AND (NOT M));
			
end Behavioral;

