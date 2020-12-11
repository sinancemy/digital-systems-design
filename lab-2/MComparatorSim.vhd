--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:48:37 03/01/2019
-- Design Name:   
-- Module Name:   C:/Lab2/MComparatorSim.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MComparator
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
 
ENTITY MComparatorSim IS
END MComparatorSim;
 
ARCHITECTURE behavior OF MComparatorSim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MComparator
    PORT(
         A3 : IN  std_logic;
         A2 : IN  std_logic;
         A1 : IN  std_logic;
         A0 : IN  std_logic;
         B3 : IN  std_logic;
         B2 : IN  std_logic;
         B1 : IN  std_logic;
         B0 : IN  std_logic;
         GAB : OUT  std_logic;
         E : OUT  std_logic;
         GBA : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A3 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A0 : std_logic := '0';
   signal B3 : std_logic := '0';
   signal B2 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal B0 : std_logic := '0';

 	--Outputs
   signal GAB : std_logic;
   signal E : std_logic;
   signal GBA : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MComparator PORT MAP (
          A3 => A3,
          A2 => A2,
          A1 => A1,
          A0 => A0,
          B3 => B3,
          B2 => B2,
          B1 => B1,
          B0 => B0,
          GAB => GAB,
			 E => E,
          GBA => GBA
        );

   -- Stimulus process
   stim_proc: process
   begin		
			A3 <= '0'; A2 <= '0'; A1 <= '0'; A0 <= '0'; B3 <= '0'; B2 <= '0'; B1 <= '0'; B0 <= '0';
		wait for Clock_period;
			A3 <= '1'; A2 <= '0'; A1 <= '0'; A0 <= '0'; B3 <= '0'; B2 <= '0'; B1 <= '0'; B0 <= '0';
		wait for Clock_period;
			A3 <= '1'; A2 <= '0'; A1 <= '0'; A0 <= '0'; B3 <= '1'; B2 <= '0'; B1 <= '0'; B0 <= '0';
		wait for Clock_period ;
			A3 <= '1'; A2 <= '0'; A1 <= '1'; A0 <= '0'; B3 <= '1'; B2 <= '1'; B1 <= '0'; B0 <= '0';
		wait for Clock_period;
			A3 <= '1'; A2 <= '1'; A1 <= '1'; A0 <= '0'; B3 <= '1'; B2 <= '1'; B1 <= '0'; B0 <= '1';
		wait;

   end process;

END;
