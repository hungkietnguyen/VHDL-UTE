----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:05:28 03/31/2023 
-- Design Name: 
-- Module Name:    hai_md_bcd_4so_ht_7doan - Behavioral 
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

entity hai_md_bcd_4so_ht_7doan is
    Port ( ckht : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (1 downto 0);
           btn : in  STD_LOGIC_VECTOR (1 downto 0);
           cathode : out  STD_LOGIC_VECTOR (7 downto 0);
           sseg : out  STD_LOGIC_VECTOR (6 downto 0));
end hai_md_bcd_4so_ht_7doan;
architecture Behavioral of hai_md_bcd_4so_ht_7doan is
signal ena_db : std_logic;
signal ena1khz : std_logic;
signal rst1: std_logic;
signal rst2: std_logic;
signal s3b    : std_logic_vector(2 downto 0);
signal so_gma : std_logic_vector(3 downto 0);
signal donvi1 : std_logic_vector(3 downto 0);
signal chuc1 : std_logic_vector(3 downto 0);
signal tram1 : std_logic_vector(3 downto 0);
signal nghin1 : std_logic_vector(3 downto 0);

signal donvi2 : std_logic_vector(3 downto 0);
signal chuc2 : std_logic_vector(3 downto 0);
signal tram2 : std_logic_vector(3 downto 0);
signal nghin2 : std_logic_vector(3 downto 0);
begin
    rst1 <= btn(0);
	 rst2 <= btn(1);
	 
IC1: entity work.chia_10ena
    port map(ckht => ckht,
	          ena20hz =>ena_db,
				 ena1khz => ena1khz);
				 
IC2: entity work.dem_4so_1
    port map(ena_db => ena_db,
	          ckht => ckht,
				 rst => rst1,
				 ena_ss => sw(0),
				 donvi => donvi1,
				 chuc => chuc1,
				 tram => tram1, 
				 nghin => nghin1);
				 
IC3: entity work.dem_4so_2
    port map(ena_db => ena_db,
	          ckht => ckht,
				 rst => rst2,
				 ena_ss => sw(1),
				 donvi => donvi2,
				 chuc => chuc2,
				 tram => tram2, 
				 nghin => nghin2);
				 
IC4: entity work.dem_3bit
     port map( ena1khz =>ena1khz,
	            ckht => ckht,
					q => s3b);
					
IC5: entity work.dahop_8kenh
     port map( i0 => donvi1,
	            i1 => chuc1,
					i2 => tram1,
					i3 => nghin1,
					i4 => donvi2,
	            i5 => chuc2,
					i6 => tram2,
					i7 => nghin2,
					s  => s3b,
					o  => so_gma);
					
IC6: entity work.giaima_38h
     port map( i => s3b,
	            o => cathode);
					
IC7: entity work. giaima_7doan
     port map(so_gma => so_gma,
	           sseg => sseg);
end Behavioral;

					

				 

				 

	 


