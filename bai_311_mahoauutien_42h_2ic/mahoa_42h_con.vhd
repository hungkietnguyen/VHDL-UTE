----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:25 02/08/2023 
-- Design Name: 
-- Module Name:    mahoa_42h_con - Behavioral 
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

entity mahoa_42h_con is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (1 downto 0);
           act : out  STD_LOGIC);
end mahoa_42h_con;
architecture Behavioral of mahoa_42h_con is
begin
    o<= "11" when i(3)='1' else
	         "10" when i(2)='1' else
				"01" when i(1)='1' else
				"00";
	 act <= i(3) or i(2) or i(1) or i(0);
end Behavioral;

