----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:24:11 02/16/2023 
-- Design Name: 
-- Module Name:    chia_2xung-ck1hz_ck10hz - Behavioral 
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

entity chia_2xung-ck1hz_ck10hz is
    Port ( ckht : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (1 downto 0));
end chia_2xung-ck1hz_ck10hz;
architecture Behavioral of chia_2xung-ck1hz_ck10hz is
begin
IC1: entity work.chia_ck1hz_ck10hz
     port map(ckht=>ckht,
	           ck1hz =>led(0),
				  ck10hz=>led(1));
end Behavioral;

