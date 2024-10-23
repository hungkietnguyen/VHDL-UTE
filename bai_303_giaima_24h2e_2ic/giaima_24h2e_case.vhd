----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:47:53 02/07/2023 
-- Design Name: 
-- Module Name:    giaima_24h2e_case - Behavioral 
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

entity giaima_24h2e_case is
    Port ( i : in  STD_LOGIC_VECTOR (2 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0));
end giaima_24h2e_case;

architecture Behavioral of giaima_24h2e_case is

begin
process(i)
    begin
	     case i is
	         when "100" => o <= "0001";
	         when "101" => o <= "0010";
	         when "110" => o <= "0100";
	         when "111" => o <= "1000";
	         when others => o <= "0000";
	         end case;
     end process;

end Behavioral;

