----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:12:59 02/14/2023 
-- Design Name: 
-- Module Name:    hex_to_bcd_10bit - Behavioral 
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

entity hex_to_bcd_10bit is
    Port ( sw : in  STD_LOGIC_VECTOR (9 downto 0);
           led : out  STD_LOGIC_VECTOR (15 downto 0));
end hex_to_bcd_10bit;
architecture Behavioral of hex_to_bcd_10bit is
begin

IC1:entity work.hextobcd_10bit
    port map(sohex10bit=>sw,
	          donvi=>led(3 downto 0),
				 chuc=>led(7 downto 4),
				 tram=>led(11 downto 8),
				 nghin=>led(15 downto 12));
end Behavioral;

