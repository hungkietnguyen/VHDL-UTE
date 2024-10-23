----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:26:22 03/30/2023 
-- Design Name: 
-- Module Name:    DEM_MOD_20_NN - Behavioral 
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

entity DEM_MOD_20_NN is
    Port ( CKHT  : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CDB_UP : in  STD_LOGIC;
           CDB_DW : in  STD_LOGIC;
           ENA2HZ : in  STD_LOGIC;
           GT_MOD_T : in  STD_LOGIC_VECTOR (1 downto 0);
           ENA_8LED : out  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (4 downto 0));
end DEM_MOD_20_NN;

architecture Behavioral of DEM_MOD_20_NN is
SIGNAL Q_R, Q_N : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL ENA_R : STD_LOGIC_VECTOR(7 DOWNTO 0):=X"FF";
SIGNAL ENA_N : STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
	PROCESS(CKHT,RST)
	BEGIN
		IF RST='1' THEN Q_R <= "00000";
							 ENA_R <= "11011011";
		ELSIF FALLING_EDGE(CKHT) THEN 
												Q_R <= Q_N;
												ENA_R <= ENA_N;
		END IF;
	END PROCESS;

	PROCESS(CDB_UP, CDB_DW, ENA2HZ, ENA_R, Q_R, GT_MOD_T)
	BEGIN
		ENA_N <= ENA_R;
		Q_N <= Q_R;
		IF GT_MOD_T="01" THEN 
			IF(CDB_UP='0' AND CDB_DW='0') THEN
				IF ENA2HZ ='1' THEN
								ENA_N <= "110110" & NOT ENA_R(1 DOWNTO 0);
								Q_N <= Q_R +1;
				END IF;
			ELSE ENA_N <= X"DB";
					Q_N   <= "00000";
			END IF;
		
		ELSIF GT_MOD_T="10" THEN 
			IF(CDB_UP='0' AND CDB_DW='0') THEN
				IF ENA2HZ ='1' THEN
								ENA_N <= "110" & NOT ENA_R(4 DOWNTO 3)&"011";
								Q_N <= Q_R +1;
				END IF;
			ELSE ENA_N <= X"DB";
					Q_N   <= "00000";
			END IF;
			
		ELSIF GT_MOD_T="11" THEN 
			IF(CDB_UP='0' AND CDB_DW='0') THEN
				IF ENA2HZ ='1' THEN
								ENA_N <= NOT ENA_R(7 DOWNTO 6)&"011011";
								Q_N <= Q_R +1;
				END IF;
			ELSE ENA_N <= X"DB";
					Q_N   <= "00000";
			END IF;
			
		ELSE ENA_N <= X"DB";
			  Q_N   <= "00000";
		END IF;
	END PROCESS;
	
	Q <=Q_R;
	ENA_8LED <= ENA_R;
end Behavioral;

