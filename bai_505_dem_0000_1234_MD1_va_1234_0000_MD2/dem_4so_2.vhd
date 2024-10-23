----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:51:08 03/31/2023 
-- Design Name: 
-- Module Name:    dem_4so_2 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_4so_2 is
    Port ( ena_db : in  STD_LOGIC;
           ckht : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena_ss : in  STD_LOGIC;
           donvi : out  STD_LOGIC_VECTOR (3 downto 0);
           chuc : out  STD_LOGIC_VECTOR (3 downto 0);
           tram : out  STD_LOGIC_VECTOR (3 downto 0);
           nghin : out  STD_LOGIC_VECTOR (3 downto 0));
end dem_4so_2;
architecture Behavioral of dem_4so_2 is
signal donvi_r :std_logic_vector(3 downto 0):=x"4";
signal donvi_n :std_logic_vector(3 downto 0);
signal chuc_r :std_logic_vector(3 downto 0):=x"3";
signal chuc_n :std_logic_vector(3 downto 0);
signal tram_r :std_logic_vector(3 downto 0):=x"2";
signal tram_n :std_logic_vector(3 downto 0);
signal nghin_r :std_logic_vector(3 downto 0):=x"1";
signal nghin_n :std_logic_vector(3 downto 0);
signal ena : std_logic;
begin
--register
     process(ckht,rst)
	     begin
	       if (rst='1') then donvi_r <= x"4";
			                   chuc_r  <= x"3";
									 tram_r  <= x"2";
									 nghin_r  <=x"1";
			 elsif falling_edge(ckht) then donvi_r <= donvi_n;
			                               chuc_r  <= chuc_n;
													 tram_r  <= tram_n;
													 nghin_r  <= nghin_n;
			 end if;
	  end process;
-- next state logic
	  ena <= ena_db and ena_ss;
	   process(donvi_r, chuc_r, tram_r, nghin_r, ena)
			begin
			donvi_n <= donvi_r;
			chuc_n <= chuc_r;
			tram_n <= tram_r;
			nghin_n <=nghin_r;
			if ena ='1' then
	        if nghin_r = x"0" and tram_r = x"0"and chuc_r = x"0" and donvi_r = x"0" then donvi_n <=x"4";
			                                                                               chuc_n  <=x"3";
													                                                 tram_n  <=x"2";
													                                                 nghin_n <=x"1";
			  elsif donvi_r =x"0" then donvi_n <=x"9";
			     if chuc_r = x"0" then chuc_n <= x"9";
			        if tram_r =x"0" then tram_n <= x"9";
					                       nghin_n <= nghin_r - 1;
					  else					  tram_n  <= tram_r - 1;
					  end if;
				  else                    chuc_n <= chuc_r - 1;
				  end if;
			  else                        donvi_n <= donvi_r - 1;
			  end if;
			 end if;
       end process;		 
--output logic
    donvi<= donvi_r;
    chuc <= chuc_r;	
    tram <= tram_r;	
    nghin <= nghin_r;	 
end Behavioral;

	
