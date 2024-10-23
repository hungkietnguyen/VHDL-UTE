----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:46:46 02/28/2023 
-- Design Name: 
-- Module Name:    dem_4bit_btn_cach_1 - Behavioral 
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

entity dem_4bit_btn_cach_1 is
    Port ( btn : in  STD_LOGIC_VECTOR (1 downto 0);
           ckht : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (3 downto 0));
end dem_4bit_btn_cach_1;
architecture Behavioral of dem_4bit_btn_cach_1 is
signal xcd, xcdlh, rst :std_logic;
begin
IC1:entity work.debounce_btn
    port map( ckht=>ckht,
	           btn=>btn(1),
				  db_tick =>xcd);	      
				  
IC2:entity work.lam_dep_xung
    port map( ckht=>ckht,
	           d => xcd,
				  q => xcdlh);
				  
IC3:entity work.dem_4bit
    port map( ena_db=>xcdlh,
	           ckht=>ckht,
				  q=>led,
	           rst=>rst);
	rst <= btn(0);
	
end Behavioral;

