----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:18:51 02/11/2023 
-- Design Name: 
-- Module Name:    dahop_4kenh_1be_case - Behavioral 
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

entity dahop_4kenh_1be_case is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           e : in  STD_LOGIC;
           o : out  STD_LOGIC);
end dahop_4kenh_1be_case;
architecture Behavioral of dahop_4kenh_1be_case is
begin 
     process(i,s,e)
	       begin
			       case e&s is
					        when "100" =>o<=i(0);
							  when "101" =>o<=i(1);
							  when "110" =>o<=i(2);
							  when "111" =>o<=i(3);
							  when others =>o<='0';
						end case;
		end process;
end Behavioral;

