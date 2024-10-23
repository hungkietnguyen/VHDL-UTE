----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:52 02/09/2023 
-- Design Name: 
-- Module Name:    GIAIMA_7DOAN - Behavioral 
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

entity GIAIMA_7DOAN is
    Port ( SO_GMA : in  STD_LOGIC_VECTOR (3 downto 0);
           SSEG : out  STD_LOGIC_VECTOR (6 downto 0));
end GIAIMA_7DOAN;

architecture Behavioral of GIAIMA_7DOAN is

begin
	PROCESS(SO_GMA)
	BEGIN 
	 CASE SO_GMA IS
			WHEN X"0" => SSEG <= "0111111"; --0
			WHEN X"1" => SSEG <= "0000110"; --1
			WHEN X"2" => SSEG <= "1011011"; --2
			WHEN X"3" => SSEG <= "1001111"; --3
			WHEN X"4" => SSEG <= "1100110"; --4
			WHEN X"5" => SSEG <= "1101101"; --5
			WHEN X"6" => SSEG <= "1111101"; --6
			WHEN X"7" => SSEG <= "0000111"; --7
			WHEN X"8" => SSEG <= "1111111"; --8
			WHEN X"9" => SSEG <= "1101111"; --9
			WHEN X"A" => SSEG <= "1110111"; --A
			WHEN X"B" => SSEG <= "1111100"; --B
			WHEN X"C" => SSEG <= "0111001"; --C
			WHEN X"D" => SSEG <= "1011110"; --D
			WHEN X"E" => SSEG <= "1111001"; --E
			WHEN OTHERS => SSEG <= "1110001"; --F
		END CASE;
	END PROCESS;		
			
end Behavioral;

