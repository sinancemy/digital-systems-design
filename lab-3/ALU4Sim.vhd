--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:40:09 03/17/2019
-- Design Name:   
-- Module Name:   C:/Users/USER/Desktop/Sinan/Uni/4- Spring2019/ELEC204/Lab3/Lab3/ALU4Sim.vhd
-- Project Name:  Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU4
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU4Sim IS
END ALU4Sim;
 
ARCHITECTURE behavior OF ALU4Sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU4
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         S : IN  std_logic_vector(1 downto 0);
         M : IN  std_logic;
         Cout : OUT  std_logic;
         SevenSegment : OUT  std_logic_vector(6 downto 0);
         SIGN : OUT  std_logic;
         Anodes : OUT  std_logic_vector(7 downto 0);
         LEDS : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal S : std_logic_vector(1 downto 0) := (others => '0');
   signal M : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal SevenSegment : std_logic_vector(6 downto 0);
   signal SIGN : std_logic;
   signal Anodes : std_logic_vector(7 downto 0);
   signal LEDS : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU4 PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          M => M,
          Cout => Cout,
          SevenSegment => SevenSegment,
          SIGN => SIGN,
          Anodes => Anodes,
          LEDS => LEDS
        );

   -- Stimulus process
   stim_proc: process
   begin		
			A <= "0101"; B <= "1101"; Cin <= '0'; S <= "00"; M <= '0';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '0'; S <= "01"; M <= '0';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '0'; S <= "10"; M <= '0';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '0'; S <= "11"; M <= '0';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '0'; S <= "00"; M <= '1';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '1'; S <= "00"; M <= '1';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '0'; S <= "01"; M <= '1';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '1'; S <= "01"; M <= '1';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '0'; S <= "10"; M <= '1';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '1'; S <= "10"; M <= '1';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '0'; S <= "11"; M <= '1';
		wait for Clock_period;
			A <= "0101"; B <= "1101"; Cin <= '1'; S <= "11"; M <= '1';
		wait for Clock_period;
			A <= "0000"; B <= "0000"; Cin <= '0'; S <= "00"; M <= '0';
		wait;

   end process;
END;
