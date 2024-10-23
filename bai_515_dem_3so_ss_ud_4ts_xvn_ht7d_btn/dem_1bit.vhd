----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:49:40 03/07/2023 
-- Design Name: 
-- Module Name:    dem_1bit - Behavioral 
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

entity dem_1bit is
    Port ( ena_db : in  STD_LOGIC;
           ckht : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC);
end dem_1bit;

architecture Behavioral of dem_1bit is
signal q_r : STD_LOGIC;
signal q_n : STD_LOGIC;
begin
    process(ckht,rst)
	       begin
			      if (rst='1') then q_r<='0';
					elsif falling_edge(ckht) then q_r<=q_n;
					end if;
	 end process;
	 q_n <= not q_r when ena_db = '1' else
	        q_r;
	 q <= q_r;
end Behavioral;

