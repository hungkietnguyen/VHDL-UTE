----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:04:13 03/13/2023 
-- Design Name: 
-- Module Name:    dem_2bit_up_dw_2btn - Behavioral 
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

entity dem_2bit_up_dw_2btn is
    Port ( ckht : in  STD_LOGIC;
           btn_up : in  STD_LOGIC;
           btn_dw : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR( 1 downto 0));
end dem_2bit_up_dw_2btn;

architecture Behavioral of dem_2bit_up_dw_2btn is
signal xcdlh_up, xcdlh_dw :std_logic;
begin
IC1: entity work.cd_lam_hep_btn
     port map( btn=>btn_up,
	            ckht=>ckht,
					xcdlh=>xcdlh_up);
					
IC2: entity work.cd_lam_hep_btn
     port map( btn=>btn_dw,
	            ckht=>ckht,
					xcdlh=>xcdlh_dw);
					
IC3: entity work.dem_2bit
     port map(ena_up=>xcdlh_up,
	           ena_dw=>xcdlh_dw,
	           ckht=>ckht,
				  rst=>rst,
				  q=>q);				  
end Behavioral;

