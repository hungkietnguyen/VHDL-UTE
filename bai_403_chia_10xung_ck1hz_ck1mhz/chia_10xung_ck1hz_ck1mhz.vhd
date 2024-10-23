----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:43:07 02/16/2023 
-- Design Name: 
-- Module Name:    chia_10xung_ck1hz_ck1mhz - Behavioral 
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

entity chia_10xung_ck1hz_ck1mhz is
    Port ( ckht : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (9 downto 0));
end chia_10xung_ck1hz_ck1mhz;
architecture Behavioral of chia_10xung_ck1hz_ck1mhz is
begin
IC1: entity work.chia_10ck
     port map( ckht=>ckht,
	            ck1hz=>led(0),
					ck2hz=>led(1),
					ck5hz=>led(2),
					ck10hz=>led(3),
					ck20hz=>led(4),
					ck25hz=>led(5),
					ck50hz=>led(6),
					ck100hz=>led(7),
					ck1khz=>led(8),
					ck1mhz=>led(9));

end Behavioral;

