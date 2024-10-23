----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:29:31 03/23/2023 
-- Design Name: 
-- Module Name:    DEM_CAI_GHAN_2SO_HT7D_2BTN_UD - Behavioral 
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

entity DEM_CAI_GHAN_2SO_HT7D_2BTN_UD is
    Port ( CKHT,SW0 : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (5 downto 0);
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0);
			  BELL : out  STD_LOGIC;
			  LED : out  STD_LOGIC_VECTOR (1 downto 0);
           CATHODE : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_CAI_GHAN_2SO_HT7D_2BTN_UD;

architecture Behavioral of DEM_CAI_GHAN_2SO_HT7D_2BTN_UD is
SIGNAL ENA_DB, ENA1HZ, ENA5HZ,ENA1KHZ,RST: STD_LOGIC;

SIGNAL RST_GH,BTN_UP,BTN_DW,ENA_UP,ENA_DW,ENA_SS,ENA_UD,XK_BELL : STD_LOGIC;
SIGNAL DC_8LED, ENA_8LED : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DV_GH,CH_GH: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DONVI, CHUC: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL G_HAN: STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
	RST_GH <= BTN(0);
	RST <= BTN(3);
	BTN_UP <= BTN(1);
	BTN_DW <= BTN(2);
	
	LED(0) <= ENA_SS;
	LED(1) <= ENA_UD;
	
	DC_8LED <= X"00";
	ENA_8LED(1 DOWNTO 0) <= "01" WHEN CHUC =X"0" ELSE "11";
	ENA_8LED(7 DOWNTO 2) <= "001100";
	
	ENA_DB <= ENA1HZ WHEN SW0='0' ELSE 
				 ENA5HZ;

IC1: ENTITY WORK.CHIA_10ENA
	PORT MAP( CKHT => CKHT,
				 ENA1HZ => ENA1HZ,
				 ENA5HZ => ENA5HZ,
				 ENA1KHZ => ENA1KHZ);
			 
IC2: ENTITY WORK.DEBOUNCE_BTN
	PORT MAP(CKHT => CKHT,
				BTN => BTN_UP,
				DB_TICK => ENA_UP);
				
IC3: ENTITY WORK.DEBOUNCE_BTN
	PORT MAP(CKHT => CKHT,
				BTN => BTN_DW,
				DB_TICK => ENA_DW);	
				
IC4: ENTITY WORK.CAI_GHAN_2SO	
	PORT MAP(CKHT => CKHT,
				RST_GH => RST_GH,
				ENA_DB => ENA_DB,
				ENA_UP => ENA_UP,
				ENA_DW => ENA_DW,
				DONVI => DV_GH,
				CHUC  => CH_GH);	
				
IC5: ENTITY WORK.DEM_2SO_SSUD
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 G_HAN => G_HAN,
				 X_TICK => XK_BELL,
				 ENA_DB => ENA_DB,
				 ENA_SS => ENA_SS,
				 ENA_UD => ENA_UD,
				 DONVI => DONVI,
				 CHUC  => CHUC);
				 
IC6: ENTITY WORK.GM_HT_8LED
	PORT MAP( CKHT => CKHT,
				 ENA1KHZ => ENA1KHZ,
				 LED70 => DONVI,
				 LED71 => CHUC,
				 LED72 => X"2",
	          LED73 => X"3",
				 LED74 => DV_GH,
				 LED75 => CH_GH,
				 LED76 => x"6",
				 LED77 => X"7",
				 DC_8LED => DC_8LED,
				 ENA_8LED => ENA_8LED,
				 SSEG => SSEG,
				 CATHODE => CATHODE);
				 
IC7: ENTITY WORK.DEM_1BIT_BTN
     PORT MAP( CKHT => CKHT,
	            RST => BTN(3),
					BTN => BTN(4),
					Q => ENA_SS);	
					
IC8: ENTITY WORK.DEM_1BIT_BTN
     PORT MAP( CKHT => CKHT,
	            RST => BTN(3),
					BTN => BTN(5),
					Q => ENA_UD);		
IC9: ENTITY WORK.BELL_BIP
     PORT MAP( CKHT => CKHT,
	            RST => RST_GH,
					TG_BIP =>ENA5HZ,
					XK_BELL => XK_BELL,
					BELL => BELL);		
 G_HAN <= CH_GH & DV_GH;					
end Behavioral;

