----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:29:07 03/20/2023 
-- Design Name: 
-- Module Name:    dieukhien_chophep - Behavioral 
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

entity dieukhien_chophep is
    Port ( ckht : in  STD_LOGIC;
           ena_db : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           oe : out  STD_LOGIC_VECTOR (5 downto 0));
end dieukhien_chophep;

architecture Behavioral of dieukhien_chophep is
signal dem_r, dem_n : integer range 0 to 127:=0;
begin
     process(ckht,rst)
	     begin
	       if (rst='1') then dem_r<=0;
			 elsif falling_edge(ckht) then dem_r <= dem_n;
			 end if;
	  end process;
	  dem_n <= 0 when dem_r = 127 and ena_db='1' else
	           dem_r + 1 when ena_db='1' else
	           dem_r;
	  process(dem_r,rst)
	  begin
	       oe <="000000";
			 if rst ='1'      then oe <="000000";
			 elsif dem_r < 32 then oe <="000001";
			 elsif dem_r < 64 then oe <="000010";
			 elsif dem_r < 80 then oe <="000100";
			 elsif dem_r < 96 then oe <="001000";
			 elsif dem_r < 112 then oe<="010000";
			 elsif dem_r < 128 then oe<="100000";
			 end if;
	  end process;
end Behavioral;

