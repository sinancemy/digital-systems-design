--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:29:50 04/26/2019
-- Design Name:   
-- Module Name:   C:/Users/USER/Desktop/Sinan/Uni/4- Spring2019/ELEC204/Lab5/Lab5/DACSim.vhd
-- Project Name:  Lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DAC
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
 
ENTITY DACSim IS
END DACSim;
 
ARCHITECTURE behavior OF DACSim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DAC
    PORT(
         MCLK : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         OPERATIONS : IN  std_logic_vector(5 downto 0);
         RESULT : OUT  std_logic_vector(7 downto 0);
         SevenSegment : OUT  std_logic_vector(6 downto 0);
         Anodes : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal MCLK : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal OPERATIONS : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RESULT : std_logic_vector(7 downto 0);
   signal SevenSegment : std_logic_vector(6 downto 0);
   signal Anodes : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant MCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DAC PORT MAP (
          MCLK => MCLK,
          A => A,
          OPERATIONS => OPERATIONS,
          RESULT => RESULT,
          SevenSegment => SevenSegment,
          Anodes => Anodes
        );

   -- Clock process definitions
   MCLK_process :process
   begin
		MCLK <= '0';
		wait for MCLK_period/2;
		MCLK <= '1';
		wait for MCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		A <= "00000000"; OPERATIONS <= "000000";
      wait for MCLK_period*3;
		A <= "00010101"; OPERATIONS <= "000010"; -- add 21 = 21
		wait for MCLK_period*3;
		A <= "00100000"; OPERATIONS <= "000001"; -- sub 32 = -11
		wait for MCLK_period*3;
		A <= "00000000"; OPERATIONS <= "000100"; -- neg = 11
		wait for MCLK_period*3;
		A <= "00011001"; OPERATIONS <= "001000"; -- xor 25 = 18
		wait for MCLK_period*3;
		A <= "00000110"; OPERATIONS <= "010000"; -- or 6 = 22
		wait for MCLK_period*3;
		A <= "00010000"; OPERATIONS <= "100000"; -- and 16 = 16
		wait for MCLK_period*3;
		A <= "01000000"; OPERATIONS <= "000010"; -- add 64 = 80
		wait for MCLK_period*3;
		A <= "01000000"; OPERATIONS <= "000010"; -- add 64 = -112
      wait;
   end process;

END;
