----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:23:10 03/25/2023 
-- Design Name: 
-- Module Name:    DONG_HO_GPG - Behavioral 
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

entity DONG_HO_GPG is
    Port ( CKHT : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (1 downto 0);
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0);
           CATHODE : out  STD_LOGIC_VECTOR (7 downto 0));
end DONG_HO_GPG;

architecture Behavioral of DONG_HO_GPG is
SIGNAL RST,ENA_DB,ENA1HZ,ENA20HZ,ENA50HZ,ENA100HZ,ENA1KHZ : STD_LOGIC;
SIGNAL GIO, PHUT,GIAY: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL DV_GIO, CH_GIO : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DV_PHUT, CH_PHUT : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DV_GIAY, CH_GIAY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DC_8LED,ENA_8LED : STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
	RST <= BTN0;
	DC_8LED <= X"00";
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
				 ENA1KHZ => ENA1KHZ);

IC2: ENTITY WORK.DEM_GPG
	PORT MAP(CKHT => CKHT,
				RST => RST,
				ENA_DB => ENA_DB,
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
