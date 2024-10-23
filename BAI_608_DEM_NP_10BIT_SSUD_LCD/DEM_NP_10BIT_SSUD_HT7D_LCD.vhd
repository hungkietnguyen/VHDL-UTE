----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:55 04/06/2023 
-- Design Name: 
-- Module Name:    DEM_NP_8BI_SSU_HT7D_LCD - Behavioral 
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

entity DEM_NP_10BIT_SSUD_LCD is
    Port ( CKHT : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (2 downto 0);
           SW : in  STD_LOGIC_VECTOR (1 downto 0);
           SWP : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (1 downto 0);
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_P : out  STD_LOGIC;
           LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_NP_10BIT_SSUD_LCD;

architecture Behavioral of DEM_NP_10BIT_SSUD_LCD is
SIGNAL LCD_H0: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H1: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H2: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H3: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL RST, ENA_DB,ENA1HZ,ENA5HZ,ENA10HZ,ENA20HZ : STD_LOGIC;

SIGNAL BTNSS, BTNUD, ENA_SS, ENA_UD,ENA_UDN : STD_LOGIC;
SIGNAL DONVI,CHUC,TRAM,NGAN :  STD_LOGIC_VECTOR (3 DOWNTO 0);

SIGNAL S4TS: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL DEM: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL DV_TS,CH_TS: STD_LOGIC_VECTOR(3 DOWNTO 0);


begin
	RST   <= BTN(0);
	BTNSS <= BTN(1);
	BTNUD <= BTN(2);
	LCD_P    <= SWP;
	S4TS <= SW;
	ENA_UD <= NOT ENA_UDN;
	
	LED(0) <= ENA_SS;
	LED(1) <= ENA_UD;

	
IC1: ENTITY WORK.CHIA_10ENA
		PORT MAP ( 	CKHT => CKHT,
						ENA1HZ => ENA1HZ,
						ENA5HZ => ENA5HZ,
						ENA10HZ => ENA10HZ,
						ENA20HZ => ENA20HZ);
						
IC2: ENTITY WORK.HT_4TANSO
		PORT MAP ( 	ENA1HZ => ENA1HZ,
						ENA5HZ => ENA5HZ,
						ENA10HZ => ENA10HZ,
						ENA20HZ => ENA20HZ,
						ENA_DB => ENA_DB,
						DV_TS => DV_TS,
						CH_TS => CH_TS,
						S 		=> S4TS);

				 
IC3: ENTITY WORK.DEM_NP_10BIT_SSUD
		PORT MAP(CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					ENA_SS => ENA_SS,
					ENA_UD => ENA_UD,
					DEM => DEM);
					
IC4: ENTITY WORK.HEXTOBCD_10BIT
		PORT MAP( SOHEX10BIT => DEM,
					NGAN => NGAN,
					TRAM => TRAM,
					CHUC => CHUC,
					DONVI => DONVI);
					
IC5: ENTITY WORK.LCD_GAN_DULIEU_6SO
	PORT MAP( NGAN => NGAN,
				 TRAM => TRAM,
				 CHUC => CHUC,
				 DONVI => DONVI,
				 DV_TS => DV_TS,
				 CH_TS => CH_TS,
				 ENA_UD => ENA_UD,
				 ENA_SS => ENA_SS,
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);				
IC6: ENTITY WORK.LCD_KHOITAO_HIENTHI
	PORT MAP( RST   	=> RST,
	          CKHT  	=> CKHT,
				 LCD_DB	=> LCD_DB,
				 LCD_RS  => LCD_RS,
				 LCD_E   => LCD_E,
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);	
IC7: ENTITY WORK.DEM_1BIT_BTN
     PORT MAP( CKHT => CKHT,
	            RST => RST,
					BTN => BTNSS,
					Q => ENA_SS);
IC8: ENTITY WORK.DEM_1BIT_BTN
     PORT MAP( CKHT => CKHT,
	            RST => RST,
					BTN => BTNUD,
					Q => ENA_UDN);
end Behavioral;

