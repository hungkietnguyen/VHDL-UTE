----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:32:31 04/13/2023 
-- Design Name: 
-- Module Name:    DONG_HO_GPG_LCD_3KEY_NN_BELL - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DONG_HO_GPG_LCD_NN_BELL_DHT11 is
    Port ( CKHT : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (3 downto 0);
           SWP : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (1 downto 0);
           BELL : out  STD_LOGIC;
			  DHT11: inout STD_LOGIC;
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_P : out  STD_LOGIC;
           LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0));
end DONG_HO_GPG_LCD_NN_BELL_DHT11;

architecture Behavioral of DONG_HO_GPG_LCD_NN_BELL_DHT11 is
SIGNAL LCD_H0: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H1: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H2: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H3: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL RST,ENA_DB,ENA1HZ,ENA2HZ,ENA5HZ,ENA20HZ,ENA50HZ,ENA100HZ : STD_LOGIC;
SIGNAL  BTN_UP, BTN_DW,BTN_MOD : STD_LOGIC;
SIGNAL  CD_BUP, CD_BDW,XK_BELL: STD_LOGIC;
SIGNAL GIO,PHUT,GIAY: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL DV_GIO, CH_GIO : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DV_PHUT, CH_PHUT : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DV_GIAY, CH_GIAY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL GT_MOD : STD_LOGIC_VECTOR(1 DOWNTO 0);

SIGNAL TT_CS: STD_LOGIC;--- TRANG THAI CHECK SUM
SIGNAL DHT_PR: STD_LOGIC;--- DHT11 PRESENT

SIGNAL NDO_BH: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL NDO_BL: STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL DAM_BH: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DAM_BL: STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL CH_SM1: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL CH_SM2: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DA_ND5: STD_LOGIC_VECTOR(39 DOWNTO 0);

SIGNAL ND_DV: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ND_CH: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ND_TR: STD_LOGIC_VECTOR(3 DOWNTO 0);

SIGNAL DA_DV: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DA_CH: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DA_TR: STD_LOGIC_VECTOR(3 DOWNTO 0);
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
				 
	DAM_BH	 <= DA_ND5( 39 DOWNTO 32);
   DAM_BL    <= DA_ND5( 31 DOWNTO 24);	
	NDO_BH	 <= DA_ND5( 23 DOWNTO 16);
   NDO_BL    <= DA_ND5( 15 DOWNTO 8);
	CH_SM1    <= DA_ND5( 7 DOWNTO 0);
	
	
	CH_SM2	 <= NDO_BH + NDO_BL + DAM_BH + DAM_BL;
	TT_CS     <= '1' WHEN	CH_SM1= CH_SM2 ELSE  -- CS OKE
					 '0';  --- CS ERROR			 
IC1: ENTITY WORK.CHIA_10ENA
	PORT MAP( CKHT => CKHT,
				 ENA1HZ => ENA1HZ,
				 ENA2HZ => ENA2HZ,
				 ENA20HZ => ENA20HZ,
				 ENA50HZ => ENA50HZ,
				 ENA100HZ => ENA100HZ,
				 ENA5HZ  => ENA5HZ);

IC2: ENTITY WORK.DEM_GPG_3KEY_NN
	PORT MAP(CKHT => CKHT,
				RST => RST,
				BTN_UP => BTN_UP,
				BTN_DW => BTN_DW,
				BTN_MOD => BTN_MOD,
				GT_MOD => GT_MOD,
				ENA_DB => ENA_DB,
				ENA5HZ => ENA5HZ,
				
				CD_BUP => CD_BUP,
				CD_BDW => CD_BDW,
				XK_BELL => XK_BELL,
				GIO => GIO,
				PHUT => PHUT,
				GIAY => GIAY);
				
IC3: ENTITY WORK.HEXTOBCD_GPG
	PORT MAP(GIO => GIO,
				DV_GIO =>  DV_GIO,
				CH_GIO =>  CH_GIO,
				
				PHUT => PHUT,
				DV_PHUT => DV_PHUT,
				CH_PHUT => CH_PHUT,
				
				GIAY => GIAY,
				DV_GIAY => DV_GIAY,
				CH_GIAY => CH_GIAY);

IC4: ENTITY	WORK.BELL_BIP
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 TG_BIP => ENA5HZ,
				 XK_BELL => XK_BELL,
				 BELL    => BELL);
				 
IC5: ENTITY WORK.DHT11_HUMI_TEMP
	PORT MAP( CKHT		=> CKHT,
			    RST		=> RST,
				 DHT11	=> DHT11,
				 DHT_PR	=> DHT_PR,
				 DA_ND5	=> DA_ND5);  --KQ: 5 BYTE

IC6: ENTITY WORK.HEXTOBCD_8BIT
	PORT MAP( SOHEX8BIT		=> NDO_BH,
	          DONVI         => ND_DV,
				 CHUC				=> ND_CH,
				 TRAM				=> ND_TR);
				
IC7: ENTITY WORK.HEXTOBCD_8BIT
	PORT MAP( SOHEX8BIT		=> DAM_BH,
	          DONVI         => DA_DV,
				 CHUC				=> DA_CH,
				 TRAM				=> DA_TR);	
				 
ICA: ENTITY WORK.LCD_GAN_DULIEU_GPG_NN
	PORT MAP( CKHT => CKHT,
				 GT_MOD => GT_MOD,
				 
				 DV_GIO =>  DV_GIO,
				 CH_GIO =>  CH_GIO,
				 
				 DV_PHUT => DV_PHUT,
				 CH_PHUT => CH_PHUT,
				 
				 DV_GIAY => DV_GIAY,
				 CH_GIAY => CH_GIAY,
				 
				 ENA2HZ  => ENA2HZ,
				 CD_BUP  => CD_BUP,
				 CD_BDW  => CD_BDW,
				 
				 ND_TR => ND_TR,
				 ND_CH =>ND_CH,
				 ND_DV => ND_DV,
				 DA_TR => DA_TR,
				 DA_CH => DA_CH,
				 DA_DV => DA_DV,
				 TT_CS => TT_CS,
				 DHT_PR => DHT_PR,
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);		
				 
ICB: ENTITY WORK.LCD_KHOITAO_HIENTHI
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

