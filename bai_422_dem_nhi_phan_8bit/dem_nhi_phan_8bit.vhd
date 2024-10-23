----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:47:36 02/20/2023 
-- Design Name: 
-- Module Name:    dem_nhi_phan_8bit - Behavioral 
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

entity dem_nhi_phan_8bit is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end dem_nhi_phan_8bit;
architecture Behavioral of dem_nhi_phan_8bit is
signal ena_db:std_logic;
begin
IC1:entity work.chia_ena5hz
    port map( ckht=>ckht,
	           ena5hz=>ena_db);
IC2:entity work.dem_8bit
    port map( ckht=>ckht,
	           ena_db=>ena_db,
				  rst=>btn0,
				  q=>led);

end Behavioral;

