----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:24:00 04/08/2023 
-- Design Name: 
-- Module Name:    DONG_HO_GPG_LCD_3KEY - Behavioral 
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

entity DONG_HO_GPG_LCD_3KEY is
    Port ( CKHT : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (3 downto 0);
           SWP : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (1 downto 0);
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_P : out  STD_LOGIC;
           LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0));
end DONG_HO_GPG_LCD_3KEY;

architecture Behavioral of DONG_HO_GPG_LCD_3KEY is
SIGNAL LCD_H0: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H1: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H2: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H3: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL RST,ENA_DB,ENA1HZ,ENA5HZ,ENA20HZ,ENA50HZ,ENA100HZ : STD_LOGIC;
SIGNAL  BTN_UP, BTN_DW,BTN_MOD : STD_LOGIC;
SIGNAL GIO,PHUT,GIAY: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL DV_GIO, CH_GIO : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DV_PHUT, CH_PHUT : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DV_GIAY, CH_GIAY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL GT_MOD : STD_LOGIC_VECTOR(1 DOWNTO 0);
begin
	LCD_P <= SWP;
	RST <= BTN(0);
	BTN_UP <= BTN(1);
	BTN_MOD <= BTN(2);
	BTN_DW <= BTN(3);
	
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
				 ENA5HZ  => ENA5HZ);

IC2: ENTITY WORK.DEM_GPG_3KEY
	PORT MAP(CKHT => CKHT,
				RST => RST,
				BTN_UP => BTN_UP,
				BTN_DW => BTN_DW,
				BTN_MOD => BTN_MOD,
				
				ENA_DB => ENA_DB,
				ENA5HZ => ENA5HZ,
				GT_MOD => GT_MOD,
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
				
IC4: ENTITY WORK.LCD_GAN_DULIEU_GPG
	PORT MAP( GT_MOD => GT_MOD,
				 DV_GIO =>  DV_GIO,
				 DV_PHUT => DV_PHUT,
				 DV_GIAY => DV_GIAY,
				 CH_GIO =>  CH_GIO,
				 CH_PHUT => CH_PHUT,
				 CH_GIAY => CH_GIAY,
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);				
IC5: ENTITY WORK.LCD_KHOITAO_HIENTHI
	PORT MAP( RST   	=> RST,
	          CKHT  	=> CKHT,
				 LCD_DB	=> LCD_DB,
				 LCD_RS  => LCD_RS,
				 LCD_E   => LCD_E,
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);					
end Behavioral;

