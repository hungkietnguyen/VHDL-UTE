----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:48:28 03/07/2023 
-- Design Name: 
-- Module Name:    dem_1bit_btn - Behavioral 
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

entity dem_1bit_btn is
    Port ( ckht : in  STD_LOGIC;
           btn : in  STD_LOGIC;
           q : out  STD_LOGIC;
           rst : in  STD_LOGIC);
end dem_1bit_btn;
architecture Behavioral of dem_1bit_btn is
signal xcdlh :std_logic;
begin
IC1: entity work.cd_lam_hep_btn
     port map( btn=>btn,
	            ckht=>ckht,
					xcdlh=>xcdlh);
					
IC2: entity work.dem_1bit
     port map(ena_db=>xcdlh,
	           ckht=>ckht,
				  rst=>rst,
				  q=>q);
end Behavioral;

