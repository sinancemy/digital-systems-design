----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:54 03/11/2019 
-- Design Name: 
-- Module Name:    BAU4 - Behavioral 
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

entity BAU4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           Cin : in  STD_LOGIC;
           AU : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end BAU4;

architecture Behavioral of BAU4 is
			
			SIGNAL C1 : STD_LOGIC;
			SIGNAL C2 : STD_LOGIC;
			SIGNAL C3 : STD_LOGIC;
			
begin
			B0 : entity work.BAU(Behavioral) PORT MAP(
				A => A(0),
				B => B(0),
				S => S,
				Cin => Cin,
				AU => AU(0),
				Cout => C1
			);			
			B1 : entity work.BAU(Behavioral) PORT MAP(
				A => A(1),
				B => B(1),
				S => S,
				Cin => C1,
				AU => AU(1),
				Cout => C2
			);			
			B2 : entity work.BAU(Behavioral) PORT MAP(
				A => A(2),
				B => B(2),
				S => S,
				Cin => C2,
				AU => AU(2),
				Cout => C3
			);			
			B3 : entity work.BAU(Behavioral) PORT MAP(
				A => A(3),
				B => B(3),
				S => S,
				Cin => C3,
				AU => AU(3),
				Cout => Cout
			);
end Behavioral;

