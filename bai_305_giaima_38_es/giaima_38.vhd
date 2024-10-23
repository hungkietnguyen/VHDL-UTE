----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:36 02/08/2023 
-- Design Name: 
-- Module Name:    giaima_38 - Behavioral 
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

entity giaima_38 is
    Port ( i : in  STD_LOGIC_VECTOR (2 downto 0);
           o : out  STD_LOGIC_VECTOR (7 downto 0);
           e : in  STD_LOGIC;
           s : in  STD_LOGIC);
end giaima_38;

architecture Behavioral of giaima_38 is
signal ot: STD_LOGIC_VECTOR (7 downto 0);
begin
   process(i,e,s)
	    begin
			if e='0'  then ot<="00000000";
				else
					case i is       
						when "000" =>ot<="00000001";
						when "001" =>ot<="00000010";
						when "010" =>ot<="00000100";
						when "011" =>ot<="00001000";
						when "100" =>ot<="00010000";
						when "101" =>ot<="00100000";
						when "110" =>ot<="01000000";
						when others =>ot<="10000000";
					   end case;
			 end if;
			 if s='1' then  o<= ot;
			 else               o<= not ot;
			 end if;
			end process;			
end Behavioral;

