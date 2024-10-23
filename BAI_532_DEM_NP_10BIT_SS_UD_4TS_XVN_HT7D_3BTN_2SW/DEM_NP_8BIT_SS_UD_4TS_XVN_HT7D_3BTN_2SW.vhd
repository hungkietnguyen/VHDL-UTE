----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:04:15 03/25/2023 
-- Design Name: 
-- Module Name:    DEM_NP_8BIT_SS_UD_4TS_XVN_HT7D_3BTN_2W - Behavioral 
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

entity DEM_NP_8BIT_SS_UD_4TS_XVN_HT7D_3BTN_2SW is
    Port ( CKHT : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (2 downto 0);
           SW : in  STD_LOGIC_VECTOR (1 downto 0);
           LED : out  STD_LOGIC_VECTOR (1 downto 0);
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0);
           CATHODE : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_NP_8BIT_SS_UD_4TS_XVN_HT7D_3BTN_2SW;

architecture Behavioral of DEM_NP_8BIT_SS_UD_4TS_XVN_HT7D_3BTN_2SW is
SIGNAL ENA_DB, ENA1HZ, ENA5HZ, ENA10HZ, ENA20HZ,ENA1KHZ, RST: STD_LOGIC;
SIGNAL BTNSS,BTNUD, ENA_SS,ENA_UD: STD_LOGIC;
SIGNAL DEM   :  STD_LOGIC_VECTOR (9 DOWNTO 0);
SIGNAL DONVI,CHUC,TRAM,NGAN :  STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL DC_8LED,ENA_8LED :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL ENA2B: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL S4TS: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL DV_TS,CH_TS: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
		RST  	<= BTN(0);
	   BTNSS <= BTN(1);
		BTNUD <= BTN(2);
		S4TS  <= SW;
		
	   LED(0) <= ENA_SS;
		LED(1) <= ENA_UD;
		
		DC_8LED <= X"00";
		ENA_8LED <= "11000" & ENA2B & '1';

IC1: ENTITY WORK.XOA_SO_0_VN
		PORT MAP( ENA2B => ENA2B,
					TRAM => TRAM,
					CHUC => CHUC);
					
IC2: ENTITY WORK.HT_4TANSO
		PORT MAP ( 	ENA1HZ => ENA1HZ,
						ENA5HZ => ENA5HZ,
						ENA10HZ => ENA10HZ,
						ENA20HZ => ENA20HZ,
						ENA_DB => ENA_DB,
						DV_TS => DV_TS,
						CH_TS => CH_TS,
						S 		=> S4TS);

IC3: ENTITY WORK.CHIA_10ENA
		PORT MAP ( 	CKHT => CKHT,
						ENA1HZ => ENA1HZ,
						ENA5HZ => ENA5HZ,
						ENA10HZ => ENA10HZ,
						ENA20HZ => ENA20HZ,
						ENA1KHZ => ENA1KHZ);
						
IC4: ENTITY WORK.DEM_NP_10BIT_SSUD
		PORT MAP(CKHT => CKHT,
					RST => RST,
					ENA_DB => ENA_DB,
					ENA_SS => ENA_SS,
					ENA_UD => ENA_UD,
					DEM => DEM);	
					
IC5: ENTITY WORK.GM_HT_8LED
		PORT MAP(CKHT => CKHT,
					ENA1KHZ => ENA1KHZ,
				    DC_8LED => DC_8LED,
					 ENA_8LED => ENA_8LED,
					 CATHODE => CATHODE,
					 SSEG => SSEG,
					 LED70 => DONVI,
					 LED71 => CHUC,
					 LED72 => TRAM,
					 LED73 => NGAN,
					 LED74 => X"4",
					 LED75 => X"5",
					 LED76 => DV_TS,
					 LED77 => CH_TS);					
IC6: ENTITY WORK.DEM_1BIT_BTN
		PORT MAP( CKHT => CKHT,
					RST => RST,
					BTN => BTNSS,
					Q => ENA_SS);
IC7: ENTITY WORK.DEM_1BIT_BTN
		PORT MAP( CKHT => CKHT,
					RST => RST,
					BTN => BTNUD,
					Q => ENA_UD);		
IC8: ENTITY WORK.HEXTOBCD_10BIT
		PORT MAP( SOHEX10BIT => DEM,
					NGAN => NGAN,
					TRAM => TRAM,
					CHUC => CHUC,
					DONVI => DONVI);

end Behavioral;

