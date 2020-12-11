----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:49:07 04/26/2019 
-- Design Name: 
-- Module Name:    Computer - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Computer is
	Port (CLK_DIV : in STD_LOGIC;
			A : in STD_LOGIC_VECTOR(7 downto 0);
			OPERATIONS : in STD_LOGIC_VECTOR(5 downto 0); -- from MSB to LSB: SUB ADD NOT XOR OR AND
			RESULT : out STD_LOGIC_VECTOR(7 downto 0);
			X_DEC : out STD_LOGIC;
			INTER_RESULT: out STD_LOGIC_VECTOR (7 downto 0));
end Computer;

architecture Behavioral of Computer is

	constant START: STD_LOGIC_VECTOR(2 downto 0) := "001";
	constant COMPUTE: STD_LOGIC_VECTOR(2 downto 0) := "010";
	constant FIN: STD_LOGIC_VECTOR(2 downto 0) := "100";

	signal State: STD_LOGIC_VECTOR(2 downto 0) := "001";

	
	signal INTER_X: STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	
begin
	
	process(CLK_DIV)
	begin
		  if rising_edge(CLK_DIV) then
				case State is
					 when START =>
						  if (OPERATIONS(0)='1' and OPERATIONS(1)='0' and OPERATIONS(2)='0' and OPERATIONS(3)='0' and OPERATIONS(4)='0' and OPERATIONS(5)='0') then
								State <= COMPUTE;
						  elsif (OPERATIONS(0)='0' and OPERATIONS(1)='1' and OPERATIONS(2)='0' and OPERATIONS(3)='0' and OPERATIONS(4)='0' and OPERATIONS(5)='0') then
								State <= COMPUTE;
						  elsif (OPERATIONS(0)='0' and OPERATIONS(1)='0' and OPERATIONS(2)='1' and OPERATIONS(3)='0' and OPERATIONS(4)='0' and OPERATIONS(5)='0') then
								State <= COMPUTE;
						  elsif (OPERATIONS(0)='0' and OPERATIONS(1)='0' and OPERATIONS(2)='0' and OPERATIONS(3)='1' and OPERATIONS(4)='0' and OPERATIONS(5)='0') then
								State <= COMPUTE;
						  elsif (OPERATIONS(0)='0' and OPERATIONS(1)='0' and OPERATIONS(2)='0' and OPERATIONS(3)='0' and OPERATIONS(4)='1' and OPERATIONS(5)='0') then
								State <= COMPUTE;
						  elsif (OPERATIONS(0)='0' and OPERATIONS(1)='0' and OPERATIONS(2)='0' and OPERATIONS(3)='0' and OPERATIONS(4)='0' and OPERATIONS(5)='1') then
								State <= COMPUTE;
						  else
								State <= START;
						  end if;
					 when COMPUTE =>
						  if ( OPERATIONS(0)='1' and OPERATIONS(1)='0' and OPERATIONS(2)='0' and OPERATIONS(3)='0' and OPERATIONS(4)='0' and OPERATIONS(5)='0') then
								INTER_X <= std_logic_vector(unsigned(INTER_X) + ((not unsigned(A)) + 1));
								State <= FIN;
						  elsif (OPERATIONS(0)='0' and OPERATIONS(1)='1' and OPERATIONS(2)='0' and OPERATIONS(3)='0' and OPERATIONS(4)='0' and OPERATIONS(5)='0') then
								INTER_X <= std_logic_vector(unsigned(INTER_X) + unsigned(A));
								State <= FIN;
						  elsif (OPERATIONS(0)='0' and OPERATIONS(1)='0' and OPERATIONS(2)='1' and OPERATIONS(3)='0' and OPERATIONS(4)='0' and OPERATIONS(5)='0') then
								INTER_X <= std_logic_vector(unsigned(not INTER_X) + 1);
								State <= FIN;
						  elsif (OPERATIONS(0)='0' and OPERATIONS(1)='0' and OPERATIONS(2)='0' and OPERATIONS(3)='1' and OPERATIONS(4)='0' and OPERATIONS(5)='0') then
								INTER_X <= INTER_X xor A;
								State <= FIN;
						  elsif (OPERATIONS(0)='0' and OPERATIONS(1)='0' and OPERATIONS(2)='0' and OPERATIONS(3)='0' and OPERATIONS(4)='1' and OPERATIONS(5)='0') then
								INTER_X <= INTER_X or A;
								State <= FIN;
						  elsif (OPERATIONS(0)='0' and OPERATIONS(1)='0' and OPERATIONS(2)='0' and OPERATIONS(3)='0' and OPERATIONS(4)='0' and OPERATIONS(5)='1') then
								INTER_X <= INTER_X and A;
								State <= FIN;
						  end if;
					 when FIN =>
						  if(INTER_X(7) = '1') then
								INTER_RESULT <= std_logic_vector(unsigned(not INTER_X) + 1);
						  else
								INTER_RESULT <= INTER_X;
						  end if;
						  RESULT <= INTER_X;
						  X_DEC <= INTER_X(7);
						  State <= START;
					 when others =>
						  State <= START;
				end case;
			 end if; 
	 end process;

end Behavioral;

