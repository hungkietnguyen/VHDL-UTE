----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:42:23 02/11/2023 
-- Design Name: 
-- Module Name:    dahop_4kenh_1be_2ic - Behavioral 
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

entity dahop_4kenh_1be_2ic is
    Port ( sw : in  STD_LOGIC_VECTOR (6 downto 0);
           led : out  STD_LOGIC_VECTOR (1 downto 0));
end dahop_4kenh_1be_2ic;
architecture Behavioral of dahop_4kenh_1be_2ic is
begin
IC1: entity work.dahop_4kenh_1be_if
       port map( i=>sw(3 downto 0),
		                  e=>sw(4),
								s=>sw(6 downto 5),
								o=>led(0));
IC2: entity work.dahop_4kenh_1be_case
       port map( i=>sw(3 downto 0),
		                  e=>sw(4),
								s=>sw(6 downto 5),
								o=>led(1));
end Behavioral;

