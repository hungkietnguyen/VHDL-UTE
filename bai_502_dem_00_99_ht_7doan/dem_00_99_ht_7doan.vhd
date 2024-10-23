----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:45:33 03/27/2023 
-- Design Name: 
-- Module Name:    dem_00_99_ht_7doan - Behavioral 
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

entity dem_00_99_ht_7doan is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           sw0 : in  STD_LOGIC;
           sseg : out  STD_LOGIC_VECTOR (6 downto 0);
           cathode : out  STD_LOGIC_VECTOR (1 downto 0));
end dem_00_99_ht_7doan;
architecture Behavioral of dem_00_99_ht_7doan is
signal ena_db : std_logic;
signal ena1khz : std_logic;
signal rst: std_logic;
signal s1b : std_logic;
signal so_gma : std_logic_vector(3 downto 0);
signal donvi : std_logic_vector(3 downto 0);
signal chuc : std_logic_vector(3 downto 0);
begin
   rst <= btn0;
IC1: entity work.chia_10ena
    port map(ckht => ckht,
	          ena5hz =>ena_db,
				 ena1khz => ena1khz);
				 
IC2: entity work.dem_2so
    port map(ena_db => ena_db,
	          ckht => ckht,
				 rst => rst,
				 ena_ss => sw0,
				 donvi => donvi,
				 chuc => chuc);
				 
IC3: entity work.dem_1bit
     port map( ena1khz =>ena1khz,
	            ckht => ckht,
					q => s1b);
					
IC4: entity work.dahop_2kenh
     port map( i0 => donvi,
	            i1 => chuc,
					s => s1b,
					o => so_gma);
					
IC5: entity work.giaima_12h
     port map( i => s1b,
	            o => cathode);

IC6: entity work. giaima_7doan
     port map(so_gma => so_gma,
	           sseg => sseg);
end Behavioral;

