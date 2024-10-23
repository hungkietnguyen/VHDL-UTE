----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:13:46 02/11/2023 
-- Design Name: 
-- Module Name:    dahop_4kenh_1be_if - Behavioral 
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

entity dahop_4kenh_1be_if is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           e : in  STD_LOGIC;
           o : out  STD_LOGIC);
end dahop_4kenh_1be_if;
architecture Behavioral of dahop_4kenh_1be_if is
begin
    process(i,s,e)
	      begin
			      if e='1' then
					       if s="00" then o<=i(0);
							 elsif s="01" then o<=i(1);
							 elsif s="10" then o<=i(2);
							 else                     o<=i(3);
							 end if;
					else o<='0';
					end if;
		end process;
end Behavioral;

