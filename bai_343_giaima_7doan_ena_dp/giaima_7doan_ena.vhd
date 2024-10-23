----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:10:46 02/13/2023 
-- Design Name: 
-- Module Name:    giaima_7doan_ena - Behavioral 
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

entity giaima_7doan_ena is
    Port ( so_gma : in  STD_LOGIC_VECTOR (3 downto 0);
           sseg : out  STD_LOGIC_VECTOR (7 downto 0);
           ena : in  STD_LOGIC;
           dp : in  STD_LOGIC);
end giaima_7doan_ena;
architecture Behavioral of giaima_7doan_ena is
signal ss:  STD_LOGIC_VECTOR (6 downto 0);
begin
    process(ena,so_gma)
	      begin
			   if ena='0' then ss<="0000000";
				else
			       case so_gma is
						 when x"0" =>ss<="0111111";
						 when x"1" =>ss<="0000110";
						 when x"2" =>ss<="1011011";
						 when x"3" =>ss<="1001111";
						 when x"4" =>ss<="1100110";
						 when x"5" =>ss<="1101101";
						 when x"6" =>ss<="1111101";
						 when x"7" =>ss<="0000111";
						 when x"8" =>ss<="1111111";
						 when x"9" =>ss<="1101111";
						 when x"a" =>ss<="1110111";
						 when x"b" =>ss<="1111100";
						 when x"c" =>ss<="0111001";
						 when x"d" =>ss<="1011110";
						 when x"e" =>ss<="1111001";
						 when others =>ss<="1110001";
					 end case;
				 end if;
		end process;
      sseg <= dp & ss;
end Behavioral;

