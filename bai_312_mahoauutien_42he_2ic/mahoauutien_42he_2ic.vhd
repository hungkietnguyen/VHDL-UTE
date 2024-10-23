----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:44 02/08/2023 
-- Design Name: 
-- Module Name:    mahoauutien_42he_2ic - Behavioral 
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

entity mahoauutien_42he_2ic is
    Port ( sw : in  STD_LOGIC_VECTOR (8 downto 0);
           led : out  STD_LOGIC_VECTOR (5 downto 0));
end mahoauutien_42he_2ic;
architecture Behavioral of mahoauutien_42he_2ic is
begin
IC1: entity work.mahoa_42he_if
       port map( i=>sw(3 downto 0),
		                  e=>sw(4),
								o=>led(1 downto 0),
								act=>led(2));
IC2: entity work.mahoa_42he_case
       port map( i=>sw(8 downto 5),
		                  e=>sw(4),
								o=>led(3 downto 2),
								act=>led(5));
end Behavioral;

