----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:47:32 03/31/2023 
-- Design Name: 
-- Module Name:    giaima_7doan - Behavioral 
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

entity giaima_7doan is
    Port ( so_gma : in  STD_LOGIC_VECTOR(3 downto 0);
           sseg : out  STD_LOGIC_VECTOR (6 downto 0));
end giaima_7doan;

architecture Behavioral of giaima_7doan is
begin
      process(so_gma)
		      begin
				    case so_gma is
						 when x"0" =>sseg<="0111111";
						 when x"1" =>sseg<="0000110";
						 when x"2" =>sseg<="1011011";
						 when x"3" =>sseg<="1001111";
						 when x"4" =>sseg<="1100110";
						 when x"5" =>sseg<="1101101";
						 when x"6" =>sseg<="1111101";
						 when x"7" =>sseg<="0000111";
						 when x"8" =>sseg<="1111111";
						 when x"9" =>sseg<="1101111";
						 when x"a" =>sseg<="1110111";
						 when x"b" =>sseg<="1111100";
						 when x"c" =>sseg<="0111001";
						 when x"d" =>sseg<="1011110";
						 when x"e" =>sseg<="1111001";
						 when others =>sseg<="1110001";
					 end case;
		end process;
end Behavioral;

