----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:20:06 04/14/2023 
-- Design Name: 
-- Module Name:    DEM_2SO_HT_LCD_SO_TO - Behavioral 
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

entity DEM_2SO_HT_LCD_SO_TO is
    Port ( CKHT : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (1 downto 0);
           SWP : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (2 downto 0);
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_P : out  STD_LOGIC;
           LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_2SO_HT_LCD_SO_TO;

architecture Behavioral of DEM_2SO_HT_LCD_SO_TO is
SIGNAL LCD_H0: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H1: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H2: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H3: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL RST, ENA_DB,ENA1HZ,ENA5HZ,ENA10HZ,ENA20HZ : STD_LOGIC;

SIGNAL BTNSS, BTNUD, ENA_SS, ENA_UD,ENA_UDN : STD_LOGIC;
SIGNAL DONVI, CHUC : STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL MST_DV, MST_CH: STD_LOGIC_VECTOR( 47 DOWNTO 0);


begin
	LCD_P <= SWP;
	RST <= BTN(0);
	BTNSS <= BTN(1);
	BTNUD <= BTN(2);
	
	ENA_UD <= NOT ENA_UDN;
	
	WITH SW SELECT
	ENA_DB <= ENA1HZ WHEN "00",
				 ENA5HZ WHEN "01",
				 ENA10HZ WHEN "10",
				 ENA20HZ WHEN OTHERS;
				 
IC1: ENTITY WORK.CHIA_10ENA
		PORT MAP ( 	CKHT => CKHT,
						ENA1HZ => ENA1HZ,
						ENA5HZ => ENA5HZ,
						ENA10HZ => ENA10HZ,
						ENA20HZ => ENA20HZ);
						
IC2: ENTITY WORK.DEM_1BIT_BTN
     PORT MAP( CKHT => CKHT,
	            RST => RST,
					BTN => BTNSS,
					Q => ENA_SS);
					
IC3: ENTITY WORK.DEM_1BIT_BTN
     PORT MAP( CKHT => CKHT,
	            RST => RST,
					BTN => BTNUD,
					Q => ENA_UDN);
					
IC4: ENTITY	WORK.DEM_2SO_SSUD
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 ENA_DB => ENA_DB,
				 ENA_SS => ENA_SS,
				 ENA_UD => ENA_UD,
				 DONVI => DONVI,
				 CHUC => CHUC);
				 
IC5: ENTITY WORK.LCD_GIAI_MA_SO_TO	
		PORT MAP(SO_NHO => DONVI,
					SO_TO  => MST_DV);
					
IC6: ENTITY WORK.LCD_GIAI_MA_SO_TO	
		PORT MAP(SO_NHO => CHUC,
					SO_TO  => MST_CH);	
					
IC7: ENTITY WORK.LCD_GAN_DULIEU_2SO_TO
	PORT MAP( MST_DV => MST_DV,
				 MST_CH => MST_CH,
				 ENA_SS => ENA_SS,
				 ENA_UD => ENA_UD,
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

