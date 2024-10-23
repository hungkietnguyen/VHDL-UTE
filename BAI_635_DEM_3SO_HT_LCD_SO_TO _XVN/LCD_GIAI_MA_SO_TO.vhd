----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:47:19 04/07/2023 
-- Design Name: 
-- Module Name:    LCD_GIAI_MA_SO_TO - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LCD_GIAI_MA_SO_TO is
    Port ( SO_NHO : in  STD_LOGIC_VECTOR (3 downto 0);
           SO_TO : out  STD_LOGIC_VECTOR (47 downto 0));
end LCD_GIAI_MA_SO_TO;

architecture Behavioral of LCD_GIAI_MA_SO_TO is

TYPE MA8DOAN_TB IS ARRAY(INTEGER RANGE 0 TO 59) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
CONSTANT MA8DOAN: MA8DOAN_TB:=(
   X"00",X"01",X"02",X"04",X"03",X"05",--0
	X"01",X"02",X"20",X"03",X"07",X"03",--1
	X"06",X"06",X"02",X"04",X"03",X"03",--2
	X"06",X"06",X"02",X"03",X"03",X"05",--3
	X"07",X"03",X"07",X"20",X"20",X"07",--4
	
	X"07",X"06",X"06",X"03",X"03",X"05",--5
	X"00",X"06",X"06",X"04",X"03",X"05",--6
	X"01",X"01",X"07",X"20",X"20",X"07",--7
	X"00",X"06",X"02",X"04",X"03",X"05",--8
	X"00",X"06",X"02",X"03",X"03",X"05");--9

TYPE MA_SO_TO IS ARRAY(INTEGER RANGE 0 TO 5) OF STD_LOGIC_VECTOR( 7 DOWNTO 0);
SIGNAL MST: MA_SO_TO;

begin
	PROCESS(SO_NHO)
	BEGIN
		FOR I IN 0 TO 5
		LOOP 	
			MST(I)   <= MA8DOAN(CONV_INTEGER(SO_NHO)*6+I);
			END LOOP;
		END PROCESS;
		
			SO_TO(47 DOWNTO 40)   <= MST(0);
			SO_TO(39 DOWNTO 32)   <= MST(1);
			SO_TO(31 DOWNTO 24)   <= MST(2);
			SO_TO(23 DOWNTO 16)   <= MST(3);
			SO_TO(15 DOWNTO 8)   <= MST(4);
			SO_TO(7 DOWNTO  0)   <= MST(5);
			
			
end Behavioral;
