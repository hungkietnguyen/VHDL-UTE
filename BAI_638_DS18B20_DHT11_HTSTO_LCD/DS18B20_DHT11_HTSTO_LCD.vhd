----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:03 04/20/2023 
-- Design Name: 
-- Module Name:    DS18B20_DHT11_HTSTO_LCD - Behavioral 
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

entity DS18B20_DHT11_HTSTO_LCD is
    Port ( CKHT : in  STD_LOGIC;
           SWP : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (1 downto 0);
           BTN : in  STD_LOGIC_VECTOR (2 downto 0);
           DHT11 : inout  STD_LOGIC;
           DS18B20 : inout  STD_LOGIC;
           BELL : out  STD_LOGIC;
           TRIAC : out  STD_LOGIC;
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_P : out  STD_LOGIC;
           LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0));
end DS18B20_DHT11_HTSTO_LCD;

architecture Behavioral of DS18B20_DHT11_HTSTO_LCD is
SIGNAL LCD_H0: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H1: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H2: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H3: STD_LOGIC_VECTOR(159 DOWNTO 0);

SIGNAL NHIETDO : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL NDO_NG,NDO_SS : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ND_TPDS : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ND_DVDS, ND_CHDS, ND_TRDS : STD_LOGIC_VECTOR(3 DOWNTO 0);

SIGNAL GH_ND : STD_LOGIC_VECTOR(5 DOWNTO 0):="100011";
SIGNAL GH_DV : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL GH_CH : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RST,DS_PRE, BTN_UP,BTN_DW : STD_LOGIC;
SIGNAL ENA2HZ,ENA5HZ, XK_BELL : STD_LOGIC;

SIGNAL TT_CS: STD_LOGIC;--- TRANG THAI CHECK SUM
SIGNAL DHT_PR: STD_LOGIC;--- DHT11 PRESENT

SIGNAL NDO_BH: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL NDO_BL: STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL DAM_BH: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DAM_BL: STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL CH_SM1: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL CH_SM2: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DA_ND5: STD_LOGIC_VECTOR(39 DOWNTO 0);

SIGNAL ND_DVDH: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ND_CHDH: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ND_TRDH: STD_LOGIC_VECTOR(3 DOWNTO 0);

SIGNAL DA_DVDH: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DA_CHDH: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DA_TRDH: STD_LOGIC_VECTOR(3 DOWNTO 0);


begin
	RST   <= BTN(0);
	BTN_UP <= BTN(1);
	BTN_DW <= BTN(2);
	LCD_P    <= SWP;
	TRIAC <= SW(1);
	
	NDO_NG <= NHIETDO(11 DOWNTO 4);
	ND_TPDS <= NHIETDO(3 DOWNTO 0);
	
	NDO_SS <= "00" &GH_ND;
	
	DAM_BH	 <= DA_ND5( 39 DOWNTO 32);
   DAM_BL    <= DA_ND5( 31 DOWNTO 24);	
	NDO_BH	 <= DA_ND5( 23 DOWNTO 16);
   NDO_BL    <= DA_ND5( 15 DOWNTO 8);
	CH_SM1    <= DA_ND5( 7 DOWNTO 0);
	
	
	CH_SM2	 <= NDO_BH + NDO_BL + DAM_BH + DAM_BL;
	TT_CS     <= '1' WHEN	CH_SM1= CH_SM2 ELSE  -- CS OKE
					 '0';  --- CS ERROR
IC1: ENTITY WORK.DKHIEN_BELL
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 SW  => SW(0),
				 NDO_NG => NDO_NG,
				 NDO_SS => NDO_SS,
				 ENA5HZ => ENA5HZ,
				 XK_BELL => XK_BELL,
				 BELL    => BELL);

IC2: ENTITY WORK.CHIA_10ENA
		PORT MAP ( 	CKHT => CKHT,
						ENA2HZ => ENA2HZ,
						ENA5HZ => ENA5HZ);
IC3: ENTITY WORK.CAI_GHAN_NDO_2BTN
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 ENA2HZ => ENA2HZ,
				 BTN_UP => BTN_UP,
				 BTN_DW => BTN_DW,
				 XK_BELL => XK_BELL,
				 Q       => GH_ND);	
				 
IC4: ENTITY WORK.HEXTOBCD_6BIT
		PORT MAP(SOHEX6BIT => GH_ND,
					DONVI		 => GH_DV,
					CHUC 		 => GH_CH);		
IC5: ENTITY WORK.DS18B20_CONTROL
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 DS18B20 => DS18B20,
				 NHIETDO => NHIETDO,
				 DS_PRE	=> DS_PRE);			

IC6: ENTITY WORK.HEXTOBCD_8BIT
	PORT MAP(SOHEX8BIT => NDO_NG,
				DONVI		=> ND_DVDS,
				CHUC		=> ND_CHDS,
				TRAM		=> ND_TRDS);	
IC7: ENTITY WORK.DHT11_HUMI_TEMP
	PORT MAP( CKHT		=> CKHT,
			    RST		=> RST,
				 DHT11	=> DHT11,
				 DHT_PR	=> DHT_PR,
				 DA_ND5	=> DA_ND5);  --KQ: 5 BYTE

IC8: ENTITY WORK.HEXTOBCD_8BIT
	PORT MAP( SOHEX8BIT		=> NDO_BH,
	          DONVI         => ND_DVDH,
				 CHUC				=> ND_CHDH,
				 TRAM				=> ND_TRDH);
				
IC9: ENTITY WORK.HEXTOBCD_8BIT
	PORT MAP( SOHEX8BIT		=> DAM_BH,
	          DONVI         => DA_DVDH,
				 CHUC				=> DA_CHDH,
				 TRAM				=> DA_TRDH);
ICA: ENTITY WORK.LCD_GMA_STO_GAN_DULIEU
	PORT MAP( ND_TRDS => ND_TRDS,
				 ND_CHDS => ND_CHDS,
				 ND_DVDS => ND_DVDS,
				 ND_TPDS => ND_TPDS,
				 DS_PRE => DS_PRE,
				 GH_CH => GH_CH,
				 GH_DV => GH_DV,
				 
				 ND_TRDH   => ND_TRDH,
	          ND_CHDH	=> ND_CHDH,
				 ND_DVDH => ND_DVDH,
				 
				 DA_TRDH   => DA_TRDH,
				 DA_CHDH => DA_CHDH,
				 DA_DVDH => DA_DVDH,
				 
				 TT_CS => TT_CS,
				 DHT_PR => DHT_PR,
				 
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);		
ICB: ENTITY WORK.LCD_KHOITAO_HIENTHI_SO_TO			
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
