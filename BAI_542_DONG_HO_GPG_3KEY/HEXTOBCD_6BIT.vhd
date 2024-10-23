----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:34 14/02/2023 
-- Design Name: 
-- Module Name:    HEXTOBCD_6BIT - Behavioral 
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

entity HEXTOBCD_6BIT is
    Port ( SOHEX6BIT : in  STD_LOGIC_VECTOR (5 downto 0);
           DONVI, CHUC : out  STD_LOGIC_VECTOR (3 downto 0));
end HEXTOBCD_6BIT;

architecture Behavioral of HEXTOBCD_6BIT is

begin
 PROCESS(SOHEX6BIT)
 VARIABLE BCD_HEX: STD_LOGIC_VECTOR(13 DOWNTO 0);
 VARIABLE DEM: INTEGER RANGE 0 TO 5;
 BEGIN
  BCD_HEX:= "00000000" & SOHEX6BIT;
  DEM:= 5;
  WHILE DEM >0
  LOOP 
  BCD_HEX:= BCD_HEX(12 DOWNTO 0) & '0';
  DEM:=DEM -1 ;
  IF BCD_HEX(9 DOWNTO 6)>= "0101" THEN
     BCD_HEX(9 DOWNTO 6):= BCD_HEX(9 DOWNTO 6) + "0011";
	END IF;
  END LOOP;
  BCD_HEX:= BCD_HEX(12 DOWNTO 0) & '0';
  DONVI  <= BCD_HEX(9 DOWNTO 6);
  CHUC <= BCD_HEX(13 DOWNTO 10); 
 END PROCESS;

end Behavioral;

