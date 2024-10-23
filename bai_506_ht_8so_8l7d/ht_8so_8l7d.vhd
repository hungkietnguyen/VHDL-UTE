----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:37:52 04/07/2023 
-- Design Name: 
-- Module Name:    ht_8so_8l7d - Behavioral 
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

entity ht_8so_8l7d is
    Port ( ckht : in  STD_LOGIC;
           sseg : out  STD_LOGIC_VECTOR (6 downto 0);
           cathode : out  STD_LOGIC_VECTOR (7 downto 0));
end ht_8so_8l7d;
architecture Behavioral of ht_8so_8l7d is
signal ena1khz:std_logic; 
begin
IC1: entity work.chia_10ena
     port map( ckht => ckht,
	            ena1khz => ena1khz);
					
IC2: entity work.gm_ht_8led
     port map( ckht => ckht,
	            ena1khz => ena1khz,
	            led70 => x"0",
					led71 => x"1",
					led72 => x"2",
					led73 => x"3",
					led74 => x"4",
					led75 => x"5",
					led76 => x"6",
					led77 => x"7",
					sseg => sseg,
					cathode => cathode);
end Behavioral;

