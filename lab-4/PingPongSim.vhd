--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:47:13 03/31/2019
-- Design Name:   
-- Module Name:   C:/Users/USER/Desktop/Sinan/Uni/4- Spring2019/ELEC204/Lab4/Lab4/PingPongSim.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PingPong
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
 
ENTITY PingPongSim IS
END PingPongSim;
 
ARCHITECTURE behavior OF PingPongSim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PingPong
    PORT(
         L_Button : IN  std_logic;
         R_Button : IN  std_logic;
         CLK_DIV : IN  std_logic;
         LEDS : OUT  std_logic_vector(9 downto 0);
         SevenSegment : OUT  std_logic_vector(6 downto 0);
         SegmentAnodes : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal L_Button : std_logic := '0';
   signal R_Button : std_logic := '0';
   signal CLK_DIV : std_logic := '0';

 	--Outputs
   signal LEDS : std_logic_vector(9 downto 0);
   signal SevenSegment : std_logic_vector(6 downto 0);
   signal SegmentAnodes : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_DIV_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PingPong PORT MAP (
          L_Button => L_Button,
          R_Button => R_Button,
          CLK_DIV => CLK_DIV,
          LEDS => LEDS,
          SevenSegment => SevenSegment,
          SegmentAnodes => SegmentAnodes
        );

   -- Clock process definitions
   CLK_DIV_process :process
   begin
		CLK_DIV_period <= '0';
		wait for CLK_DIV_period/2;
		CLK_DIV <= '1';
		wait for CLK_DIV_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
      begin		
			L_Button <= '0'; R_Button <= '0';
		wait for CLK_DIV_period*4;
			L_Button <= '1'; R_Button <= '0';
		wait for CLK_DIV_period*2;
			L_Button <= '0'; R_Button <= '1';
		wait for CLK_DIV_period*2;
			L_Button <= '0'; R_Button <= '0';
		wait for CLK_DIV_period*1;
			L_Button <= '0'; R_Button <= '1';
		wait for CLK_DIV_period*6;
			L_Button <= '1'; R_Button <= '1';
		wait for CLK_DIV_period*4;
			L_Button <= '1'; R_Button <= '0';
		wait for CLK_DIV_period*1;
			L_Button <= '0'; R_Button <= '0';
		wait for CLK_DIV_period*100;
		wait;

   end process;

END;
