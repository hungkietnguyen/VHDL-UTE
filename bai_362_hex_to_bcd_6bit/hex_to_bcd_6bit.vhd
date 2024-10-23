----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:49:19 02/14/2023 
-- Design Name: 
-- Module Name:    hex_to_bcd_6bit - Behavioral 
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

entity hex_to_bcd_6bit is
    Port ( sw : in  STD_LOGIC_VECTOR (5 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end hex_to_bcd_6bit;
architecture Behavioral of hex_to_bcd_6bit is
begin
IC1:entity work.hextobcd_6bit
    port map(sohex6bit=>sw,
	          donvi=>led(3 downto 0),
				 chuc=>led(7 downto 4));
end Behavioral;
