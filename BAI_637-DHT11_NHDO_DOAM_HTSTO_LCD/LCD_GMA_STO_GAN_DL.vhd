----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:19:25 04/20/2023 
-- Design Name: 
-- Module Name:    LCD_GMA_STO_GAN_DL - Behavioral 
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

entity LCD_GMA_STO_GAN_DL is
    Port ( ND_DV : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_CH : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_TR : in  STD_LOGIC_VECTOR (3 downto 0);
           DA_DV : in  STD_LOGIC_VECTOR (3 downto 0);
           DA_CH : in  STD_LOGIC_VECTOR (3 downto 0);
           DA_TR : in  STD_LOGIC_VECTOR (3 downto 0);
           DHT_PR : in  STD_LOGIC;
           TT_CS : in  STD_LOGIC;
           LCD_H0 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H1 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H2 : out  STD_LOGIC_VECTOR (159 downto 0);
           LCD_H3 : out  STD_LOGIC_VECTOR (159 downto 0));
end LCD_GMA_STO_GAN_DL;

architecture Behavioral of LCD_GMA_STO_GAN_DL is
SIGNAL MST_NDDVDH: STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL MST_NDCHDH: STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL MST_DADVDH: STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL MST_DACHDH: STD_LOGIC_VECTOR(47 DOWNTO 0);

begin
K1: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => ND_DV,
				 SO_TO   => MST_NDDVDH);

K2: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => ND_CH,
				 SO_TO   => MST_NDCHDH);

K3: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => DA_DV,
				 SO_TO   => MST_DADVDH);
				 
K4: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => DA_CH,
				 SO_TO   => MST_DACHDH);
K5: ENTITY WORK.LCD_GAN_DULIEU_4SO_TO
	PORT MAP( MST_NDDVDH   => MST_NDDVDH,
	          MST_NDCHDH	=> MST_NDCHDH,
				 MST_DADVDH => MST_DADVDH,
				 MST_DACHDH => MST_DACHDH,
				 
				 ND_TR => ND_TR,
				 DA_TR   => DA_TR,
				 TT_CS => TT_CS,
				 DHT_PR => DHT_PR,
				 
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);
end Behavioral;

