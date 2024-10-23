----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:40:55 02/20/2023 
-- Design Name: 
-- Module Name:    chia_1xung_ena1hz - Behavioral 
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

entity chia_1xung_ena1hz is
    Port ( ckht : in  STD_LOGIC;
           led0 : out  STD_LOGIC);
end chia_1xung_ena1hz;

architecture Behavioral of chia_1xung_ena1hz is

begin
IC1: entity work.chia_ena1hz
     port map( ckht=>ckht,
	  ena1hz=>led0);


end Behavioral;

