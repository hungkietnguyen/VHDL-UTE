----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:12 04/05/2023 
-- Design Name: 
-- Module Name:    DO_ND_DS18B20_DEM_NP_8BIT_HT7D - Behavioral 
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

entity DO_ND_DS18B20_DEM_NP_8BIT_HT7D is
		port(ckht : in  STD_LOGIC;
           DS18B20 : inout  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (2 downto 0);
           SW : in  STD_LOGIC_VECTOR (2 downto 0);
           TRIAC : out  STD_LOGIC;
           BELL : out  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (5 downto 0);
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0);
           CATHODE : out  STD_LOGIC_VECTOR (7 downto 0));
end DO_ND_DS18B20_DEM_NP_8BIT_HT7D;

architecture Behavioral of DO_ND_DS18B20_DEM_NP_8BIT_HT7D is
SIGNAL NHIETDO : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL NDO_NG : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL NDO_TP : STD_LOGIC_VECTOR(3 DOWNTO 0);

SIGNAL ND_DV, ND_CH, ND_TR: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DS_PRE, RST: STD_LOGIC;

SIGNAL ENA_DB, ENA1HZ, ENA5HZ, ENA10HZ, ENA20HZ,ENA1KHZ: STD_LOGIC;
SIGNAL BTNSS,BTNUD, ENA_SS,ENA_UD: STD_LOGIC;
SIGNAL DEM   :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL DONVI,CHUC,TRAM :  STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL DC_8LED,ENA_8LED :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL ENA2B: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL S4TS: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL DV_TS,CH_TS: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL NDO_SS: STD_LOGIC_VECTOR(5 DOWNTO 0):="011010";
BEGIN
		RST  	<= BTN(0);
	   BTNSS <= BTN(1);
		BTNUD <= BTN(2);
		S4TS  <= SW(1 DOWNTO 0);
		TRIAC <= SW(2);
		
	   LED(4) <= ENA_SS;
		LED(5) <= ENA_UD;
		
		DC_8LED <= X"00" WHEN DS_PRE ='0' ELSE X"FF";
		ENA_8LED(7 DOWNTO 6) <= "11";
		ENA_8LED(5 DOWNTO 3) <= ENA2B & '1';
		ENA_8LED(2) <= '0' WHEN ND_TR= X"0" ELSE '1';
		ENA_8LED(1 DOWNTO 0) <= "11";
		
		NDO_NG <= NHIETDO(11 DOWNTO 4);
		NDO_TP <= NHIETDO(3 DOWNTO 0);
		LED(3 DOWNTO 0) <= NDO_TP;

		NDO_SS <= "100101";
		BELL <= '1' WHEN NDO_NG > NDO_SS ELSE '0';

IC1: ENTITY WORK.HEXTOBCD_8BIT
		PORT MAP( SOHEX8BIT => DEM,
					TRAM => TRAM,
					CHUC => CHUC,
					DONVI => DONVI);
					
IC2: ENTITY WORK.DEM_1BIT_BTN
		PORT MAP( CKHT => CKHT,
					RST => RST,
					BTN => BTNSS,
					Q => ENA_SS);

IC3: ENTITY WORK.DEM_1BIT_BTN
		PORT MAP( CKHT => CKHT,
					RST => RST,
					BTN => BTNUD,
					Q => ENA_UD);	
					
IC4: ENTITY WORK.XOA_SO_0_VN
		PORT MAP( ENA2B => ENA2B,
					TRAM => TRAM,
					CHUC => CHUC);
					
IC5: ENTITY WORK.HT_4TANSO
		PORT MAP ( 	ENA1HZ => ENA1HZ,
						ENA5HZ => ENA5HZ,
						ENA10HZ => ENA10HZ,
						ENA20HZ => ENA20HZ,
						ENA_DB => ENA_DB,
						DV_TS => DV_TS,
						CH_TS => CH_TS,
						S 		=> S4TS);

IC6: ENTITY WORK.CHIA_10ENA
		PORT MAP ( 	CKHT => CKHT,
						ENA1HZ => ENA1HZ,
						ENA5HZ => ENA5HZ,
						ENA10HZ => ENA10HZ,
						ENA20HZ => ENA20HZ,
						ENA1KHZ => ENA1KHZ);
						
IC7: ENTITY WORK.DEM_NP_8BIT_SSUD
		PORT MAP(CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					ENA_SS => ENA_SS,
					ENA_UD => ENA_UD,
					DEM => DEM);	
					
IC8: ENTITY WORK.DS18B20_CONTROL
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 DS18B20 => DS18B20,
				 NHIETDO => NHIETDO,
				 DS_PRE	=> DS_PRE);
				 
IC9: ENTITY WORK.HEXTOBCD_8BIT
		PORT MAP( SOHEX8BIT => NDO_NG,
					TRAM => ND_TR,
					CHUC => ND_CH,
					DONVI => ND_DV);
					
IC10: ENTITY WORK.GM_HT_8LED
		PORT MAP(CKHT => CKHT,
					ENA1KHZ => ENA1KHZ,
					 LED70 => ND_DV,
					 LED71 => ND_CH,
					 LED72 => ND_TR,
					 LED73 => DONVI,
					 LED74 => CHUC,
					 LED75 => TRAM,
					 LED76 => DV_TS,
					 LED77 => CH_TS,
					 CATHODE => CATHODE,
					 SSEG => SSEG,
					 DC_8LED => DC_8LED,
					 ENA_8LED => ENA_8LED);	

end Behavioral;

