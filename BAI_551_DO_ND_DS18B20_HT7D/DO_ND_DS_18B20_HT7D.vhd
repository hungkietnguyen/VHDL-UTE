----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:26 04/17/2023 
-- Design Name: 
-- Module Name:    DO_ND_DS_18B20_HT7D - Behavioral 
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

entity DO_ND_DS_18B20_HT7D is
    Port ( SW0 : in  STD_LOGIC;
           CKHT : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           DS18B20 : inout  STD_LOGIC;
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0);
           CATHODE : out  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC_VECTOR (3 downto 0);
           TRIAC : out  STD_LOGIC);
end DO_ND_DS_18B20_HT7D;
architecture Behavioral of DO_ND_DS_18B20_HT7D is

SIGNAL DC_8LED : STD_LOGIC_VECTOR( 7 DOWNTO 0);
SIGNAL ENA_8LED : STD_LOGIC_VECTOR( 7 DOWNTO 0);

SIGNAL DONVI: STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL CHUC: STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL TRAM: STD_LOGIC_VECTOR( 3 DOWNTO 0);

SIGNAL N_DO_NG: STD_LOGIC_VECTOR( 7 DOWNTO 0);
SIGNAL N_DO_TP: STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL ENA1KHZ: STD_LOGIC;
SIGNAL RST: STD_LOGIC;
SIGNAL DS_PRE: STD_LOGIC;
SIGNAL NHIETDO : STD_LOGIC_VECTOR( 11 DOWNTO 0);
begin
    RST <= BTN0;
	 TRIAC <= SW0;
	 DC_8LED <=X"00" WHEN DS_PRE ='0' ELSE
	           X"FF";
				  
	 ENA_8LED( 7 DOWNTO 4) <="1111";
	 ENA_8LED(3) <='0';
	 ENA_8LED(2) <='0' WHEN TRAM=X"0" ELSE
	               '1';
	 ENA_8LED(1 DOWNTO 0) <= "11";
	 
	 N_DO_NG <= NHIETDO(11 DOWNTO 4);
	 N_DO_TP <= NHIETDO(3 DOWNTO 0);
	 LED <= N_DO_TP;
	 
IC1: ENTITY WORK.DS18B20_CONTROL
     PORT MAP( CKHT => CKHT,
	            RST => RST,
					DS18B20 => DS18B20,
					NHIETDO =>NHIETDO,
					DS_PRE => DS_PRE);
					
IC2: ENTITY WORK.CHIA_10ENA
     PORT MAP(CKHT => CKHT,
	           ENA1KHZ => ENA1KHZ);
				  
IC3: ENTITY WORK.HEXTOBCD_8BIT
     PORT MAP( SOHEX8BIT => N_DO_NG,
	            DONVI => DONVI,
					CHUC => CHUC,
					TRAM => TRAM);
					
IC4: ENTITY WORK.GM_HT_8LED
     PORT MAP( CKHT => CKHT,
	            ENA1KHZ => ENA1KHZ,
					ENA_8LED => ENA_8LED,
					DC_8LED => DC_8LED,
					LED70 => DONVI,
				   LED71 => CHUC,
				   LED72 => TRAM,
	            LED73 => X"0",
				   LED74 => X"8",
				   LED75 => X"1",
				   LED76 => X"5",
				   LED77 => X"D",
					SSEG => SSEG,
					CATHODE => CATHODE);
end Behavioral;

