----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:11 02/16/2023 
-- Design Name: 
-- Module Name:    DEM_8BIT_UD_SS - Behavioral 
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

entity DEM_2SO_SSUD  is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENA_DB : in  STD_LOGIC;
           ENA_SS : in  STD_LOGIC;
           ENA_UD : in  STD_LOGIC;
           DONVI,CHUC : out  STD_LOGIC_VECTOR (3 downto 0));
end DEM_2SO_SSUD ;

architecture Behavioral of DEM_2SO_SSUD is
SIGNAL DONVI_R, DONVI_N : STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL CHUC_R, CHUC_N : STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL ENA: STD_LOGIC:='0';
begin
	PROCESS(CKHT,RST,ENA_UD)
	BEGIN
		IF RST='1' THEN 
			IF ENA_UD='1' THEN DONVI_R <=X"0";
									 CHUC_R <= X"0";
			ELSE 					 DONVI_R <= X"9";
									 CHUC_R <= X"9";
			END IF;
		ELSIF RISING_EDGE(CKHT) THEN DONVI_R <= DONVI_N;
												CHUC_R <= CHUC_N;
		END IF;
	END PROCESS;
--NEXT-STATE LOGIC	
	 ENA <= ENA_DB AND ENA_SS;
	 PROCESS(DONVI_R,CHUC_R, ENA,ENA_UD)
	 BEGIN 
	  DONVI_N <= DONVI_R;
	  CHUC_N <= CHUC_R;
	 IF ENA ='1' AND ENA_UD ='1' THEN 
		IF CHUC_R=X"9" AND DONVI_R =X"9" THEN DONVI_N <= X"0";
														CHUC_N <= X"0";
		
		ELSIF 			DONVI_R =X"9" THEN DONVI_N <= X"0";
														CHUC_N <= CHUC_R +1;
		 ELSE 					 DONVI_N <= DONVI_R +1;					
		 END IF;
		 
		ELSIF ENA ='1' AND ENA_UD ='0' THEN 
			IF CHUC_R =X"0" AND DONVI_R =X"0"  THEN DONVI_N <= X"9";
																 CHUC_N <= X"9";
			ELSIF 			DONVI_R =X"0" THEN DONVI_N <= X"9";	
														 CHUC_N <= CHUC_R -1;
			ELSE 					 DONVI_N <= DONVI_R -1;
		 END IF;	
		END IF; 
	 END PROCESS;
--OUTPUT LOGIC
 DONVI <= DONVI_R;
 CHUC <= CHUC_R;
end Behavioral;

