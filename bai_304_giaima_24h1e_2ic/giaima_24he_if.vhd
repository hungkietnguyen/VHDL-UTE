----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:58:57 02/07/2023 
-- Design Name: 
-- Module Name:    giaima_24he_if - Behavioral 
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

entity giaima_24he_if is
    Port ( i : in  STD_LOGIC_VECTOR (2 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0));
end giaima_24he_if;

architecture Behavioral of giaima_24he_if is

begin
      process(i)
           begin
	             if     i="100" then o<="0001";
	             elsif i="101" then o<="0010";
	             elsif i="110" then o<="0100";
	             elsif i="111" then o<="1000";
	             else 				           o<="0000";
	             end if;
           end process;


end Behavioral;

