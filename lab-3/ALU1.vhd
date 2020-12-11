----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:38:31 03/15/2019 
-- Design Name: 
-- Module Name:    ALU1 - Behavioral 
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

entity ALU1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           Cin : in  STD_LOGIC;
           M : in  STD_LOGIC;
           F : out  STD_LOGIC;
           Cout : out  STD_LOGIC
			  );
end ALU1;

architecture Behavioral of ALU1 is
			SIGNAL AU : STD_LOGIC;
			SIGNAL LU : STD_LOGIC;
begin
			AU : entity work.BAU(Behavioral) PORT MAP(
				A => A,
				B => B,
				S => S,
				Cin => Cin,
				AU => AU,
				Cout => Cout
			);
			LU : entity work.BLU(Behavioral) PORT MAP(
							A => A,
							B => B,
							S => S,
							LU => LU
			);
			F <= (AU AND M) OR (LU AND (NOT M));
end Behavioral;

