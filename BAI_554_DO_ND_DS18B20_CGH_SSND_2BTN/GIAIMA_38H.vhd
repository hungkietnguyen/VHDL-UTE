----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:02 05/04/2022 
-- Design Name: 
-- Module Name:    giaima_38h - Behavioral 
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

entity GIAIMA_38H is
 port ( I : in std_logic_vector(2 downto 0);
		  O : out std_logic_vector( 7 downto 0));

end GIAIMA_38H;

architecture Behavioral of GIAIMA_38H is

begin
process(I)
begin
 case I is
			 when "000" => O <= "00000001";
			 when "001" => O<= "00000010";
			 when "010" => O <= "00000100";	
			 when "011" => O <= "00001000";
			 when "100" => O <= "00010000";
			 when "101" => O <= "00100000";
			 when "110" => O <= "01000000";
			 when others => O <= "10000000";
end case;
end process;

end Behavioral;

