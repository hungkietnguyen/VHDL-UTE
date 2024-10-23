----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:59:43 04/07/2023 
-- Design Name: 
-- Module Name:    dem_2so_ss_ud_2ts_xvn_ht_7doan - Behavioral 
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

entity dem_2so_ss_ud_2ts_xvn_ht_7doan is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (2 downto 0);
           sseg : out  STD_LOGIC_VECTOR (7 downto 0);
           cathode : out  STD_LOGIC_VECTOR (7 downto 0));
end dem_2so_ss_ud_2ts_xvn_ht_7doan;
architecture Behavioral of dem_2so_ss_ud_2ts_xvn_ht_7doan is
signal rst: std_logic;
signal donvi : std_logic_vector(3 downto 0);
signal chuc  : std_logic_vector(3 downto 0);
signal ena_db: std_logic;
signal ena1khz :std_logic;
signal ena1hz :std_logic;
signal ena5hz :std_logic;
signal dc_8led: std_logic_vector(7 downto 0);
signal ena_8led:std_logic_vector(7 downto 0);

begin
    rst <= btn0;
	 dc_8led <= x"00";
	 ena_8led(1 downto 0) <= "01" when chuc = x"0" else
	                         "11";
	 ena_8led( 7 downto 2) <= "000000";
	 ena_db <= ena1hz when sw(2)='0' else ena5hz;
	 
IC1: entity work.chia_10ena
     port map( ckht => ckht,
	            ena1hz => ena1hz,
					ena5hz => ena5hz,
					ena1khz => ena1khz);
					
IC2: entity work.dem_2so_ssud
	  port map( ckht => ckht,
				   rst => rst,
				   ena_db => ena_db,
				   ena_ss => sw(0),
				   ena_ud => sw(1),
				   donvi => donvi,
					chuc => chuc);
IC3: entity work.gm_ht_8led
	  port map( ckht => ckht,
				   ena1khz => ena1khz,
				   led70 => donvi,
				   led71 => chuc,
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

