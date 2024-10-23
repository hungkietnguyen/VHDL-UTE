----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:52:41 03/15/2023 
-- Design Name: 
-- Module Name:    DEM_3SO_SS_UD_XVN_HT7D_4BTN_4TTD - Behavioral 
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

entity DEM_3SO_SS_UD_XVN_HT7D_4BTN_4TTD is
    Port ( CKHT : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (3 downto 0);
           LED : out  STD_LOGIC_VECTOR (3 downto 0);
           CATHODE : out  STD_LOGIC_VECTOR (7 downto 0);
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_3SO_SS_UD_XVN_HT7D_4BTN_4TTD;

architecture Behavioral of DEM_3SO_SS_UD_XVN_HT7D_4BTN_4TTD is

SIGNAL ENA_DB,RST,ENA1HZ, ENA5HZ,ENA10HZ,ENA20HZ, ENA1KHZ: STD_LOGIC;
SIGNAL DONVI, CHUC,TRAM: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DC_8LED , ENA_8LED : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ENA2B,S4TS,TTDK: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL DV_TS, CH_TS: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BTNDK, ENA_SS,ENA_UD,BTN_UP,BTN_DW: STD_LOGIC;
begin
	RST <= BTN(0);
	BTNDK <= BTN(1);
	BTN_UP <= BTN(2);
	BTN_DW <= BTN(3);
	
	LED(0) <= ENA_SS;
	LED(1) <= ENA_UD;
	LED(2) <= S4TS(0);
	LED(3) <= S4TS(1);
	
	DC_8LED <= X"00";
	ENA_8LED <= "11000"& ENA2B &  '1';
	
	ENA_SS <= TTDK(0);
	ENA_UD <= NOT TTDK(1);
	
IC1:ENTITY WORK.XOA_SO_0_VN
	PORT MAP( ENA2B => ENA2B,
				 TRAM => TRAM,
				 CHUC => CHUC);
				 

IC2: ENTITY WORK.CHIA_10ENA
	PORT MAP( CKHT => CKHT,
				 ENA1HZ => ENA1HZ,
				 ENA5HZ => ENA5HZ,
				 ENA10HZ => ENA10HZ,
				 ENA20HZ => ENA20HZ,
				 ENA1KHZ => ENA1KHZ);	
				 
IC3: ENTITY WORK.HT_4TANSO
	PORT MAP( ENA_DB => ENA_DB,
				 ENA1HZ => ENA1HZ,
				 ENA5HZ => ENA5HZ,
				 ENA10HZ => ENA10HZ,
				 ENA20HZ => ENA20HZ,
				 DV_TS => DV_TS,
				 CH_TS => CH_TS,
				 S => S4TS);
				 				 
	
IC4: ENTITY WORK.DEM_2BIT_BTN
		PORT MAP( CKHT => CKHT,
					 RST => RST,
					 BTN => BTNDK,
					 Q => TTDK);
IC5: ENTITY WORK.DEM_2BIT_UP_DW_2BTN
		PORT MAP( CKHT => CKHT,
					 RST => RST,
					 BTN_UP => BTN_UP,
					 BTN_DW => BTN_DW,
					 Q => S4TS);

IC6: ENTITY WORK.DEM_3SO_SSUD
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 ENA_DB => ENA_DB,
				 ENA_SS => ENA_SS,
				 ENA_UD => ENA_UD,
				 DONVI => DONVI,
				 CHUC  => CHUC,
				 TRAM  => TRAM);
				 
IC7: ENTITY WORK.GM_HT_8LED
	PORT MAP( CKHT => CKHT,
				 ENA1KHZ => ENA1KHZ,
				 LED70 => DONVI,
				 LED71 => CHUC,
				 LED72 => TRAM,
	          LED73 => X"3",
				 LED74 => X"4",
				 LED75 => X"5",
				 LED76 => DV_TS,
				 LED77 => CH_TS,
				 DC_8LED => DC_8LED,
				 ENA_8LED => ENA_8LED,
				 
				 SSEG => SSEG,
				 CATHODE => CATHODE);

end Behavioral;

