----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:38 04/07/2023 
-- Design Name: 
-- Module Name:    LCD_GAN_DULIEU_6SO - Behavioral 
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

entity LCD_GAN_DULIEU_6SO is
    Port ( DONVI : in  STD_LOGIC_VECTOR (3 downto 0);
           CHUC : in  STD_LOGIC_VECTOR (3 downto 0);
           TRAM : in  STD_LOGIC_VECTOR (3 downto 0);
           NGAN : in  STD_LOGIC_VECTOR (3 downto 0);
           CH_TS : in  STD_LOGIC_VECTOR (3 downto 0);
           DV_TS : in  STD_LOGIC_VECTOR (3 downto 0);
           ENA_SS : in  STD_LOGIC;
           ENA_UD : in  STD_LOGIC;
           LCD_H0 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H1 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H2 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H3 : out  STD_LOGIC_VECTOR (159 downto 0));
end LCD_GAN_DULIEU_6SO;

architecture Behavioral of LCD_GAN_DULIEU_6SO is
SIGNAL NGANT,CHUCT,TRAMT: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SS3,SS2,SS1,SS0: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL UD3,UD2,UD1,UD0: STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
	PROCESS(NGAN,TRAM,CHUC)
	BEGIN
		NGANT <= X"3" & NGAN;
		TRAMT <= X"3" & TRAM;
		CHUCT <= X"3" & CHUC;
		IF NGAN =X"0" THEN NGANT <= X"20";
			IF TRAM =X"0" THEN TRAMT <=X"20";
				IF CHUC =X"0" THEN CHUCT <= X"20";
				END IF;
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS(ENA_SS)
	BEGIN 
		IF ENA_SS ='0' THEN
			SS3<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('S'),8);
			SS2<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('T'),8);
			SS1<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8);
			SS0<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('P'),8);
		ELSE	
			SS3<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('R'),8);
			SS2<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('U'),8);
			SS1<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('N'),8);
			SS0<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
		END IF;
	END PROCESS;
	
	PROCESS(ENA_UD)
	BEGIN 
		IF ENA_UD ='0' THEN
			UD3<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('D'),8);
			UD2<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8);
			UD1<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('W'),8);
			UD0<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('N'),8);
		ELSE	
			UD3<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
			UD2<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('U'),8);
			UD1<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('P'),8);
			UD0<= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
		END IF;
	END PROCESS;
	 LCD_H0( 7 DOWNTO 0)     <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('M'),8);
	 LCD_H0(15 DOWNTO 8)   	 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8);
	 LCD_H0(23 DOWNTO 16)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('C'),8);
	 LCD_H0(31 DOWNTO 24)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8);
	 LCD_H0(39 DOWNTO 32)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H0(47 DOWNTO 40)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('D'),8);
	 LCD_H0(55 DOWNTO 48)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('E'),8);
	 LCD_H0(63 DOWNTO 56)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('M'),8);
	 LCD_H0(71 DOWNTO 64)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H0(79 DOWNTO 72)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('N'),8);
	 LCD_H0(87 DOWNTO 80)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('P'),8);
	 LCD_H0(95 DOWNTO 88)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('1'),8);
	 LCD_H0(103 DOWNTO 96)   <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('0'),8);
	 LCD_H0(111 DOWNTO 104)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('B'),8);
	 LCD_H0(119 DOWNTO 112)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('I'),8);
	 LCD_H0(127 DOWNTO 120)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('T'),8);
	 LCD_H0(135 DOWNTO 128)  <= NGANT;
	
	 LCD_H0(143 DOWNTO 136) <= TRAMT;
	 LCD_H0(151 DOWNTO 144) <= CHUCT;
	 LCD_H0(159 DOWNTO 152) <= X"3" & DONVI;
---HANG 1	 
	 LCD_H1(7 DOWNTO 0)      <= SS3;
	 LCD_H1(15 DOWNTO 8)   	 <= SS2;
	 LCD_H1(23 DOWNTO 16)    <= SS1;
	 LCD_H1(31 DOWNTO 24)    <= SS0;
	 
	 LCD_H1(39 DOWNTO 32)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 
	 LCD_H1(47 DOWNTO 40)    <= UD3;
	 LCD_H1(55 DOWNTO 48)    <= UD2;
	 LCD_H1(63 DOWNTO 56)    <= UD1;
	 LCD_H1(71 DOWNTO 64)    <= UD0;
	 LCD_H1(79 DOWNTO 72)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H1(87 DOWNTO 80)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('T'),8);
	 LCD_H1(95 DOWNTO 88)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8);
	 LCD_H1(103 DOWNTO 96)   <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('N'),8);
	 LCD_H1(111 DOWNTO 104)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H1(119 DOWNTO 112)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('S'),8);
	 LCD_H1(127 DOWNTO 120)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8);
	 LCD_H1(135 DOWNTO 128)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(':'),8);
	 LCD_H1(143 DOWNTO 136)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 
	 LCD_H1(151 DOWNTO 144)  <= X"3" & CH_TS;
	 LCD_H1(159 DOWNTO 152)  <=X"3" & DV_TS;
---HANG2 	 
	 LCD_H2(7 DOWNTO 0)      <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('T'),8);
	 LCD_H2(15 DOWNTO 8)   	 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8);
	 LCD_H2(23 DOWNTO 16)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('I'),8);
	 LCD_H2(31 DOWNTO 24)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('E'),8);
	 LCD_H2(39 DOWNTO 32)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('T'),8);
	 LCD_H2(47 DOWNTO 40)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H2(55 DOWNTO 48)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('K'),8);
	 LCD_H2(63 DOWNTO 56)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('E'),8);
	 LCD_H2(71 DOWNTO 64)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H2(79 DOWNTO 72)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('V'),8);
	 LCD_H2(87 DOWNTO 80)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('I'),8);
	 LCD_H2(95 DOWNTO 88)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H2(103 DOWNTO 96)   <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('M'),8);
	 LCD_H2(111 DOWNTO 104)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8);
	 LCD_H2(119 DOWNTO 112)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('C'),8);
	 LCD_H2(127 DOWNTO 120)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('H'),8);
	 LCD_H2(135 DOWNTO 128)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H2(143 DOWNTO 136)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('S'),8);
	 LCD_H2(151 DOWNTO 144)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('O'),8);
	 LCD_H2(159 DOWNTO 152)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
---HANG3	 
	 LCD_H3(7 DOWNTO 0)      <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('*'),8);
	 LCD_H3(15 DOWNTO 8)   	 <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('K'),8);
	 LCD_H3(23 DOWNTO 16)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('I'),8);
	 LCD_H3(31 DOWNTO 24)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('T'),8);
	 LCD_H3(39 DOWNTO 32)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H3(47 DOWNTO 40)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('F'),8);
	 LCD_H3(55 DOWNTO 48)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('P'),8);
	 LCD_H3(63 DOWNTO 56)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('G'),8);
	 LCD_H3(71 DOWNTO 64)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('A'),8);
	 LCD_H3(79 DOWNTO 72)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS(' '),8);
	 LCD_H3(87 DOWNTO 80)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('X'),8);
	 LCD_H3(95 DOWNTO 88)    <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('C'),8);
	 LCD_H3(103 DOWNTO 96)   <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('3'),8);
	 LCD_H3(111 DOWNTO 104)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('S'),8);
	 LCD_H3(119 DOWNTO 112)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('5'),8);
	 LCD_H3(127 DOWNTO 120)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('0'),8);
	 LCD_H3(135 DOWNTO 128)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('0'),8);
	 LCD_H3(143 DOWNTO 136)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('E'),8);
	 LCD_H3(151 DOWNTO 144)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('*'),8);
	 LCD_H3(159 DOWNTO 152)  <= CONV_STD_LOGIC_VECTOR(CHARACTER'POS('*'),8);

end Behavioral;

