----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:36:34 04/20/2023 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LCD_GMA_STO_GAN_DULIEU is
    Port ( ND_DVDS : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_CHDS : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_TRDS : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_TPDS : in  STD_LOGIC_VECTOR (3 downto 0);
           GH_CH : in  STD_LOGIC_VECTOR (3 downto 0);
           GH_DV : in  STD_LOGIC_VECTOR (3 downto 0);
           DS_PRE : in  STD_LOGIC;
           ND_DVDH : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_CHDH : in  STD_LOGIC_VECTOR (3 downto 0);
           ND_TRDH : in  STD_LOGIC_VECTOR (3 downto 0);
           DA_DVDH : in  STD_LOGIC_VECTOR (3 downto 0);
           DA_CHDH : in  STD_LOGIC_VECTOR (3 downto 0);
           DA_TRDH : in  STD_LOGIC_VECTOR (3 downto 0);
           DHT_PR : in  STD_LOGIC;
           TT_CS : in  STD_LOGIC;
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

SIGNAL MST_NDDVDH: STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL MST_NDCHDH: STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL MST_DADVDH: STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL MST_DACHDH: STD_LOGIC_VECTOR(47 DOWNTO 0);
begin
K1: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => ND_DVDS,
				 SO_TO   => MST_NDDVDS);

K2: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => ND_CHDS,
				 SO_TO   => MST_NDCHDS);

K3: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => GH_DV,
				 SO_TO   => MST_NDDVGH);
				 
K4: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => GH_CH,
				 SO_TO   => MST_NDCHGH);
K5: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => ND_DVDH,
				 SO_TO   => MST_NDDVDH);

K6: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => ND_CHDH,
				 SO_TO   => MST_NDCHDH);

K7: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => DA_DVDH,
				 SO_TO   => MST_DADVDH);
				 
K8: ENTITY WORK.LCD_GIAI_MA_SO_TO
	PORT MAP( SO_NHO  => DA_CHDH,
				 SO_TO   => MST_DACHDH);				 
K9: ENTITY WORK.LCD_GAN_DULIEU_8SO_TO
	PORT MAP( MST_NDDVDS   => MST_NDDVDS,
	          MST_NDCHDS   => MST_NDCHDS,
				 MST_NDDVGH   => MST_NDDVGH,
				 MST_NDCHGH  => MST_NDCHGH,
				 ND_TRDS => ND_TRDS,
				 ND_TPDS => ND_TPDS,
				 DS_PRE => DS_PRE,
---DHT11
				 MST_NDDVDH   => MST_NDDVDH,
	          MST_NDCHDH	=> MST_NDCHDH,
				 MST_DADVDH => MST_DADVDH,
				 MST_DACHDH => MST_DACHDH,
				 
				 ND_TRDH => ND_TRDH,
				 DA_TRDH   => DA_TRDH,
				 TT_CS => TT_CS,
				 DHT_PR => DHT_PR,
				 
				 LCD_H0  => LCD_H0,
				 LCD_H1  => LCD_H1,
				 LCD_H2  => LCD_H2,
				 LCD_H3  => LCD_H3);

end Behavioral;

