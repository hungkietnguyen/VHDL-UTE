----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:44:35 02/08/2023 
-- Design Name: 
-- Module Name:    mahoa_42he_case - Behavioral 
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

entity mahoa_42he_case is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (1 downto 0);
           e : in  STD_LOGIC;
           act : out  STD_LOGIC);
end mahoa_42he_case;
architecture Behavioral of mahoa_42he_case is
begin
   process(i,e)
	    begin
		   if e='0' then act<='0';
         else			
           case e&i is
	            when "11111"|"11110"|"11101"|"11100"|"11011"|"11010"|"11001"|"11000"=>o<="11";
			      when "10111"|"10110"|"10101"|"10100"=>o<="10";
			      when "10011"|"10010" =>o<="01";
			      when others =>o<="00";
		         end case;
			 end if;
	end process;
end Behavioral;

