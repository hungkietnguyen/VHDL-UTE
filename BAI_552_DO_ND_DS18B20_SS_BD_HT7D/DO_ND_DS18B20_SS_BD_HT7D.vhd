----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:05:38 04/05/2023 
-- Design Name: 
-- Module Name:    DO_ND_DS18B20_SS_BD_HT7D - Behavioral 
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

entity DO_ND_DS18B20_SS_BD_HT7D is
		Port ( CKHT : in  STD_LOGIC;
           DS18B20 : inout  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           SW0 : in  STD_LOGIC;
           TRIAC : out  STD_LOGIC;
           BELL : out  STD_LOGIC;
           LED: out  STD_LOGIC_VECTOR (3 downto 0);
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0);
           CATHODE : out  STD_LOGIC_VECTOR (7 downto 0));
end DO_ND_DS18B20_SS_BD_HT7D;

architecture Behavioral of DO_ND_DS18B20_SS_BD_HT7D is
SIGNAL DC_8LED, ENA_8LED, NDO_NG: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL NHIETDO : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL NDO_TP : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL GH_ND : STD_LOGIC_VECTOR(5 DOWNTO 0):="100011";
SIGNAL GH_DV : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL GH_CH : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ND_DV, ND_CH, ND_TR: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RST, DS_PRE, ENA1KHZ: STD_LOGIC;
BEGIN
	RST <=BTN0;
	TRIAC <= SW0;
	DC_8LED <= X"00" WHEN DS_PRE ='0' ELSE 
					X"FF";
	
	ENA_8LED(7 DOWNTO 3) <= "11000";
	
	ENA_8LED(2) <= '0' WHEN ND_TR = X"0" ELSE '1';
	ENA_8LED(1 DOWNTO 0) <= "11";
  
	NDO_NG <= NHIETDO(11 DOWNTO 4);
	NDO_TP <= NHIETDO(3 DOWNTO 0);
	LED <= NDO_TP;

	GH_ND <= "011110";
	BELL <= '1' WHEN NDO_NG > ("00" & GH_ND) ELSE '0';
	
IC1: ENTITY WORK.DS18B20_CONTROL
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 DS18B20 => DS18B20,
				 NHIETDO => NHIETDO,
				 DS_PRE	=> DS_PRE);

IC2: ENTITY WORK.CHIA_10ENA
	PORT MAP( CKHT => CKHT,
				 ENA1KHZ => ENA1KHZ);
				 
IC3: ENTITY WORK.HEXTOBCD_8BIT
	PORT MAP(SOHEX8BIT => NDO_NG,
				DONVI		=> ND_DV,
				CHUC		=> ND_CH,
				TRAM		=> ND_TR);
				
IC4: ENTITY WORK.GM_HT_8LED
		PORT MAP(CKHT => CKHT,
					ENA1KHZ => ENA1KHZ,
					 LED70 => ND_DV,
					 LED71 => ND_CH,
					 LED72 => ND_TR,
					 LED73 => X"0",
					 LED74 => X"0",
					 LED75 => X"0",
					 LED76 => GH_DV,
					 LED77 => GH_CH,
					 CATHODE => CATHODE,
					 SSEG => SSEG,
					 DC_8LED => DC_8LED,
					 ENA_8LED => ENA_8LED);
IC5: ENTITY WORK.HEXTOBCD_6BIT
		PORT MAP(SOHEX6BIT => GH_ND,
					DONVI		 => GH_DV,
					CHUC 		 => GH_CH);


end Behavioral;

