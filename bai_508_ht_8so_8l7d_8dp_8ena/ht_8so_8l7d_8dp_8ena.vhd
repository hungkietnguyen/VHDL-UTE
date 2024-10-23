----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:36:57 04/07/2023 
-- Design Name: 
-- Module Name:    ht_8so_8l7d_8dp_8ena - Behavioral 
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

entity ht_8so_8l7d_8dp_8ena is
    Port ( ckht : in  STD_LOGIC;
	        sw : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           sseg : out  STD_LOGIC_VECTOR (7 downto 0);
           cathode : out  STD_LOGIC_VECTOR (7 downto 0));
end ht_8so_8l7d_8dp_8ena;
architecture Behavioral of ht_8so_8l7d_8dp_8ena is
signal ena1khz :std_logic;
signal dc_8led: std_logic_vector( 7 downto 0);
signal ena_8led: std_logic_vector( 7 downto 0);
begin
	dc_8led <= sw(15 downto 8);
	ena_8led <= sw(7 downto 0);
	
IC1: entity work.chia_10ena
	port map( ckht => ckht,
				 ena1khz => ena1khz);
IC2: entity work.gm_ht_8led
	port map( ckht => ckht,
				 ena1khz => ena1khz,
				 led70 => x"0",
				 led71 => x"F",
				 led72 => x"1",
				 led73 => x"F",
				 led74 => x"A",
				 led75 => x"F",
				 led76 => x"1",
				 led77 => x"F",
				 dc_8led => dc_8led,
				 ena_8led => ena_8led,
				 sseg     => sseg,
				 cathode  => cathode);
end Behavioral;

