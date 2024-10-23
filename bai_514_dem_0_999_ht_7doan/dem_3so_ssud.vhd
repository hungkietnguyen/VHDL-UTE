----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:09:22 04/11/2023 
-- Design Name: 
-- Module Name:    dem_3so_ssud - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_3so_ssud is
    Port ( ena_db : in  STD_LOGIC;
           ckht : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena_ss : in  STD_LOGIC;
           ena_ud : in  STD_LOGIC;
           donvi : out  STD_LOGIC_VECTOR (3 downto 0);
           chuc : out  STD_LOGIC_VECTOR (3 downto 0);
           tram : out  STD_LOGIC_VECTOR (3 downto 0));
end dem_3so_ssud;

architecture Behavioral of dem_3so_ssud is
signal ena: std_logic :='0';
signal donvi_r: std_logic_vector (3 downto 0):=x"0";
signal donvi_n: std_logic_vector (3 downto 0);
signal chuc_r: std_logic_vector (3 downto 0):=x"0";
signal chuc_n: std_logic_vector (3 downto 0);
signal tram_r: std_logic_vector (3 downto 0):=x"0";
signal tram_n: std_logic_vector (3 downto 0);

begin
--register
	process(ckht, rst, ena_ud)
	begin
		if rst= '1' then 
			if ena_ud = '1' then donvi_r <= x"0";
			                     chuc_r <= x"0";
										tram_r <= x"0";
			else                 donvi_r <= x"9";
			                     chuc_r <= x"9";
										tram_r <= x"9";
			end if;
		elsif falling_edge( ckht) then donvi_r <= donvi_n;
		                               chuc_r <= chuc_n;
												 tram_r <= tram_n;
		end if;
	end process;
--next- state logic
	ena <= ena_ss and ena_db;
	process( donvi_r, chuc_r, tram_r,  ena, ena_ud)
	begin
		donvi_n <= donvi_r;
		chuc_n <= chuc_r;
		tram_n <= tram_r;
		if ena = '1' and ena_ud = '1' then
			if chuc_r = x"9" and donvi_r = x"9" and tram_r = x"9" then  donvi_n <= x"0";
			                                                            chuc_n  <= x"0";
																							tram_n  <= x"0";
			elsif donvi_r = x"9" then donvi_n <= x"0";
			    if chuc_r = x"9" then chuc_n <= x"0";
				                       tram_n <= tram_r + 1;
				 else                  chuc_n <= chuc_r + 1;		                          
			    end if;
		    else donvi_n <= donvi_r +1;
			 end if;
		elsif ena = '1' and ena_ud = '0' then
			if chuc_r = x"0" and  donvi_r = x"0" and tram_r = x"0"   then donvi_n <= x"9";
			                                                              chuc_n <= x"9";
																							  tram_n <= x"9";
			                                        
			elsif donvi_r =x"0"  then donvi_n <= x"9";
			    if chuc_r = x"0" then chuc_n <= x"9";
			                          tram_n <= tram_r - 1;
			    else                  chuc_n <= chuc_r - 1;
			    end if;
			else donvi_n <= donvi_r - 1;
			end if;	
		end if;
	end process;
--output logic
	donvi <= donvi_r;
	chuc  <= chuc_r;
	tram  <= tram_r;
end Behavioral;

