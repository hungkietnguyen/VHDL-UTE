----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:37:50 02/20/2023 
-- Design Name: 
-- Module Name:    chia_10xung_ena1hz_ena1mhz - Behavioral 
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

entity chia_10xung_ena1hz_ena1mhz is
    Port ( ckht : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (9 downto 0));
end chia_10xung_ena1hz_ena1mhz;
architecture Behavioral of chia_10xung_ena1hz_ena1mhz is
begin
IC1: entity work.chia_10ena
     port map( ckht=>ckht,
	           ena1hz=>led(0),
				  ena2hz => led(1),
				  ena5hz => led(2),
				  ena10hz => led(3),
				  ena20hz => led(4),
				  ena25hz => led(5),
				  ena50hz => led(6),
				  ena100hz => led(7),
				  ena1khz => led(8),
				  ena1mhz => led(9));
end Behavioral;

