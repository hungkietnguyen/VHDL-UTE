----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:30:56 02/13/2023 
-- Design Name: 
-- Module Name:    giaidahop_4kenh_1bit_case - Behavioral 
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

entity giaidahop_4kenh_1bit_case is
    Port ( sw : in  STD_LOGIC_VECTOR (2 downto 0);
           led : out  STD_LOGIC_VECTOR (3 downto 0));
end giaidahop_4kenh_1bit_case;
architecture Behavioral of giaidahop_4kenh_1bit_case is
begin
IC1:entity work.giaidahop_4kenh_1bit
      port map(i=>sw(0),
		                o=>led(3 downto 0),
							 s=>sw(2 downto 1));
end Behavioral;

