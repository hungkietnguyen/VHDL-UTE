----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:04:17 02/26/2023 
-- Design Name: 
-- Module Name:    dem_nhi_phan_8bit_ssud_auto - Behavioral 
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

entity dem_nhi_phan_8bit_ssud_auto is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sw0 : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR(8 downto 0));
end dem_nhi_phan_8bit_ssud_auto;
architecture Behavioral of dem_nhi_phan_8bit_ssud_auto is
signal ena_db:std_logic;
signal ena_ud:std_logic;
signal qd:std_logic_vector(7 downto 0);
begin
   led(7 downto 0) <= qd;
	led(8) <= ena_ud;
IC1:entity work.chia_ena5hz
    port map( ckht=>ckht,
	           ena5hz=>ena_db);
IC2:entity work.dem_8bit
    port map( ckht=>ckht,
	           ena_db=>ena_db,
				  ena_ud=>ena_ud,
				  rst=>btn0,
				  ena_ss=>sw0,
				  q=>qd);
IC3: entity work.auto_dao_ena_ud
     port map( ckht=>ckht,
	            ena_ud=>ena_ud,
				   rst=>btn0,
					q_ss=>qd);

end Behavioral;

