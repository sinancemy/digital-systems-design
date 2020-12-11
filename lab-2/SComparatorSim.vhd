--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:58:26 03/01/2019
-- Design Name:   
-- Module Name:   C:/Lab2/SComparatorSim.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SComparator
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
 
ENTITY SComparatorSim IS
END SComparatorSim;
 
ARCHITECTURE behavior OF SComparatorSim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SComparator
    PORT(
         C3 : IN  std_logic;
         C2 : IN  std_logic;
         C1 : IN  std_logic;
         C0 : IN  std_logic;
         D3 : IN  std_logic;
         D2 : IN  std_logic;
         D1 : IN  std_logic;
         D0 : IN  std_logic;
         GCD : OUT  std_logic;
         E : OUT  std_logic;
         GDC : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal C3 : std_logic := '0';
   signal C2 : std_logic := '0';
   signal C1 : std_logic := '0';
   signal C0 : std_logic := '0';
   signal D3 : std_logic := '0';
   signal D2 : std_logic := '0';
   signal D1 : std_logic := '0';
   signal D0 : std_logic := '0';

 	--Outputs
   signal GCD : std_logic;
   signal E : std_logic;
   signal GDC : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SComparator PORT MAP (
          C3 => C3,
          C2 => C2,
          C1 => C1,
          C0 => C0,
          D3 => D3,
          D2 => D2,
          D1 => D1,
          D0 => D0,
          GCD => GCD,
          E => E,
			 GDC => GDC
        );

   -- Stimulus process
   stim_proc: process
   begin		
			C3 <= '0'; C2 <= '0'; C1 <= '0'; C0 <= '0'; D3 <= '0'; D2 <= '0'; D1 <= '0'; D0 <= '0';
		wait for Clock_period;
			C3 <= '0'; C2 <= '1'; C1 <= '0'; C0 <= '0'; D3 <= '0'; D2 <= '0'; D1 <= '0'; D0 <= '0';
		wait for Clock_period;
			C3 <= '1'; C2 <= '1'; C1 <= '0'; C0 <= '0'; D3 <= '0'; D2 <= '0'; D1 <= '0'; D0 <= '0';
		wait for Clock_period;
			C3 <= '1'; C2 <= '1'; C1 <= '0'; C0 <= '0'; D3 <= '0'; D2 <= '1'; D1 <= '1'; D0 <= '1';
		wait for Clock_period;
			C3 <= '1'; C2 <= '1'; C1 <= '0'; C0 <= '0'; D3 <= '1'; D2 <= '1'; D1 <= '1'; D0 <= '1';
		wait for Clock_period ;
			C3 <= '0'; C2 <= '1'; C1 <= '0'; C0 <= '0'; D3 <= '1'; D2 <= '1'; D1 <= '1'; D0 <= '1';
		wait for Clock_period;
			C3 <= '0'; C2 <= '1'; C1 <= '0'; C0 <= '0'; D3 <= '0'; D2 <= '1'; D1 <= '1'; D0 <= '1';
		wait for Clock_period;
			C3 <= '1'; C2 <= '1'; C1 <= '0'; C0 <= '1'; D3 <= '1'; D2 <= '1'; D1 <= '0'; D0 <= '1';
		wait;

   end process;

END;
