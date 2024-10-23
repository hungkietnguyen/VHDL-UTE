----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:58:53 03/28/2023 
-- Design Name: 
-- Module Name:    dem_2so - Behavioral 
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

entity dem_2so is
    Port ( ckht : in  STD_LOGIC;
           ena_db : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena_ss : in  STD_LOGIC;
           donvi : out  STD_LOGIC_VECTOR (3 downto 0);
           chuc : out  STD_LOGIC_VECTOR (3 downto 0));
end dem_2so;
architecture Behavioral of dem_2so is
signal donvi_r, donvi_n :std_logic_vector(3 downto 0);
signal chuc_r, chuc_n :std_logic_vector(3 downto 0);
signal ena : std_logic;
begin
--register
     process(ckht,rst)
	     begin
	       if (rst='1') then donvi_r <= "0000";
			                   chuc_r  <= "0000";
			 elsif falling_edge(ckht) then donvi_r <= donvi_n;
			                               chuc_r  <= chuc_n;
									
			 end if;
	  end process;
-- next state logic
	  ena <= ena_db and ena_ss;
	     process(donvi_r, chuc_r, ena)
			begin
			donvi_n <= donvi_r;
			chuc_n <= chuc_r;
			if ena ='1' then
	        if donvi_r /= x"9" then donvi_n <= donvi_r + 1;
			  else                    donvi_n <= x"0";
			     if chuc_r /= x"9" then chuc_n <= chuc_r + 1;
			     else                   chuc_n <= x"0";
			     end if;
			   end if;
			 end if;
			end process;
--output logic
    donvi<= donvi_r;
    chuc <= chuc_r;	 
end Behavioral


