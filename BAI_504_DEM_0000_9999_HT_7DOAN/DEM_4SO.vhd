----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:50:27 03/02/2023 
-- Design Name: 
-- Module Name:    DEM_3SO - Behavioral 
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
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEM_4SO is
    Port ( ENA_DB, CKHT, RST , ENA_SS : in  STD_LOGIC;
           DONVI, CHUC, TRAM,NGAN : out  STD_LOGIC_VECTOR (3 downto 0));
end DEM_4SO;

architecture Behavioral of DEM_4SO is
SIGNAL  DONVI_R, DONVI_N : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL  CHUC_R, CHUC_N : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL  TRAM_R, TRAM_N : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL  NGAN_R, NGAN_N : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ENA: STD_LOGIC;
BEGIN
PROCESS(CKHT, RST)
		BEGIN
				IF RST ='1' THEN DONVI_R <= X"0";
									  CHUC_R <= X"0";
									  TRAM_R <= X"0";
									  NGAN_R <= X"0";
				ELSIF FALLING_EDGE(CKHT) THEN DONVI_R <= DONVI_N;
														CHUC_R <= CHUC_N;
														TRAM_R <= TRAM_N;
														NGAN_R <= NGAN_N;
				END IF;
		END PROCESS;
		
		ENA <= ENA_SS AND ENA_DB;
		PROCESS(NGAN_R,TRAM_R, DONVI_R, CHUC_R, ENA)
		BEGIN
				DONVI_N <= DONVI_R;
				CHUC_N <= CHUC_R;
				TRAM_N <= TRAM_R;
				NGAN_N <= NGAN_R;
				IF ENA ='1' THEN
					   IF NGAN_R =X"9"AND  TRAM_R = X"9" AND CHUC_R =X"9" AND DONVI_R =X"9" 
																	THEN 	DONVI_N <= X"0";
																			CHUC_N <= X"0";
																			TRAM_N <= X"0";
																			NGAN_N <= X"0";
						ELSIF DONVI_R = X"9" THEN DONVI_N <= X"0";
								IF CHUC_R =X"9" THEN CHUC_N <= X"0";
								
									IF TRAM_R =X"9" THEN TRAM_N <= X"0";
																NGAN_N <= NGAN_R + 1;
															
						ELSE 						TRAM_N <= TRAM_R +1;
						END IF;
						
						ELSE 						CHUC_N <= CHUC_R +1;
						END IF;								
						ELSE 								DONVI_N <= DONVI_R +1;
						
						END IF;
					END IF;
				END PROCESS;
		 
		 DONVI 	<= DONVI_R;
		 CHUC 	<= CHUC_R;
		 TRAM 	<= TRAM_R;
		 NGAN 	<= NGAN_R;
end Behavioral;

