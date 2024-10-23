----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:58:58 02/28/2023 
-- Design Name: 
-- Module Name:    dem_2bit_btn - Behavioral 
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

entity dem_2bit_btn is
    Port ( ckht : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           btn : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (1 downto 0));
end dem_2bit_btn;

architecture Behavioral of dem_2bit_btn is
signal xcdlh: std_logic;
begin
U1: entity work.cd_lam_hep_btn
	port map( ckht => ckht,
			            btn => btn,
							xcdlh => xcdlh);
U2: entity work.dem_2bit
	port map( ckht => ckht,
							rst => rst,
							ena_db => xcdlh,
							q => q);
end Behavioral;

