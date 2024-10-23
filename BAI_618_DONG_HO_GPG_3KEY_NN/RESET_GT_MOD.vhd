----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:51 04/08/2023 
-- Design Name: 
-- Module Name:    RESET_GT_MOD - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RESET_GT_MOD is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENA_DB : in  STD_LOGIC;
           CDB_UP : in  STD_LOGIC;
           CDB_DW : in  STD_LOGIC;
           RST_1 : out  STD_LOGIC;
           GT_MOD : in  STD_LOGIC_VECTOR (1 downto 0));
end RESET_GT_MOD;

architecture Behavioral of RESET_GT_MOD is
SIGNAL DEM_R , DEM_N : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RST_T : STD_LOGIC;
begin
	PROCESS(CKHT, RST)
	BEGIN
		IF RST='1' THEN DEM_R <="0000";
		ELSIF FALLING_EDGE(CKHT) THEN DEM_R <= DEM_N;
		END IF;
	END PROCESS;
	
	PROCESS(DEM_R,ENA_DB,CDB_UP,CDB_DW,GT_MOD)
	BEGIN
		DEM_N <= DEM_R;
		IF GT_MOD ="00" THEN DEM_N <="0000";
		ELSIF CDB_UP = '0' AND CDB_DW ='0' THEN 
			IF ENA_DB ='1' THEN DEM_N <= DEM_R +1;
			END IF;
		ELSE DEM_N <="0000";
		END IF;
		
		IF DEM_R ="1111" THEN RST_T <='1'; 
		ELSE RST_T <='0';
		END IF;
	END PROCESS;
	RST_1 <= RST_T;
	
end Behavioral;

