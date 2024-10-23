----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:55 04/20/2023 
-- Design Name: 
-- Module Name:    DHT11_NHDO_DOAM_HTSTO_LCD - Behavioral 
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

entity DHT11_NHDO_DOAM_HTSTO_LCD is
    Port ( CKHT : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           SWP : in  STD_LOGIC;
           DHT11 : inout  STD_LOGIC;
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_P : out  STD_LOGIC;
           LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0));
end DHT11_NHDO_DOAM_HTSTO_LCD;

architecture Behavioral of DHT11_NHDO_DOAM_HTSTO_LCD is
SIGNAL LCD_H0: STD_LOGIC_VECTOR( 159 DOWNTO 0);
SIGNAL LCD_H1: STD_LOGIC_VECTOR( 159 DOWNTO 0);
SIGNAL LCD_H2: STD_LOGIC_VECTOR( 159 DOWNTO 0);
SIGNAL LCD_H3: STD_LOGIC_VECTOR( 159 DOWNTO 0);

SIGNAL RST:   STD_LOGIC;
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
	LCD_P     <= SWP;
	RST 	    <= BTN0;
	
	DAM_BH	 <= DA_ND5( 39 DOWNTO 32);
   DAM_BL    <= DA_ND5( 31 DOWNTO 24);	
	NDO_BH	 <= DA_ND5( 23 DOWNTO 16);
   NDO_BL    <= DA_ND5( 15 DOWNTO 8);
	CH_SM1    <= DA_ND5( 7 DOWNTO 0);
	
	
	CH_SM2	 <= NDO_BH + NDO_BL + DAM_BH + DAM_BL;
	TT_CS     <= '1' WHEN	CH_SM1= CH_SM2 ELSE  -- CS OKE
					 '0';  --- CS ERROR

IC1: ENTITY WORK.DHT11_HUMI_TEMP
	PORT MAP( CKHT		=> CKHT,
			    RST		=> RST,
				 DHT11	=> DHT11,
				 DHT_PR	=> DHT_PR,
				 DA_ND5	=> DA_ND5);  --KQ: 5 BYTE

IC2: ENTITY WORK.HEXTOBCD_8BIT
	PORT MAP( SOHEX8BIT		=> NDO_BH,
	          DONVI         => ND_DV,
				 CHUC				=> ND_CH,
				 TRAM				=> ND_TR);
				
IC3: ENTITY WORK.HEXTOBCD_8BIT
	PORT MAP( SOHEX8BIT		=> DAM_BH,
	          DONVI         => DA_DV,
				 CHUC				=> DA_CH,
				 TRAM				=> DA_TR);
IC4: ENTITY WORK.LCD_GMA_STO_GAN_DL
	PORT MAP( ND_TR   => ND_TR,
	          ND_CH	=> ND_CH,
				 ND_DV => ND_DV,
				 
				 DA_TR   => DA_TR,
				 DA_CH => DA_CH,
				 DA_DV => DA_DV,
				 
				 TT_CS => TT_CS,
				 DHT_PR => DHT_PR,
				 
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);

IC5: ENTITY WORK.LCD_KHOITAO_HIENTHI_SO_TO			
		PORT MAP( CKHT   => CKHT,
		          RST    => RST,
					 LCD_DB => LCD_DB,
					 LCD_RS => LCD_RS,
					 LCD_E  => LCD_E,
					 LCD_H0  => LCD_H0,
					 LCD_H1  => LCD_H1,
				    LCD_H2  => LCD_H2,
				    LCD_H3  => LCD_H3);					 
end Behavioral;

