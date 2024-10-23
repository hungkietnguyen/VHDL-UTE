----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:15:00 05/16/2023 
-- Design Name: 
-- Module Name:    DONG_HO_GPG_3KEY - Behavioral 
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

entity DONG_HO_GPG_3KEY is
    Port ( CKHT : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (1 downto 0);
           BTN : in  STD_LOGIC_VECTOR (3 downto 0);
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0);
           CATHODE : out  STD_LOGIC_VECTOR (7 downto 0));
end DONG_HO_GPG_3KEY;

architecture Behavioral of DONG_HO_GPG_3KEY is
SIGNAL RST,ENA_DB,ENA1HZ,ENA20HZ,ENA50HZ,ENA100HZ,ENA1KHZ : STD_LOGIC;
SIGNAL ENA5HZ, BTN_UP, BTN_DW,BTN_MOD : STD_LOGIC;
SIGNAL GIO, PHUT,GIAY: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL DV_GIO, CH_GIO : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DV_PHUT, CH_PHUT : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DV_GIAY, CH_GIAY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DC_8LED,ENA_8LED : STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
	RST <= BTN(0);
	BTN_UP <= BTN(1);
	BTN_MOD <= BTN(2);
	BTN_DW <= BTN(3);
	
	ENA_8LED <= "11011011";
	ENA_DB <= ENA1HZ WHEN SW="00" ELSE
				 ENA20HZ WHEN SW="01" ELSE
				 ENA50HZ WHEN SW="10" ELSE
				 ENA100HZ;
				 
IC1: ENTITY WORK.CHIA_10ENA
	PORT MAP( CKHT => CKHT,
				 ENA1HZ => ENA1HZ,
				 ENA20HZ => ENA20HZ,
				 ENA50HZ => ENA50HZ,
				 ENA100HZ => ENA100HZ,
				 ENA5HZ  => ENA5HZ,
				 ENA1KHZ => ENA1KHZ);

IC2: ENTITY WORK.DEM_GPG_3KEY
	PORT MAP(CKHT => CKHT,
				RST => RST,
				BTN_UP => BTN_UP,
				BTN_DW => BTN_DW,
				BTN_MOD => BTN_MOD,
				
				ENA_DB => ENA_DB,
				ENA5HZ => ENA5HZ,
				
				DC_8LED => DC_8LED,
				GIO => GIO,
				PHUT => PHUT,
				GIAY => GIAY);
				
IC3: ENTITY WORK.HEXTOBCD_GPG
	PORT MAP(GIO => GIO,
				PHUT => PHUT,
				GIAY => GIAY,
				DV_GIO =>  DV_GIO,
				DV_PHUT => DV_PHUT,
				DV_GIAY => DV_GIAY,
				CH_GIO =>  CH_GIO,
				CH_PHUT => CH_PHUT,
				CH_GIAY => CH_GIAY);

IC4: ENTITY WORK.GM_HT_8LED
	PORT MAP( CKHT => CKHT,
				 ENA1KHZ => ENA1KHZ,
				 LED70 => DV_GIAY,
				 LED71 => CH_GIAY,
				 LED72 => X"F",
	          LED73 => DV_PHUT,
				 LED74 => CH_PHUT,
				 LED75 => X"F",
				 LED76 => DV_GIO,
				 LED77 => CH_GIO,
				 DC_8LED => DC_8LED,
				 ENA_8LED => ENA_8LED,
				 SSEG => SSEG,
				 CATHODE => CATHODE);

end Behavioral;
				 

