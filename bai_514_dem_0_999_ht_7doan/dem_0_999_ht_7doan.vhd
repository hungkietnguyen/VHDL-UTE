----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:54:52 04/11/2023 
-- Design Name: 
-- Module Name:    dem_0_999_ht_7doan - Behavioral 
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

entity dem_0_999_ht_7doan is
    Port ( ckht : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (3 downto 0);
           btn0 : in  STD_LOGIC;
           sseg : out  STD_LOGIC_VECTOR (7 downto 0);
           cathode : out  STD_LOGIC_VECTOR (7 downto 0));
end dem_0_999_ht_7doan;

architecture Behavioral of dem_0_999_ht_7doan is
signal rst: std_logic;
signal donvi : std_logic_vector(3 downto 0);
signal chuc  : std_logic_vector(3 downto 0);
signal tram  : std_logic_vector(3 downto 0);
signal ena_db: std_logic;
signal ena1khz :std_logic;
signal ena1hz :std_logic;
signal ena5hz :std_logic;
signal ena10hz :std_logic;
signal ena20hz :std_logic;
signal dc_8led: std_logic_vector(7 downto 0);
signal ena_8led:std_logic_vector(7 downto 0);
signal ena2b   :std_logic_vector(1 downto 0);
signal dv_ts   :std_logic_vector(3 downto 0);
signal ch_ts   :std_logic_vector(3 downto 0);
begin
    rst <= btn0;
	 dc_8led <=x"00";
	 ena_8led <="11000" & ena2b &'1';
				  
IC1: entity work.xoa_so_0_vn
     port map( ena2b => ena2b,
	            tram =>tram,
					chuc => chuc);
					
IC2: entity work.ht_4tanso
     port map( ena1hz => ena1hz,
					ena5hz => ena5hz,
					ena10hz => ena10hz,
					ena20hz => ena20hz,
					ena_db => ena_db,
					dv_ts => dv_ts,
					ch_ts => ch_ts,
					s =>sw(3 downto 2));
					
IC3: entity work.chia_10ena
     port map( ckht => ckht,
	            ena1hz => ena1hz,
					ena5hz => ena5hz,
					ena10hz => ena10hz,
					ena20hz => ena20hz,
					ena1khz => ena1khz);
		
IC4: entity work.dem_3so_ssud
	  port map( ckht => ckht,
				   rst => rst,
				   ena_db => ena_db,
				   ena_ss => sw(0),
				   ena_ud => sw(1),
				   donvi => donvi,
					chuc => chuc,
					tram => tram);
IC5: entity work.gm_ht_8led
	  port map( ckht => ckht,
				   ena1khz => ena1khz,
				   led70 => donvi,
				   led71 => chuc,
				   led72 => tram,
				   led73 => x"3",
				   led74 => x"4",
				   led75 => x"5",
				   led76 => dv_ts,
				   led77 => ch_ts,
				   dc_8led => dc_8led,
				   ena_8led => ena_8led,
				   sseg     => sseg,
				   cathode  => cathode);
end Behavioral;
