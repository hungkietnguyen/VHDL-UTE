----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:32:12 04/15/2023 
-- Design Name: 
-- Module Name:    LCD_GMA_STO_GAN_DULIEU - Behavioral 
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

entity LCD_GMA_STO_GAN_DULIEU is
    Port ( ND_DV : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_CH : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_TR : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_TP : in  STD_LOGIC_VECTOR (3 downto 0);
           DS_PRE : in  STD_LOGIC;
           GH_DV : in  STD_LOGIC_VECTOR (3 downto 0);
           GH_CH : in  STD_LOGIC_VECTOR (3 downto 0);
           LCD_H0 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H1 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H2 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H3 : out  STD_LOGIC_VECTOR (159 downto 0));
end LCD_GMA_STO_GAN_DULIEU;

architecture Behavioral of LCD_GMA_STO_GAN_DULIEU is
SIGNAL MST_NDDVDS: STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL MST_NDCHDS: STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL MST_NDDVGH: STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL MST_NDCHGH: STD_LOGIC_VECTOR(47 DOWNTO 0);
begin
IC1: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => ND_DV,
				 SO_TO   => MST_NDDVDS);

IC2: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => ND_CH,
				 SO_TO   => MST_NDCHDS);

IC3: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => GH_DV,
				 SO_TO   => MST_NDDVGH);
				 
IC4: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => GH_CH,
				 SO_TO   => MST_NDCHGH);

IC5: ENTITY WORK.LCD_GAN_DULIEU_4SO_TO
	PORT MAP( MST_NDDVDS   => MST_NDDVDS,
	          MST_NDCHDS   => MST_NDCHDS,
				 MST_NDDVGH   => MST_NDDVGH,
				 MST_NDCHGH  => MST_NDCHGH,
				 ND_TR => ND_TR,
				 ND_TP => ND_TP,
				 DS_PRE => DS_PRE,
				 
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);
end Behavioral;

