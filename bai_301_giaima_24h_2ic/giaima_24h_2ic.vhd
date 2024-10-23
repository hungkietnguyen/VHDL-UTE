----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:34:04 02/05/2023 
-- Design Name: 
-- Module Name:    giaima_24h_2ic - Behavioral 
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

entity giaima_24h_2ic is
    Port ( sw : in  STD_LOGIC_VECTOR (3 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end giaima_24h_2ic;

architecture Behavioral of giaima_24h_2ic is

begin
IC1: entity work.giaima_24h_sel
     port map( i => sw( 1 downto 0),
	            o => led( 3 downto 0));
IC2: entity work.giaima_24h_con
     port map( i => sw( 3 downto 2),
	            o => led( 7 downto 4));

end Behavioral;

