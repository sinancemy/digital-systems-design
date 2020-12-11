----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:04:43 04/26/2019 
-- Design Name: 
-- Module Name:    Converter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Converter is
    Port ( INTER_RESULT : in  STD_LOGIC_VECTOR (7 downto 0);
           OUT1 : out  STD_LOGIC_VECTOR (3 downto 0);
           OUT2 : out  STD_LOGIC_VECTOR (3 downto 0);
           OUT3 : out  STD_LOGIC_VECTOR (3 downto 0));
end Converter;

architecture Behavioral of Converter is

	signal INTER_RESULTCD : STD_LOGIC_VECTOR(11 downto 0);

	function BCD_CONVERTER (bin : std_logic_vector(7 downto 0) ) return std_logic_vector is
		variable i : integer:=0;
		variable bcd : std_logic_vector(11 downto 0) := (others => '0');
		variable bint : std_logic_vector(7 downto 0) := bin;
		 
	begin
		for i in 0 to 7 loop
			bcd(11 downto 1) := bcd(10 downto 0);
			bcd(0) := bint(7);
			bint(7 downto 1) := bint(6 downto 0);
			bint(0) :='0';
			if(i < 7 and bcd(3 downto 0) > "0100") then
				bcd(3 downto 0) := bcd(3 downto 0) + "0011";
				end if;
			if(i < 7 and bcd(7 downto 4) > "0100") then
				bcd(7 downto 4) := bcd(7 downto 4) + "0011";
				end if;
			if(i < 7 and bcd(11 downto 8) > "0100") then
				bcd(11 downto 8) := bcd(11 downto 8) + "0011";
				end if;
			end loop;
		return bcd;
	end BCD_CONVERTER;
	
begin
		INTER_RESULTCD <= BCD_CONVERTER(INTER_RESULT);             
		OUT1 <= INTER_RESULTCD(11 downto 8);
		OUT2 <= INTER_RESULTCD(7 downto 4);
		OUT3 <= INTER_RESULTCD(3 downto 0);
end Behavioral;

