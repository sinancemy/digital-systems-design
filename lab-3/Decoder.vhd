----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:42 03/10/2019 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is				
    Port ( F : in  STD_LOGIC_VECTOR (3 downto 0);
           M : in  STD_LOGIC;
			  Cin : in STD_LOGIC;
			  Cout : out STD_LOGIC;
           SevenSegment : out  STD_LOGIC_VECTOR (6 downto 0);
			  Anodes : out STD_LOGIC_VECTOR (7 downto 0);
           SIGN : out  STD_LOGIC;
           LEDS : out  STD_LOGIC_VECTOR (3 downto 0));
end Decoder;

architecture Behavioral of Decoder is
			SIGNAL Cout_L : STD_LOGIC;
			SIGNAL SevenSegment_L : STD_LOGIC_VECTOR (6 downto 0);
			SIGNAL Anodes_L : STD_LOGIC_VECTOR (7 downto 0);
			SIGNAL SIGN_L : STD_LOGIC;
			SIGNAL LEDS_L : STD_LOGIC_VECTOR (3 downto 0);
			
			SIGNAL Cout_A : STD_LOGIC;
			SIGNAL SevenSegment_A : STD_LOGIC_VECTOR (6 downto 0);
			SIGNAL Anodes_A : STD_LOGIC_VECTOR (7 downto 0);
			SIGNAL SIGN_A : STD_LOGIC;
			SIGNAL LEDS_A : STD_LOGIC_VECTOR (3 downto 0);
begin
			Cout_L <= '0'; -- off
			SIGN_L <= '0'; -- off
			SevenSegment_L <= "1111111"; -- off
			Anodes_L <= "11111111"; -- off
			LEDS_L <= F; -- display logic answer on leds
			
			Cout_A <= Cin; -- on
			SIGN_A <= F(3); -- sign of F
			SevenSegment_A(0) <= ((NOT F(3)) AND (NOT F(2)) AND (NOT F(1))) OR 
			((NOT F(2)) AND (NOT F(1)) AND F(0)) OR (F(2) AND F(1) AND F(0));
			SevenSegment_A(1) <= ((NOT F(3)) AND (NOT F(2)) AND F(1)) OR ((NOT F(3)) AND (NOT F(2)) AND
			F(0)) OR ((NOT F(3)) AND F(1) AND F(0)) OR (F(3) AND F(2) AND F(1)) OR (F(3) AND (NOT F(1)) AND F(0));
			SevenSegment_A(2) <= (F(2) AND (NOT F(1))) OR F(0);
			SevenSegment_A(3) <= ((NOT F(2)) AND (NOT F(1)) AND F(0)) OR 
			(F(2) AND (NOT F(1)) AND (NOT F(0))) OR (F(2) AND F(1) AND F(0));
			SevenSegment_A(4) <= ((NOT F(3)) AND (NOT F(2)) AND F(1) AND 
			(NOT F(0))) OR (F(3) AND F(2) AND F(1) AND (NOT F(0)));
			SevenSegment_A(5) <= ((NOT F(3)) AND F(2) AND (NOT F(1)) AND F(0)) OR 
			((NOT F(3)) AND F(2) AND F(1) AND (NOT F(0))) OR (F(3) AND (NOT F(2)) AND F(1));
			SevenSegment_A(6) <= ((NOT F(3)) AND (NOT F(2)) AND (NOT F(1)) AND F(0)) OR 
			(F(3) AND F(2) AND F(1) AND F(0)) OR (F(2) AND (NOT F(1)) AND (NOT F(0)));
			Anodes_A <= "11111110"; -- first anode is on
			LEDS_A <= "0000"; -- off
			
			-- MUX
			
			Cout <= (Cout_A AND M) OR (Cout_L AND (NOT M));
			
			SIGN <= (SIGN_A AND M) OR (SIGN_L AND (NOT M));
			
			SevenSegment(0) <= (SevenSegment_A(0) AND M) OR (SevenSegment_L(0) AND (NOT M));
			SevenSegment(1) <= (SevenSegment_A(1) AND M) OR (SevenSegment_L(1) AND (NOT M));
			SevenSegment(2) <= (SevenSegment_A(2) AND M) OR (SevenSegment_L(2) AND (NOT M));
			SevenSegment(3) <= (SevenSegment_A(3) AND M) OR (SevenSegment_L(3) AND (NOT M));
			SevenSegment(4) <= (SevenSegment_A(4) AND M) OR (SevenSegment_L(4) AND (NOT M));
			SevenSegment(5) <= (SevenSegment_A(5) AND M) OR (SevenSegment_L(5) AND (NOT M));
			SevenSegment(6) <= (SevenSegment_A(6) AND M) OR (SevenSegment_L(6) AND (NOT M));
			
			Anodes(0) <= (Anodes_A(0) AND M) OR (Anodes_L(0) AND (NOT M)); 
			Anodes(1) <= (Anodes_A(1) AND M) OR (Anodes_L(1) AND (NOT M)); 
			Anodes(2) <= (Anodes_A(2) AND M) OR (Anodes_L(2) AND (NOT M)); 
			Anodes(3) <= (Anodes_A(3) AND M) OR (Anodes_L(3) AND (NOT M)); 
			Anodes(4) <= (Anodes_A(4) AND M) OR (Anodes_L(4) AND (NOT M)); 
			Anodes(5) <= (Anodes_A(5) AND M) OR (Anodes_L(5) AND (NOT M)); 
			Anodes(6) <= (Anodes_A(6) AND M) OR (Anodes_L(6) AND (NOT M)); 
			Anodes(7) <= (Anodes_A(7) AND M) OR (Anodes_L(7) AND (NOT M)); 
			
			LEDS(0) <= (LEDS_A(0) AND M) OR (LEDS_L(0) AND (NOT M));
			LEDS(1) <= (LEDS_A(1) AND M) OR (LEDS_L(1) AND (NOT M));
			LEDS(2) <= (LEDS_A(2) AND M) OR (LEDS_L(2) AND (NOT M));
			LEDS(3) <= (LEDS_A(3) AND M) OR (LEDS_L(3) AND (NOT M));
			
end Behavioral;

