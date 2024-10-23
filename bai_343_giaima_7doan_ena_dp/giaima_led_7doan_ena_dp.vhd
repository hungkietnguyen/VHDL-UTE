----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:08:12 02/13/2023 
-- Design Name: 
-- Module Name:    giaima_led_7doan_ena_dp - Behavioral 
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

entity giaima_led_7doan_ena_dp is
    Port ( sw : in  STD_LOGIC_VECTOR (5 downto 0);
           sseg : out  STD_LOGIC_VECTOR (7 downto 0);
           cathode : out  STD_LOGIC);
end giaima_led_7doan_ena_dp;
architecture Behavioral of giaima_led_7doan_ena_dp is
begin
IC1: entity work.giaima_7doan_ena 
       port map(so_gma=>sw(5 downto 2),
		                 sseg=>sseg,
							  dp=>sw(1),
							  ena=>sw(0));
cathode<='1';
end Behavioral;
