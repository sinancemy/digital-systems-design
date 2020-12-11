----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:15:54 03/01/2019 
-- Design Name: 
-- Module Name:    SComparator - Behavioral 
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

entity SComparator is
    Port ( C3 : in  STD_LOGIC;
           D3 : in  STD_LOGIC;
           C2 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           C1 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           C0 : in  STD_LOGIC;
           D0 : in  STD_LOGIC;
           E : out  STD_LOGIC;
           GCD : out  STD_LOGIC;
           GDC : out  STD_LOGIC);
end SComparator;

architecture Behavioral of SComparator is

			signal COMP1 : STD_LOGIC;
			signal COMP2 : STD_LOGIC;
			signal COMP3 : STD_LOGIC;
			signal GCDx : STD_LOGIC;
			
			signal M_E : STD_LOGIC;
			signal M_CD : STD_LOGIC;
			signal M_DC : STD_LOGIC;
begin
			M : entity work.MComparator(Behavioral) PORT MAP(
				A0 => C0,
				A1 => C1,
				A2 => C2,
				A3 => C3,
				B0 => D0,
				B1 => D1,
				B2 => D2,
				B3 => D3,
				E => M_E,
				GAB => M_CD,
				GBA => M_DC
			);
			
			COMP1 <= (NOT C3) AND (NOT D3) AND M_CD;
			COMP2 <= (NOT C3) AND D3;
			COMP3 <= C3 AND D3 AND M_CD;
			GCDx <= COMP1 OR COMP2 OR COMP3;
			
			E <= M_E;
			GCD <= GCDx;
			GDC <= (NOT GCDx) AND (NOT M_E);

end Behavioral;

