----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:11 03/02/2023 
-- Design Name: 
-- Module Name:    DEM_000_999_HT_7DOAN - Behavioral 
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

entity DEM_000_999_HT_7DOAN is
    Port ( CKHT : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           SW0 : in  STD_LOGIC;
           SSEG : out  STD_LOGIC_VECTOR (6 downto 0);
           CATHODE  : out  STD_LOGIC_VECTOR (2 downto 0));
end DEM_000_999_HT_7DOAN;

architecture Behavioral of DEM_000_999_HT_7DOAN is
SIGNAL ENA_DB,ENA1KHZ, RST: STD_LOGIC;
SIGNAL DONVI,CHUC,TRAM,SO_GMA: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL S2B : STD_LOGIC_VECTOR(1 DOWNTO 0);
begin
	RST <= BTN0;
IC1: ENTITY WORK.CHIA_10ENA
		PORT MAP ( CKHT => CKHT,
					  ENA20HZ => ENA_DB,
					  ENA1KHZ => ENA1KHZ);
					  
IC2: ENTITY WORK.DEM_3SO
		PORT MAP ( CKHT => CKHT,
					  ENA_DB => ENA_DB,
					  RST => RST,
					  ENA_SS => SW0,
					  DONVI => DONVI,
					  CHUC => CHUC,
					  TRAM => TRAM);
IC3: ENTITY WORK.DAHOP_3KENH
		PORT MAP ( I0=> DONVI,
					  I1 => CHUC,
					  I2 => TRAM,
					  S => S2B,
					  O => SO_GMA);					  					  
					  
IC4: ENTITY WORK.DEM_2BIT
		PORT MAP ( CKHT => CKHT,
					  Q => S2B,
					  ENA1KHZ => ENA1KHZ);		
IC5: ENTITY WORK.GIAIMA_23H
		PORT MAP ( I => S2B,
					  O => CATHODE);	
					  
IC6: ENTITY WORK.GIAIMA_7DOAN
		PORT MAP ( SO_GMA => SO_GMA,
					  SSEG => SSEG);	
					  					  
end Behavioral;

