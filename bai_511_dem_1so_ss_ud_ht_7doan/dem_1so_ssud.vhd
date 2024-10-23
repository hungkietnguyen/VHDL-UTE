----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:31:11 03/28/2023 
-- Design Name: 
-- Module Name:    dem_1so_ssud - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_1so_ssud is
    Port ( ckht : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena_ss : in  STD_LOGIC;
           ena_ud : in  STD_LOGIC;
           ena_db : in  STD_LOGIC;
           donvi : out  STD_LOGIC_VECTOR (3 downto 0));
end dem_1so_ssud;

architecture Behavioral of dem_1so_ssud is
signal ena: std_logic :='0';
signal donvi_r, donvi_n: std_logic_vector (3 downto 0);

begin
--register
	process(ckht, rst, ena_ud)
	begin
		if rst= '1' then 
			if ena_ud = '1' then donvi_r <= x"0";
			else donvi_r <= x"9";
			end if;
		elsif falling_edge( ckht) then donvi_r <= donvi_n;
		end if;
	end process;
--next- state logic
	ena <= ena_db and ena_ss;
	process( donvi_r, ena, ena_ud)
	begin
		donvi_n <= donvi_r;
		if ena = '1' and ena_ud = '1' then
			if donvi_r = x"9" then donvi_n <= x"0";
			else donvi_n <= donvi_r + 1;
			end if;
		elsif ena = '1' and ena_ud = '0' then
			if donvi_r = x"0" then donvi_n <= x"9";
			else donvi_n <= donvi_r - 1;
			end if;
		end if;
	end process;
--output logic
	donvi <= donvi_r;
end Behavioral;

