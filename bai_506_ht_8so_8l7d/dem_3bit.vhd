----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:56:44 04/07/2023 
-- Design Name: 
-- Module Name:    dem_3bit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_3bit is
    Port ( ena1khz : in  STD_LOGIC;
           ckht : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (2 downto 0));
end dem_3bit;

architecture Behavioral of dem_3bit is
signal q_n: std_logic_vector(2 downto 0) := "000";
signal q_r: std_logic_vector(2 downto 0) := "000";
begin
	process(ckht)
	begin
		if falling_edge(ckht) then q_r <= q_n;
		end if;
	end process;
	q_n <= q_r +1 when ena1khz = '1' else
					 q_r;
	q <= q_r;
	
end Behavioral;

