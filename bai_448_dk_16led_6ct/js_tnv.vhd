----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:27:04 03/20/2023 
-- Design Name: 
-- Module Name:    js_tnv - Behavioral 
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

entity js_tnv is
    Port ( ena_db : in  STD_LOGIC;
           ckht : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           oe : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (15 downto 0));
end js_tnv;
architecture Behavioral of js_tnv is
signal q_r :STD_LOGIC_VECTOR(15 downto 0);
signal q_n :STD_LOGIC_VECTOR(15 downto 0);
begin
    process(ckht,rst)
	       begin
			      if (rst='1') then q_r<=( others=>'0');
					elsif falling_edge(ckht) then q_r<=q_n;
					end if;
	 end process;
	 q_n <= (others =>'0')                                                  when oe = '0' else
	         not q_r(8)& q_r( 15 downto 9) & q_r(6 downto 0)& not q_r(7) when  ena_db='1' else
	         q_r;
	 q <= q_r when oe ='1' else ( others =>'0');
end Behavioral;

