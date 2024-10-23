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

entity DEM_3SO is
    Port ( ENA_DB, CKHT, RST , ENA_SS : in  STD_LOGIC;
           DONVI, CHUC, TRAM : out  STD_LOGIC_VECTOR (3 downto 0));
end DEM_3SO;

architecture Behavioral of DEM_3SO is
SIGNAL ENA: STD_LOGIC;
SIGNAL DONVI_R, DONVI_N,CHUC_R, CHUC_N,TRAM_R, TRAM_N: STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
--REGISTER
	PROCESS(CKHT,RST)
	BEGIN 
		IF RST='1' THEN DONVI_R <= "0000";
							CHUC_R <= "0000";
							TRAM_R <= "0000";
		ELSIF FALLING_EDGE(CKHT) THEN DONVI_R <= DONVI_N;
												CHUC_R <= CHUC_N;
												TRAM_R <= TRAM_N;
		END IF;
	END PROCESS;
--NEXT_STATE_LOGIC
	ENA <= ENA_SS AND ENA_DB;
   PROCESS(TRAM_R,CHUC_R,DONVI_R,ENA)
   BEGIN
	DONVI_N <= DONVI_R;
	CHUC_N  <= CHUC_R;
	TRAM_N <= TRAM_R;
	IF ENA='1' THEN
		
		
		IF DONVI_R=X"9" THEN DONVI_N <= DONVI_R +1;
		ELSE 		DONVI_N <= X"0";
					CHUC_N <= CHUC_R +1;

		IF CHUC_R=X"9" THEN CHUC_N <= CHUC_R +1;
				ELSE 		CHUC_N <= X"0";
							TRAM_N <= TRAM_R +1;
		IF TRAM_R =X"9" AND CHUC_R =X"9" AND DONVI_R = X"9" THEN TRAM_N <= X"0";
									CHUC_N <= X"0";
									DONVI_N <=X"0";
				END IF;
				END IF;
	      END IF;
		END IF;
	END PROCESS;
--OUT_LOGIC
 DONVI <= DONVI_R;	
 CHUC <= CHUC_R;
 TRAM <= TRAM_R;

end Behavioral;

