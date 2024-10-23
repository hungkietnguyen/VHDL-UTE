----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:23:28 03/28/2023 
-- Design Name: 
-- Module Name:    dem_1so_ss_ud_ht_7doan - Behavioral 
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

entity dem_1so_ss_ud_ht_7doan is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (1 downto 0);
           cathode : out  STD_LOGIC_VECTOR (7 downto 0);
           sseg : out  STD_LOGIC_VECTOR (7 downto 0));
end dem_1so_ss_ud_ht_7doan;

architecture Behavioral of dem_1so_ss_ud_ht_7doan is
signal ena1khz, ena_db, rst: std_logic;
signal donvi: std_logic_vector(3 downto 0);
signal dc_8led, ena_8led: std_logic_vector(7 downto 0);
begin
	dc_8led <= x"00";
	ena_8led <= x"01";
	rst <= btn0;
	
IC1: entity work.chia_10ena
	port map( ckht => ckht,
				 ena1khz => ena1khz,
				 ena1hz => ena_db);
IC2: entity work.dem_1so_ssud
	port map( ckht => ckht,
				 rst => rst,
				 ena_db => ena_db,
				 ena_ss => sw(0),
				 ena_ud => sw(1),
				 donvi => donvi);
IC3: entity work.gm_ht_8led
	port map( ckht => ckht,
				 ena1khz => ena1khz,
				 led70 => donvi,
				 led71 => x"1",
				 led72 => x"2",
				 led73 => x"3",
				 led74 => x"4",
				 led75 => x"5",
				 led76 => x"6",
				 led77 => x"7",
				 dc_8led => dc_8led,
				 ena_8led => ena_8led,
				 sseg => sseg,
				 cathode => cathode);
end Behavioral;

