----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:01:43 04/07/2023 
-- Design Name: 
-- Module Name:    dahop_8c - Behavioral 
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

entity dahop_8c is
    Port ( i8 : in  STD_LOGIC_VECTOR (7 downto 0);
           o : out  STD_LOGIC_VECTOR (0 downto 0);
           s : in  STD_LOGIC_VECTOR (2 downto 0));
end dahop_8c;

architecture Behavioral of dahop_8c is
begin
	process(s, i8)
	begin 
		case s is
			when "000"		=> o <= i8(0);
			when "001"		=> o <= i8(1);
			when "010"		=> o <= i8(2);
			when "011"		=> o <= i8(3);
			when "100"		=> o <= i8(4);
			when "101"		=> o <= i8(5);
			when "110"		=> o <= i8(6);
			when others		=> o <= i8(7);
		end case;
	end process;

end Behavioral;

