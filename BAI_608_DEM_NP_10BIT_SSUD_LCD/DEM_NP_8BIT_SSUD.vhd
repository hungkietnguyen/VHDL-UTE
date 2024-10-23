----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:06:10 03/25/2023 
-- Design Name: 
-- Module Name:    DEM_NP_8BIT_SSUD - Behavioral 
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

entity DEM_NP_8BIT_SSUD is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENA_SS, ENA_UD, ENA_DB : in  STD_LOGIC;
           DEM : out  STD_LOGIC_VECTOR (7 downto 0));
end DEM_NP_8BIT_SSUD;

architecture Behavioral of DEM_NP_8BIT_SSUD is
SIGNAL DEM_R, DEM_N : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL ENA: STD_LOGIC:='0';
BEGIN
 PROCESS(CKHT, RST,ENA_UD)
  BEGIN
   IF RST ='1' THEN 
	
			IF  ENA_UD ='0' THEN DEM_R <= X"00";
			ELSE DEM_R <= X"FF";
			END IF;
			
	 ELSIF FALLING_EDGE(CKHT) THEN DEM_R <= DEM_N;
	 END IF;
 END PROCESS;
-- NEXT-STATE LOGIC
	ENA <= ENA_SS AND ENA_DB;
	PROCESS(DEM_R, ENA ,ENA_UD)
	BEGIN
	DEM_N <= DEM_R;
	IF ENA ='1' AND ENA_UD ='1' THEN 
												DEM_N <= DEM_R + 1;
	ELSIF ENA ='1' AND ENA_UD ='0' THEN 
												DEM_N <=  DEM_R - 1;
	END IF;
	END PROCESS;
--OUTPUT LOGIC	
	DEM <= DEM_R;


end Behavioral;

