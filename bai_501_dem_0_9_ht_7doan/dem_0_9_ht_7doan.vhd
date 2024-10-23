----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:41:45 03/27/2023 
-- Design Name: 
-- Module Name:    dem_0_9_ht_7doan - Behavioral 
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

entity dem_0_9_ht_7doan is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           sw0 : in  STD_LOGIC;
           cathode : out  STD_LOGIC;
           sseg : out  STD_LOGIC_VECTOR (6 downto 0));
end dem_0_9_ht_7doan;
architecture Behavioral of dem_0_9_ht_7doan is
signal ena_db : std_logic;
signal rst : std_logic;
signal donvi : std_logic_vector( 3 downto 0);
begin
  rst <= btn0;
  cathode <= '1';
  
IC1: entity work.chia_10ena
    port map(ckht => ckht,
	          ena1hz =>ena_db);
				 
IC2: entity work.dem_1so
    port map(ena_db => ena_db,
	          ckht => ckht,
				 rst => rst,
				 ena_ss => sw0,
				 donvi => donvi);
				 
IC3: entity work.giama_7doan
    port map(so_gma => donvi,
	          sseg => sseg);
end Behavioral;

