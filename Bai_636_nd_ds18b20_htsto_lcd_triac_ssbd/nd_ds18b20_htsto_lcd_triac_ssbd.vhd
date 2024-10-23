----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:18:18 05/19/2023 
-- Design Name: 
-- Module Name:    nd_ds18b20_htsto_lcd_triac_ssbd - Behavioral 
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

entity nd_ds18b20_htsto_lcd_triac_ssbd is
    Port ( CKHT : in  STD_LOGIC;
           SWP : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (1 downto 0);
           BTN : in  STD_LOGIC_VECTOR (2 downto 0);
           DS18B20 : inout  STD_LOGIC;
           BELL : out  STD_LOGIC;
           TRIAC : out  STD_LOGIC;
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_P : out  STD_LOGIC;
           LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0));
end nd_ds18b20_htsto_lcd_triac_ssbd;

architecture Behavioral of nd_ds18b20_htsto_lcd_triac_ssbd is
SIGNAL LCD_H0: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H1: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H2: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H3: STD_LOGIC_VECTOR(159 DOWNTO 0);

SIGNAL NHIETDO: STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL NDO_NG: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ND_TP: STD_LOGIC_VECTOR(3 DOWNTO 0);

SIGNAL ND_DV: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ND_CH: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ND_TR: STD_LOGIC_VECTOR(3 DOWNTO 0);

SIGNAL DS_PRE: STD_LOGIC;

SIGNAL ENA5HZ: STD_LOGIC;
SIGNAL ENA2HZ: STD_LOGIC;
SIGNAL RST : STD_LOGIC;
SIGNAL BTN_UP: STD_LOGIC;
SIGNAL BTN_DW: STD_LOGIC;
SIGNAL XK_BELL: STD_LOGIC;

SIGNAL NDO_SS: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL GH_ND: STD_LOGIC_VECTOR(5 DOWNTO 0);

SIGNAL GH_DV: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL GH_CH: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin
	LCD_P <= SWP;
	TRIAC <= SW(1);
	
	RST <= BTN(0);
	BTN_UP <= BTN(1);
	BTN_DW <= BTN(2);
	
	NDO_NG <= NHIETDO(11 DOWNTO 4);
	ND_TP <= NHIETDO(3 DOWNTO 0);
	NDO_SS <= "00" & GH_ND;
IC1: ENTITY WORK.DKHIEN_BELL
	PORT MAP(	CKHT => CKHT,
					RST => RST,
					SW => SW(0),
					NDO_NG => NDO_NG,
					NDO_SS => NDO_SS,
					ENA5HZ => ENA5HZ,
					XK_BELL => XK_BELL,
					BELL => BELL);
IC2: ENTITY WORK. CHIA_10ENA
	PORT MAP(	CKHT => CKHT,
					ENA2HZ => ENA2HZ,
					ENA5HZ => ENA5HZ);
IC3: ENTITY WORK.CAI_GHAN_NDO_2BTN
	PORT MAP (	CKHT => CKHT,
					RST => RST,
					ENA2HZ => ENA2HZ,
					BTN_UP => BTN_UP,
					BTN_DW => BTN_DW,
					XK_BELL => XK_BELL,
					Q => GH_ND);
IC4: ENTITY WORK.HEXTOBCD_6BIT
	PORT MAP(	SOHEX6BIT => GH_ND,
					DONVI => GH_DV,
					CHUC => GH_CH);
IC5: ENTITY WORK.DS18B20_CONTROL
	PORT MAP(	CKHT => CKHT,
					RST => RST,
					DS18B20 => DS18B20,
					NHIETDO => NHIETDO,
					DS_PRE => DS_PRE);
IC6: ENTITY WORK.HEXTOBCD_8BIT
	PORT MAP(	SOHEX8BIT => NDO_NG,
					DONVI => ND_DV,
					CHUC => ND_CH,
					TRAM => ND_TR);
IC7: ENTITY WORK.LCD_GMA_STO_GAN_DL
	PORT MAP(	ND_TR => ND_TR,
					ND_CH => ND_CH,
					ND_DV => ND_DV,
					ND_TP => ND_TP,
					DS_PRE => DS_PRE,
					GH_CH => GH_CH,
					GH_DV => GH_DV,
					LCD_H0  => LCD_H0,
					LCD_H1  => LCD_H1,
					LCD_H2  => LCD_H2,
					LCD_H3  => LCD_H3);
IC8: ENTITY WORK.LCD_KHOITAO_HIENTHI_SO_TO
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

