----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:29:16 03/27/2023 
-- Design Name: 
-- Module Name:    giaima_12h - Behavioral 
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

entity giaima_12h is
    Port ( i : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (1 downto 0));
end giaima_12h;
architecture Behavioral of giaima_12h is
begin
    O <= "01" when i='0' else
	      "10";
end Behavioral;

