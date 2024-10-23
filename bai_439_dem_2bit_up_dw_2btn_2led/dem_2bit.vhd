----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:09:54 03/13/2023 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_2bit is
    Port ( ena_up : in  STD_LOGIC;
           ckht : in  STD_LOGIC;
           ena_dw : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (1 downto 0));
end dem_2bit;

architecture Behavioral of dem_2bit is
signal q_r, q_n : STD_LOGIC_VECTOR( 1 downto 0);
begin
    process(ckht,rst)
	       begin
			      if (rst='1') then q_r<=( others =>'0');
					elsif falling_edge(ckht) then q_r<=q_n;
					end if;
	 end process;
	 q_n <= q_r + 1 when ena_up = '1' else
	        q_r - 1 when ena_dw = '1' else
			  q_r;
	 q <= q_r;
end Behavioral;

