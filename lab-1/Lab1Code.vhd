----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:19 02/22/2019 
-- Design Name: 
-- Module Name:    Lab1Code - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL ;
use IEEE.STD_LOGIC_UNSIGNED. ALL ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab1Code is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end Lab1Code;

architecture Behavioral of Lab1Code is
		signal NX : STD_LOGIC;
		signal NY : STD_LOGIC;
		signal XNY : STD_LOGIC;
		signal YNX : STD_LOGIC;

begin
		NX <= not X;
		NY <= not Y;
		
		XNY <= X or NY;
		YNX <= Y or NX;
		
		Z <= XNY and YNX;

end Behavioral;

