----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:56:15 02/13/2023 
-- Design Name: 
-- Module Name:    cong_2so_nhi_phan_4bit - Behavioral 
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

entity cong_2so_nhi_phan_4bit is
    Port ( sw : in  STD_LOGIC_VECTOR (7 downto 0);
           led : out  STD_LOGIC_VECTOR (4 downto 0));
end cong_2so_nhi_phan_4bit;
architecture Behavioral of cong_2so_nhi_phan_4bit is
begin
IC1: entity work.cong_2so_4bit
       port map(soa=>sw(3 downto 0),
		                 sob=>sw(7 downto 4),
							  ketqua=>led);
end Behavioral;

