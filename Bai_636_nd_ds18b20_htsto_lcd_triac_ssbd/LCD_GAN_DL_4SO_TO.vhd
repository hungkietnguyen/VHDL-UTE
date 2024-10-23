----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:09:56 05/19/2023 
-- Design Name: 
-- Module Name:    LCD_GAN_DL_4SO_TO - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LCD_GAN_DL_4SO_TO is
    Port ( MST_NDDVDS : in  STD_LOGIC_VECTOR (47 downto 0);
           MST_NDCHDS : in  STD_LOGIC_VECTOR (47 downto 0);
           MST_NDDVGH : in  STD_LOGIC_VECTOR (47 downto 0);
           MST_NDCHGH : in  STD_LOGIC_VECTOR (47 downto 0);
           ND_TP : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_TR : in  STD_LOGIC_VECTOR (3 downto 0);
           DS_PRE : in  STD_LOGIC;
           LCD_H0 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H1 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H2 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H3 : out  STD_LOGIC_VECTOR (159 downto 0));
end LCD_GAN_DL_4SO_TO;

architecture Behavioral of LCD_GAN_DL_4SO_TO is
SIGNAL TP: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL YN: STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
	PROCESS(ND_TP)
	BEGIN
		CASE ND_TP IS
			WHEN "0010"|"0001" => TP <= "0001"; --0.1
			WHEN "0100"|"0011" => TP <= "0010"; --0.2
			WHEN "0110"|"0101" => TP <= "0011"; --0.3
			WHEN "0111"			 => TP <= "0100"; --0.4
			WHEN "1000"|"1001" => TP <= "0101"; --0.5
			WHEN "1010"|"1011" => TP <= "0110"; --0.6
			WHEN "1100"|"1101" => TP <= "0111"; --0.7
			WHEN "1110"			 => TP <= "1000"; --0.8
			WHEN "1111"			 => TP <= "1001"; --0.9
			WHEN OTHERS			 => TP <= "0000"; --0.0
		END CASE;
	END PROCESS;
	PROCESS(DS_PRE)
	BEGIN
		IF DS_PRE = '0' THEN
--			SS3 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('S'),8);
--			YN2 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('Y'),8);
--			YN1 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('E'),8);
			YN <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('Y'),8);
		ELSE
--			SS3 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('R'),8);
--			YN2 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('N'),8);
--			YN1 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8);
			YN <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('N'),8);
		END IF;
	END PROCESS;

-- HANG0
	 LCD_H0( 7 DOWNTO 0)     <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('D'),8);
	 LCD_H0(15 DOWNTO 8)   	 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8);
	 LCD_H0(23 DOWNTO 16)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H0(31 DOWNTO 24)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('N'),8);
	 LCD_H0(39 DOWNTO 32)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8);
	 LCD_H0(47 DOWNTO 40)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('I'),8);
	 LCD_H0(55 DOWNTO 48)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('E'),8);
	 LCD_H0(63 DOWNTO 56)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('T'),8);
	 LCD_H0(71 DOWNTO 64)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H0(79 DOWNTO 72)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('D'),8);
	 LCD_H0(87 DOWNTO 80)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8);
	 LCD_H0(95 DOWNTO 88)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H0(103 DOWNTO 96)   <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('D'),8);
	 LCD_H0(111 DOWNTO 104)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('S'),8);
	 LCD_H0(119 DOWNTO 112)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8);
	 LCD_H0(127 DOWNTO 120)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('8'),8);
	 LCD_H0(135 DOWNTO 128)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('B'),8);
	 LCD_H0(143 DOWNTO 136)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('2'),8);
	 LCD_H0(151 DOWNTO 144)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('0'),8);
	 LCD_H0(159 DOWNTO 152)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 
--HANG1
	 LCD_H1(7 DOWNTO 0)      <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('V'),8);
	 LCD_H1(15 DOWNTO 8)   	 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('U'),8);
	 LCD_H1(23 DOWNTO 16)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H1(31 DOWNTO 24)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('C'),8);
	 LCD_H1(39 DOWNTO 32)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8);
	 LCD_H1(47 DOWNTO 40)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8);
	 LCD_H1(55 DOWNTO 48)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H1(63 DOWNTO 56)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('M'),8);
	 LCD_H1(71 DOWNTO 64)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('I'),8);
	 LCD_H1(79 DOWNTO 72)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('N'),8);
	 LCD_H1(87 DOWNTO 80)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8);
	 LCD_H1(95 DOWNTO 88)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H1(103 DOWNTO 96)   <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('2'),8);
	 LCD_H1(111 DOWNTO 104)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('0'),8);
	 LCD_H1(119 DOWNTO 112)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8);
	 LCD_H1(127 DOWNTO 120)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('6'),8);
	 LCD_H1(135 DOWNTO 128)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8);
	 LCD_H1(143 DOWNTO 136)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('0'),8);
	 LCD_H1(151 DOWNTO 144)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('2'),8);
	 LCD_H1(159 DOWNTO 152)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8);
	
	 LCD_H2(7 DOWNTO 0)      <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('D'),8);
	 LCD_H2(15 DOWNTO 8)   	 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('S'),8);
	 LCD_H2(23 DOWNTO 16)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8);
	 LCD_H2(31 DOWNTO 24)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('8'),8);
	 LCD_H2(39 DOWNTO 32)    <= MST_NDCHDS(47 DOWNTO 40);
	 LCD_H2(47 DOWNTO 40)    <= MST_NDCHDS(39 DOWNTO 32);
	 LCD_H2(55 DOWNTO 48)    <= MST_NDCHDS(31 DOWNTO 24);
	 
	 LCD_H2(63 DOWNTO 56)    <= MST_NDDVDS(47 DOWNTO 40);
	 LCD_H2(71 DOWNTO 64)    <= MST_NDDVDS(39 DOWNTO 32);
	 LCD_H2(79 DOWNTO 72)    <= MST_NDDVDS(31 DOWNTO 24);
	 LCD_H2(87 DOWNTO 80)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('*'),8);
	 LCD_H2(95 DOWNTO 88)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('G'),8);
	 LCD_H2(103 DOWNTO 96)   <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8);
	 LCD_H2(111 DOWNTO 104)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('*'),8);
	 LCD_H2(119 DOWNTO 112)  <= MST_NDCHGH(47 DOWNTO 40);
	 LCD_H2(127 DOWNTO 120)  <= MST_NDCHGH(39 DOWNTO 32);
	 LCD_H2(135 DOWNTO 128)  <= MST_NDCHGH(31 DOWNTO 24);
	 
	 LCD_H2(143 DOWNTO 136)  <= MST_NDDVGH(47 DOWNTO 40);
	 LCD_H2(151 DOWNTO 144)  <= MST_NDDVGH(39 DOWNTO 32);
	 LCD_H2(159 DOWNTO 152)  <= MST_NDDVGH(31 DOWNTO 24);
	 
	 LCD_H3(7 DOWNTO 0)      <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('*'),8);
	 LCD_H3(15 DOWNTO 8)   	 <= YN;
	 LCD_H3(23 DOWNTO 16)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('*'),8);
	 LCD_H3(31 DOWNTO 24)    <= X"20" WHEN ND_TR = X"0" ELSE X"3" & ND_TR;
	 LCD_H3(39 DOWNTO 32)    <= MST_NDCHDS(23 DOWNTO 16);
	 LCD_H3(47 DOWNTO 40)    <= MST_NDCHDS(15 DOWNTO 8);
	 LCD_H3(55 DOWNTO 48)    <= MST_NDCHDS(7 DOWNTO 0);
	 
	 LCD_H3(63 DOWNTO 56)    <= MST_NDDVDS(23 DOWNTO 16);
	 LCD_H3(71 DOWNTO 64)    <= MST_NDDVDS(15 DOWNTO 8);
	 LCD_H3(79 DOWNTO 72)    <= MST_NDDVDS(7 DOWNTO 0);
	 
	 LCD_H3(87 DOWNTO 80)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('.'),8);
	 LCD_H3(95 DOWNTO 88)    <= X"3" & TP;
	 LCD_H3(103 DOWNTO 96)   <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H3(111 DOWNTO 104)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H3(119 DOWNTO 112)  <= MST_NDCHGH(23 DOWNTO 16);
	 LCD_H3(127 DOWNTO 120)  <= MST_NDCHGH(15 DOWNTO 8);
	 LCD_H3(135 DOWNTO 128)  <= MST_NDCHGH(7 DOWNTO 0);
	 
	 LCD_H3(143 DOWNTO 136)  <= MST_NDDVGH(23 DOWNTO 16);
	 LCD_H3(151 DOWNTO 144)  <= MST_NDDVGH(15 DOWNTO 8);
	 LCD_H3(159 DOWNTO 152)  <= MST_NDDVGH(7 DOWNTO 0);

end Behavioral;

