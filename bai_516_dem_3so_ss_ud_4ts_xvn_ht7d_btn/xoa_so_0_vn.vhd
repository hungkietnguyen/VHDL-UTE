----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:06:59 04/11/2023 
-- Design Name: 
-- Module Name:    xoa_so_0_vn - Behavioral 
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

entity xoa_so_0_vn is
    Port ( tram : in  STD_LOGIC_VECTOR (3 downto 0);
           chuc : in  STD_LOGIC_VECTOR (3 downto 0);
           ena2b : out  STD_LOGIC_VECTOR (1 downto 0));
end xoa_so_0_vn;
architecture Behavioral of xoa_so_0_vn is
begin
     ena2b <= "00" when tram = x"0" and chuc = x"0" else
	           "01" when tram = x"0" else
				  "11";
end Behavioral;

