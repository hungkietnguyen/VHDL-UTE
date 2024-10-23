----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:55:40 02/13/2023 
-- Design Name: 
-- Module Name:    giaidahop_4kenh_2bit - Behavioral 
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

entity giaidahop_4kenh_2bit is
    Port ( i : in  STD_LOGIC_VECTOR (1 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0));
end giaidahop_4kenh_2bit;
architecture Behavioral of giaidahop_4kenh_2bit is
begin
    process(i,s)
	        begin
			       case s is
			         when"00" =>o<="00"&i(1)&i(0);
						when"01" =>o<='0'&i(1)&i(0)&'0';
						when"10" =>o<=i(1)&i(0)&"00";
						when"11" =>o<=i(0)&"00"&i(1);
						when others => null;
		          end case;
	 end process;
		
end Behavioral;

