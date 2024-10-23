----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:39:45 03/14/2023 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dieukhien_chophep is
    Port ( ckht : in  STD_LOGIC;
           ena_db : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           oe : out  STD_LOGIC_VECTOR (1 downto 0));
end dieukhien_chophep;
architecture Behavioral of dieukhien_chophep is
signal dem_r, dem_n : integer range 0 to 63:=0;
begin
     process(ckht,rst)
	     begin
	       if (rst='1') then dem_r<=0;
			 elsif falling_edge(ckht) then dem_r <= dem_n;
			 end if;
	  end process;
	  dem_n <= 0 when dem_r = 63 and ena_db='1' else
	           dem_r + 1 when ena_db='1' else
	           dem_r;
	  process(dem_r,rst)
	  begin
	       oe <="00";
			 if rst ='1' then oe <="00";
			 elsif dem_r < 32 then oe <="01";
			 elsif dem_r < 64 then oe <="10";
			 end if;
	  end process;
end Behavioral;

