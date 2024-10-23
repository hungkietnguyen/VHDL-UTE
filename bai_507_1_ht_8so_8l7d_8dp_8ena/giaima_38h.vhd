----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:13:15 04/04/2023 
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

entity giaima_38h is
    Port ( i : in  STD_LOGIC_VECTOR (2 downto 0);
           o : out  STD_LOGIC_VECTOR (7 downto 0));
end giaima_38h;
architecture Behavioral of giaima_38h is
begin
	process ( i )
	begin
		case i is
			when "000"		=> o <= "00000001";
			when "001"		=> o <= "00000010";
			when "010"		=> o <= "00000100";
			when "011"		=> o <= "00001000";
			when "100"		=> o <= "00010000";
			when "101"		=> o <= "00100000";
			when "110"		=> o <= "01000000";
			when others		=> o <= "10000000";
		end case;
	end process;

end Behavioral;

