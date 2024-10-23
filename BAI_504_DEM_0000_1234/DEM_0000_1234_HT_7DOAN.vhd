----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:05 04/27/2022 
-- Design Name: 
-- Module Name:    DEM_0000_1234_HT_7DOAN - Behavioral 
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

entity DEM_0000_1234_HT_7DOAN is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           sw0 : in  STD_LOGIC;
           anode : out  STD_LOGIC_VECTOR (3 downto 0);
           sseg : out  STD_LOGIC_VECTOR (6 downto 0));
end DEM_0000_1234_HT_7DOAN;

architecture Behavioral of DEM_0000_1234_HT_7DOAN is
signal ena_db, rst, ena1khz: std_logic;
signal donvi, chuc,tram, ngan, so_gma : std_logic_vector(3 downto 0);
signal s2b: std_logic_vector(1 downto 0);
begin
	rst <= btn0;
IC1: entity work.CHIA_10ENA
		port map( ckht => ckht,
					 ena50hz => ena_db,
					 ena1khz =>ena1khz);
					 
 IC2: entity work.dem_4so
		port map( ckht => ckht,
					 rst => rst,
					 ena_db => ena_db,
					 ena_ss => sw0,
					 donvi => donvi,
					 chuc => chuc,
					 tram => tram,
					 ngan => ngan);
					 
 IC3: entity work.dem_2bit_select
		port map( ena1khz => ena1khz,
					 ckht => ckht,
					 q => s2b);

 IC4: entity work.dahop_4kenh
		port map( s => s2b,
					 o => so_gma,
					 i0 => donvi,
					 i1 => chuc,
					 i2 => tram,
					 i3 => ngan);
 
 IC5: entity work.giaima_24h
		port map (  i => s2b,
						o => anode );
						
 IC6: entity work.giaima_7doan 
		port map( so_gma => so_gma,
		          sseg => sseg);


end Behavioral;

