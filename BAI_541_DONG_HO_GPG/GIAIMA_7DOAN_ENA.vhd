----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:20 02/14/2023 
-- Design Name: 
-- Module Name:    GIAIMA_7DOAN_ENA_DP - Behavioral 
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

entity GIAIMA_7DOAN_ENA is
    Port ( SO_GMA : in  STD_LOGIC_VECTOR (3 downto 0);
           ENA : in  STD_LOGIC;
           DP : in  STD_LOGIC;
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0));
end GIAIMA_7DOAN_ENA;

architecture Behavioral of GIAIMA_7DOAN_ENA is
SIGNAL SS7: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL SS8: STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
		SS8 <= DP& SS7 ;
		SSEG <= SS8 WHEN ENA='1' ELSE X"00";
	PROCESS(SO_GMA)
	BEGIN
		
			CASE SO_GMA IS
			WHEN X"0" => SS7 <= "0111111"; --0
			WHEN X"1" => SS7 <= "0000110"; --1
			WHEN X"2" => SS7 <= "1011011"; --2
			WHEN X"3" => SS7 <= "1001111"; --3
			WHEN X"4" => SS7 <= "1100110"; --4
			WHEN X"5" => SS7 <= "1101101"; --5
			WHEN X"6" => SS7 <= "1111101"; --6
			WHEN X"7" => SS7 <= "0000111"; --7
			WHEN X"8" => SS7 <= "1111111"; --8
			WHEN X"9" => SS7 <= "1101111"; --9
			WHEN X"A" => SS7 <= "1110111"; --A
			WHEN X"B" => SS7 <= "1111100"; --B
			WHEN X"C" => SS7 <= "0111001"; --C
			WHEN X"D" => SS7 <= "1011110"; --D
			WHEN X"E" => SS7 <= "1111001"; --E
			WHEN OTHERS => SS7 <= "1110001"; --F
		END CASE;
		
	END PROCESS;	
		
end Behavioral;

