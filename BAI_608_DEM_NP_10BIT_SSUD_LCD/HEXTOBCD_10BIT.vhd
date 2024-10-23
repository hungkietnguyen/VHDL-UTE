----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:49:30 14/02/2023 
-- Design Name: 
-- Module Name:    HEXTOBCD_8BIT - Behavioral 
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
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity HEXTOBCD_10BIT is
    Port ( SOHEX10BIT : in  STD_LOGIC_VECTOR (9 downto 0);
           DONVI,CHUC,TRAM,NGAN : out  STD_LOGIC_VECTOR (3 downto 0));
end HEXTOBCD_10BIT;

architecture Behavioral of HEXTOBCD_10BIT is

begin
PROCESS(SOHEX10BIT)
VARIABLE BCD_HEX:STD_LOGIC_VECTOR(25 DOWNTO 0);
VARIABLE DEM:INTEGER RANGE 0 TO 9;
BEGIN
BCD_HEX:="0000000000000000"&SOHEX10BIT;
DEM:=9;

WHILE DEM>0
LOOP
BCD_HEX:=BCD_HEX(24 DOWNTO 0)&'0';
DEM:=DEM-1;
IF BCD_HEX(13 DOWNTO 10)>="0101" THEN
   BCD_HEX(13 DOWNTO 10):=BCD_HEX(13 DOWNTO 10) + "0011";
	END IF;
	
	IF BCD_HEX(17 DOWNTO 14)>="0101" THEN
    BCD_HEX(17 DOWNTO 14):=BCD_HEX(17 DOWNTO 14) + "0011";
	END IF;
	IF BCD_HEX(21 DOWNTO 18)>="0101" THEN
    BCD_HEX(21 DOWNTO 18):=BCD_HEX(21 DOWNTO 18) + "0011";
	END IF;
	END LOOP;
	BCD_HEX:=BCD_HEX(24 DOWNTO 0)&'0';
	DONVI<=BCD_HEX(13 DOWNTO 10);
	CHUC<=BCD_HEX(17 DOWNTO 14);
	TRAM<=BCD_HEX(21 DOWNTO 18);
	NGAN<=BCD_HEX(25 DOWNTO 22);
	END PROCESS;
end Behavioral;

