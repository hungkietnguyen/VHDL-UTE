----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:33 03/27/2023 
-- Design Name: 
-- Module Name:    DEM_GPG_MUD - Behavioral 
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
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEM_GPG_MUD is
    Port ( CKHT  : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENA_DB : in  STD_LOGIC;
           CDB_UP : in  STD_LOGIC;
           CDB_DW : in  STD_LOGIC;
           ENA5HZ : in  STD_LOGIC;
           GT_MOD : in  STD_LOGIC_VECTOR (1 downto 0);
           GIO, PHUT, GIAY : out  STD_LOGIC_VECTOR (5 downto 0));
end DEM_GPG_MUD;

architecture Behavioral of DEM_GPG_MUD is
SIGNAL GIAY_R, GIAY_N, PHUT_R, PHUT_N: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL GIO_R, GIO_N : STD_LOGIC_VECTOR(4 DOWNTO 0);
begin
	PROCESS (CKHT , RST)
		BEGIN
				IF RST = '1' THEN 		GIAY_R <= "000000";
					    						PHUT_R <= "000000";
												GIO_R  <= "00000";
		
					ELSIF RISING_EDGE(CKHT) THEN 
													GIO_R <= GIO_N;
													PHUT_R <= PHUT_N;
													GIAY_R <= GIAY_N;
				 END IF;
		END PROCESS ;
---NEXT_STATE LOGIC
		PROCESS(GIAY_R, ENA_DB,GT_MOD,CDB_UP,CDB_DW,ENA5HZ)
		BEGIN
				GIAY_N <= GIAY_R;
				IF ENA_DB ='1' THEN
					IF GIAY_R = "111011" THEN GIAY_N <= "000000";
					ELSE 								GIAY_N <= GIAY_R +1;
					END IF;
				ELSIF  GT_MOD="01" AND CDB_UP='1' AND ENA5HZ='1' THEN
					IF GIAY_R = "111011" THEN GIAY_N <= "000000";
					ELSE 								GIAY_N <= GIAY_R +1;
					END IF;
				ELSIF  GT_MOD="01" AND CDB_DW='1' AND ENA5HZ='1' THEN
					IF GIAY_R = "000000" THEN GIAY_N <= "111011";
					ELSE 								GIAY_N <= GIAY_R -1;
					END IF;	
				END IF;
		END PROCESS;

		PROCESS(GIAY_R,PHUT_R, ENA_DB,GT_MOD,CDB_UP,CDB_DW,ENA5HZ)
		BEGIN
			PHUT_N <= PHUT_R;
				IF ENA_DB ='1' AND GIAY_R ="111011" THEN
					IF PHUT_R = "111011" THEN PHUT_N <= "000000";
					ELSE 								PHUT_N <= PHUT_R +1;
					END IF;
				ELSIF  GT_MOD="10" AND CDB_UP='1' AND ENA5HZ='1' THEN
					IF PHUT_R = "111011" THEN PHUT_N <= "000000";
					ELSE 								PHUT_N <= PHUT_R +1;
					END IF;
				ELSIF  GT_MOD="10" AND CDB_DW='1' AND ENA5HZ='1' THEN
					IF PHUT_R = "000000" THEN PHUT_N <= "111011";
					ELSE 								PHUT_N <= PHUT_R -1;
					END IF;	
				END IF;
		END PROCESS;
		
		PROCESS(GIAY_R, PHUT_R, GIO_R, ENA_DB,GT_MOD,CDB_UP,CDB_DW,ENA5HZ)
		BEGIN
			GIO_N <= GIO_R;
				IF ENA_DB ='1' AND GIAY_R ="111011" AND PHUT_R ="111011" THEN
					IF GIO_R = "10111" THEN GIO_N <= "00000";
					ELSE 								GIO_N <= GIO_R +1;
					END IF;
				ELSIF  GT_MOD="11" AND CDB_UP='1' AND ENA5HZ='1' THEN
					IF GIO_R = "10111" THEN GIO_N <= "00000";
					ELSE 								GIO_N <= GIO_R +1;
					END IF;
				ELSIF  GT_MOD="11" AND CDB_DW='1' AND ENA5HZ='1' THEN
					IF GIO_R = "00000" THEN GIO_N <= "10111";
					ELSE 								GIO_N <= GIO_R -1;
					END IF;	
				END IF;
		END PROCESS;
				
--OUTPUT LOGIC
		GIAY <= GIAY_R;
		PHUT <= PHUT_R;
		GIO <= '0'& GIO_R;


end Behavioral;

