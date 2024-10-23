----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:02:01 02/28/2023 
-- Design Name: 
-- Module Name:    dem_2bit - Behavioral 
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

entity dem_2bit is
    Port ( ckht : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena_db : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (1 downto 0));
end dem_2bit;

architecture Behavioral of dem_2bit is
signal q_r, q_n: std_logic_vector(1 downto 0);
begin
	process(ckht, rst)
	begin
		if rst='1' then q_r <= "00";
		elsif falling_edge(ckht) then q_r <= q_n;
		end if;
	end process;
	q_n <= q_r+1 when ena_db ='1' else
							 q_r;
	q <= q_r;

end Behavioral;

