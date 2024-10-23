----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:25:44 02/26/2023 
-- Design Name: 
-- Module Name:    auto_dao_ena_ud - Behavioral 
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

entity auto_dao_ena_ud is
    Port ( ckht : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q_ss : in  STD_LOGIC_VECTOR(7 downto 0);
           ena_ud : out  STD_LOGIC);
end auto_dao_ena_ud;

architecture Behavioral of auto_dao_ena_ud is
signal ud_r :STD_LOGIC;
signal ud_n :STD_LOGIC;
begin
    process(ckht,rst)
	       begin
			      if (rst='1') then ud_r <= '0';
					elsif falling_edge(ckht) then ud_r <= ud_n;
					end if;
	 end process;
	 ud_n <= '1' when q_ss = x"f" else
	         '0' when q_ss = x"0" else
			   ud_r;
	 ena_ud <= ud_r;
	
end Behavioral;

