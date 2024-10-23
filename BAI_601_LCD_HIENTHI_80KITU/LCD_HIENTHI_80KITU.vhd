----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:02:37 04/05/2023 
-- Design Name: 
-- Module Name:    LCD_HIENTHI_80KITU - Behavioral 
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

entity LCD_HIENTHI_80KITU is
    Port ( CKHT : in  STD_LOGIC;
           BTN0 : in  STD_LOGIC;
           SWP : in  STD_LOGIC;
           LCD_E : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_P : out  STD_LOGIC;
           LCD_DB : out  STD_LOGIC_VECTOR (7 downto 0));
end LCD_HIENTHI_80KITU;

architecture Behavioral of LCD_HIENTHI_80KITU is

SIGNAL LCD_H0: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H1: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H2: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL LCD_H3: STD_LOGIC_VECTOR(159 DOWNTO 0);
SIGNAL RST : STD_LOGIC;

begin

	RST 		<= BTN0;
	LCD_P    <= SWP;

IC1: ENTITY WORK.LCD_GAN_DULIEU
	PORT MAP( LCD_H0  => LCD_H0,
	          LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);
				 
IC2: ENTITY WORK.LCD_KHOITAO_HIENTHI
	PORT MAP( RST   	=> RST,
	          CKHT  	=> CKHT,
				 LCD_DB	=> LCD_DB,
				 LCD_RS  => LCD_RS,
				 LCD_E   => LCD_E,
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);				 		 
				 
end Behavioral;

