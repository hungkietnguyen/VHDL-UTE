----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:01:01 03/13/2023 
-- Design Name: 
-- Module Name:    dem_2bit_up_dw_2btn_2led - Behavioral 
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

entity dem_2bit_up_dw_2btn_2led is
    Port ( ckht : in  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR (2 downto 0);
           led : out  STD_LOGIC_VECTOR (1 downto 0));
end dem_2bit_up_dw_2btn_2led;

architecture Behavioral of dem_2bit_up_dw_2btn_2led is
signal rst, btn_up, btn_dw:std_logic;
begin
IC:entity work.dem_2bit_up_dw_2btn
   port map( ckht => ckht,
	          btn_up  =>btn(1),
				 btn_dw  =>btn(2),
				 rst =>btn(0),
				 q    =>led);				 
end Behavioral;

