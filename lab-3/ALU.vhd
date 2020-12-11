----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:19 03/11/2019 
-- Design Name: 
-- Module Name:    ALU4 - Behavioral 
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

entity ALU4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           M : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           SevenSegment : out  STD_LOGIC_VECTOR (6 downto 0);
           SIGN : out  STD_LOGIC;
			  Anodes : out STD_LOGIC_VECTOR (7 downto 0);
           LEDS : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU4;

architecture Behavioral of ALU4 is
			
			SIGNAL AU : STD_LOGIC_VECTOR (3 downto 0);
			SIGNAL LU : STD_LOGIC_VECTOR (3 downto 0);
			SIGNAL C_INTER : STD_LOGIC;
			SIGNAL F : STD_LOGIC_VECTOR(3 DOWNTO 0);
			
begin
			
			AU4 : entity work.BAU4(Behavioral) PORT MAP(
				A => A,
				B => B,
				Cin => Cin,
				S => S,
				Cout => C_INTER,
				AU => AU
			);
			LU4 : entity work.BLU4(Behavioral) PORT MAP(
				A => A,
				B => B,
				S => S,
				LU => LU
			);
			MUX : entity work.MUX2x1(Behavioral) PORT MAP(
				AU => AU,
				LU => LU,
				M => M,
				F => F
			);
			DEC : entity work.Decoder(Behavioral) PORT MAP(
				F => F,
				M => M,
				Cin => C_INTER,
				Cout => Cout,
				SevenSegment => SevenSegment,
				SIGN => SIGN,
				Anodes => Anodes,
				LEDS => LEDS
			);

end Behavioral;

