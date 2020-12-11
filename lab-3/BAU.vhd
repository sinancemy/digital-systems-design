----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:33 03/11/2019 
-- Design Name: 
-- Module Name:    BAU - Behavioral 
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

entity BAU is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           Cin : in  STD_LOGIC;
           AU : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end BAU;

architecture Behavioral of BAU is
			
			SIGNAL MUX : STD_LOGIC_VECTOR (3 downto 0);
			SIGNAL MUX_A : STD_LOGIC_VECTOR (3 downto 0);
			SIGNAL MUX_B : STD_LOGIC_VECTOR (3 downto 0);
			
			SIGNAL INTER_A : STD_LOGIC;
			SIGNAL INTER_B : STD_LOGIC;
begin
			MUX(0) <= (NOT S(0)) AND (NOT S(1));
			MUX(1) <= S(0) AND (NOT S(1));
			MUX(2) <= (NOT S(0)) AND S(1);
			MUX(3) <= S(0) AND S(1);
			
			MUX_A(0) <= MUX(0) AND A;
			MUX_A(1) <= MUX(1) AND A;
			MUX_A(2) <= MUX(2) AND A;
			MUX_A(3) <= MUX(3) AND (NOT A);
			
			MUX_B(0) <= MUX(0) AND '0';
			MUX_B(1) <= MUX(1) AND B;
			MUX_B(2) <= MUX(2) AND (NOT B);
			MUX_B(3) <= MUX(3) AND B;
			
			INTER_A <= MUX_A(0) OR MUX_A(1) OR MUX_A(2) OR MUX_B(3);
			INTER_B <= MUX_B(0) OR MUX_B(1) OR MUX_B(2) OR MUX_A(3);
			
			M : entity work.FA(Behavioral) PORT MAP(
				A => INTER_A,
				B => INTER_B,
				Cin => Cin,
				S => AU,
				Cout => Cout
			);

end Behavioral;

