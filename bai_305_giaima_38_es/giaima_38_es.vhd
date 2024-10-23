----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:18:26 02/08/2023 
-- Design Name: 
-- Module Name:    giaima_38_es - Behavioral 
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

entity giaima_38_es is
    Port ( sw : in  STD_LOGIC_VECTOR (5 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end giaima_38_es;
architecture Behavioral of giaima_38_es is
begin
IC1: entity work.giaima_38
       port map (  i=>sw( 2 downto 0),
		                    e=>sw(3),
								  s=>sw(4),
								  o=>led(7 downto 0));

end Behavioral;

