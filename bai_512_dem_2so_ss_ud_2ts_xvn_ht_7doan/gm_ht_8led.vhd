----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:21:27 04/07/2023 
-- Design Name: 
-- Module Name:    gm_ht_8led - Behavioral 
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

entity gm_ht_8led is
    Port ( led70 : in  STD_LOGIC_VECTOR (3 downto 0);
           led71 : in  STD_LOGIC_VECTOR (3 downto 0);
           led72 : in  STD_LOGIC_VECTOR (3 downto 0);
           led73 : in  STD_LOGIC_VECTOR (3 downto 0);
           led74 : in  STD_LOGIC_VECTOR (3 downto 0);
           led75 : in  STD_LOGIC_VECTOR (3 downto 0);
           led76 : in  STD_LOGIC_VECTOR (3 downto 0);
           led77 : in  STD_LOGIC_VECTOR (3 downto 0);
           dc_8led : in  STD_LOGIC_VECTOR (7 downto 0);
           ena_8led : in  STD_LOGIC_VECTOR (7 downto 0);
           ena1khz : in  STD_LOGIC;
           ckht : in  STD_LOGIC;
           sseg : out  STD_LOGIC_VECTOR (7 downto 0);
           cathode : out  STD_LOGIC_VECTOR (7 downto 0));
end gm_ht_8led;
architecture Behavioral of gm_ht_8led is
signal s3b: std_logic_vector( 2 downto 0);
signal so_gma: std_logic_vector ( 3 downto 0);
signal dc_1led, ena_1led: std_logic;
begin
K1: entity work.dem_3bit
	port map( ena1khz => ena1khz,
				 ckht => ckht,
				 q => s3b);
K2: entity work.giaima_38h
	port map( i => s3b,
				 o => cathode);		  
K3: entity work.dahop_8kenh
	port map( s => s3b,
				 i0 => led70,
				 i1 => led71,
				 i2 => led72,
				 i3 => led73,
				 i4 => led74,
				 i5 => led75,
				 i6 => led76,
				 i7 => led77,
				 o => so_gma,
				 dc8 => dc_8led,
				 dc1 => dc_1led,
				 ena8 => ena_8led,
				 ena1 => ena_1led);				  
K4: entity work.giaima_7doan_ena
	port map( so_gma => so_gma,
				 dp => dc_1led,
				 ena => ena_1led,
				 sseg => sseg);
						  
end Behavioral;

