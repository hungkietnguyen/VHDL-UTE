----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:42:57 03/07/2023 
-- Design Name: 
-- Module Name:    dem_1bit_btn_cach_3 - Behavioral 
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

entity dem_1bit_btn_cach_3 is
    Port ( ckht : in  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR (1 downto 0);
           led0 : out  STD_LOGIC);
end dem_1bit_btn_cach_3;
architecture Behavioral of dem_1bit_btn_cach_3 is
signal rst:std_logic;
begin
IC:entity work.dem_1bit_btn
   port map( ckht => ckht,
	          btn  =>btn(1),
				 rst =>rst,
				 q    =>led0);				 
rst <= btn(0);
end Behavioral;

