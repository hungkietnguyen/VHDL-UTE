----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:39 05/04/2022 
-- Design Name: 
-- Module Name:    gm_ht_8led - Behavioral 
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

entity GM_HT_8LED is
    Port ( CKHT : IN  STD_LOGIC;
           ENA1KHZ : IN  STD_LOGIC;
           LED70, LED71, LED72, LED73, LED74, LED75, LED76, LED77 : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
			  DC_8LED, ENA_8LED : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
           CATHODE : OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
           SSEG : OUT  STD_LOGIC_VECTOR (7 DOWNTO 0));

end GM_HT_8LED;

architecture Behavioral of GM_HT_8LED is
SIGNAL S3B: STD_LOGIC_VECTOR( 2 DOWNTO 0);
SIGNAL SO_GMA: STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL DC_1LED, ENA_1LED: STD_LOGIC;
BEGIN
K1: ENTITY WORK.DEM_3BIT
		PORT MAP( ENA1KHZ => ENA1KHZ,
					 CKHT => CKHT,
					 Q => S3B);

K2: ENTITY WORK.DAHOP_8KENH
		PORT MAP( S => S3B,
					 O => SO_GMA,
					 DC8 => DC_8LED,
					 DC1 => DC_1LED,
					 
					 ENA8 => ENA_8LED,
					 ENA1 => ENA_1LED,
					 I0 => LED70,
					 I1 => LED71,
					 I2 => LED72,
					 I3 => LED73,
					 I4 => LED74,
					 I5 => LED75,
					 I6 => LED76,
					 I7 => LED77);
 
 K3: ENTITY WORK.GIAIMA_38H
		PORT MAP (  I => S3B,
						O => CATHODE );
							
 
 K4: ENTITY WORK.GIAIMA_7DOAN_ENA 
		PORT MAP( SO_GMA => SO_GMA,
					 DP => DC_1LED,
					 ENA => ENA_1LED,
		          SSEG => SSEG);


end Behavioral;

