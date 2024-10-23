----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:00:13 03/16/2023 
-- Design Name: 
-- Module Name:    DEM_UD_AU_00_99_HT_7DOAN - Behavioral 
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

entity DEM_UD_AU_00_99_HT_7DOAN is
    Port ( CKHT : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           SW0 : in  STD_LOGIC;
           LED0 : out  STD_LOGIC;
           CATHODE : out  STD_LOGIC_VECTOR (7 downto 0);
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_UD_AU_00_99_HT_7DOAN;

architecture Behavioral of DEM_UD_AU_00_99_HT_7DOAN is
SIGNAL ENA_DB,ENA_SS,ENA_UD,RST, ENA5HZ, ENA1KHZ: STD_LOGIC;
SIGNAL DONVI, CHUC: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DC_8LED , ENA_8LED,QD : STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
	RST <= BTN0;
	LED0 <= ENA_SS;

	
	DC_8LED <= X"00";
	ENA_8LED(1 DOWNTO 0) <= "01" WHEN CHUC =X"0" ELSE "11";
	ENA_8LED( 7 DOWNTO 2) <= "000000" ;
	
	QD <= CHUC & DONVI;
	ENA_SS <='1' WHEN ENA_UD='1' ELSE '0';
	
IC1: ENTITY WORK.CHIA_10ENA
	PORT MAP( CKHT => CKHT,
				 ENA5HZ => ENA_DB,
				 ENA1KHZ => ENA1KHZ);
				 
IC2: ENTITY WORK.DEM_2SO_SSUD
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 ENA_DB => ENA_DB,
				 ENA_SS => SW0,
				 ENA_UD => ENA_UD,
				 DONVI => DONVI,
				 CHUC  => CHUC);
IC3: ENTITY WORK.AUTO_DAO_ENA_UD
	PORT MAP(CKHT=> CKHT,
				RST => RST,
				ENA_UD => ENA_UD,
				Q      => QD);
IC4: ENTITY WORK.GM_HT_8LED
	PORT MAP( CKHT => CKHT,
				 ENA1KHZ => ENA1KHZ,
				 LED70 => DONVI,
				 LED71 => CHUC,
				 LED72 => X"2",
	          LED73 => X"3",
				 LED74 => X"4",
				 LED75 => X"5",
				 LED76 => x"6",
				 LED77 => X"7",
				 DC_8LED => DC_8LED,
				 ENA_8LED => ENA_8LED,
				 
				 SSEG => SSEG,
				 CATHODE => CATHODE);				 
end Behavioral;

