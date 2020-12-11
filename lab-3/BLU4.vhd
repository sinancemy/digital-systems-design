----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:16 03/11/2019 
-- Design Name: 
-- Module Name:    BLU4 - Behavioral 
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

entity BLU4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           LU : out  STD_LOGIC_VECTOR (3 downto 0));
end BLU4;

architecture Behavioral of BLU4 is
			
begin
			B0 : entity work.BLU(Behavioral) PORT MAP(
							A => A(0),
							B => B(0),
							S => S,
							LU => LU(0)
			);
			B1 : entity work.BLU(Behavioral) PORT MAP(
							A => A(1),
							B => B(1),
							S => S,
							LU => LU(1)
			);
			B2 : entity work.BLU(Behavioral) PORT MAP(
							A => A(2),
							B => B(2),
							S => S,
							LU => LU(2)
			);
			B3 : entity work.BLU(Behavioral) PORT MAP(
							A => A(3),
							B => B(3),
							S => S,
							LU => LU(3)
			);
end Behavioral;

