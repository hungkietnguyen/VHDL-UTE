----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:43:59 02/08/2023 
-- Design Name: 
-- Module Name:    mahoa_42he_if - Behavioral 
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

entity mahoa_42he_if is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (1 downto 0);
           e : in  STD_LOGIC;
           act : out  STD_LOGIC);
end mahoa_42he_if;
architecture Behavioral of mahoa_42he_if is
begin
       process(i,e)
		          begin
					         if e='1' then 
								     if i(3)='1' then o<="11";
									  elsif i(2)='1' then o<="10";
									  elsif i(1)='1' then o<="01";
									  else                 o<="00";
									  end if;
								else o<="00";
								end if;
								if e='0' then act<='0';
								else act<= not (i(3) or i(2) or i(1) or i(0));
								end if;
			end process;
end Behavioral;

