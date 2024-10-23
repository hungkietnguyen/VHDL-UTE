----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:55:40 02/28/2023 
-- Design Name: 
-- Module Name:    dem_2bit_btn_cach_3 - Behavioral 
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

entity dem_2bit_btn_cach_3 is
    Port ( ckht : in  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR (1 downto 0);
           led : out  STD_LOGIC_VECTOR (1 downto 0));
end dem_2bit_btn_cach_3;

architecture Behavioral of dem_2bit_btn_cach_3 is
signal rst, btn1: std_logic;
begin
	rst <= btn(0);
	btn1 <= btn(1);
IC: entity work.dem_2bit_btn
	port map( ckht => ckht,
							rst => rst,
							btn => btn1,
							q => led);

end Behavioral;

