----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:48:44 03/22/2023 
-- Design Name: 
-- Module Name:    CAI_GHAN_2SO - Behavioral 
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

entity CAI_GHAN_2SO is
    Port ( CKHT : in  STD_LOGIC;
           RST_GH : in  STD_LOGIC;
           ENA_UP : in  STD_LOGIC;
           ENA_DW : in  STD_LOGIC;
           ENA_DB : in  STD_LOGIC;
           DONVI : out  STD_LOGIC_VECTOR (3 downto 0);
           CHUC : out  STD_LOGIC_VECTOR (3 downto 0));
end CAI_GHAN_2SO;

architecture Behavioral of CAI_GHAN_2SO is
SIGNAL DONVI_R: STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL DONVI_N : STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL CHUC_R: STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL CHUC_N : STD_LOGIC_VECTOR( 3 DOWNTO 0);

begin
	PROCESS(CKHT,RST_GH)
	BEGIN
		IF RST_GH='1' THEN 	 DONVI_R <= X"0";
									 CHUC_R <= X"5";
		
		ELSIF FALLING_EDGE(CKHT) THEN DONVI_R <= DONVI_N;
												CHUC_R <= CHUC_N;
		END IF;
	END PROCESS;
--NEXT-STATE LOGIC	

	 PROCESS(DONVI_R,CHUC_R, ENA_DB,ENA_UP,ENA_DW)
	 BEGIN 
	  DONVI_N <= DONVI_R;
	  CHUC_N <= CHUC_R;
	 IF ENA_DB ='1' THEN 
		IF ENA_UP ='1' THEN 
		IF CHUC_R=X"9" AND DONVI_R =X"9" THEN DONVI_N <= X"0";
															CHUC_N <= X"0";
		
		ELSIF 			DONVI_R =X"9" THEN DONVI_N <= X"0";
														CHUC_N <= CHUC_R +1;
		 ELSE 					 DONVI_N <= DONVI_R +1;					
		 END IF;
		 
		ELSIF ENA_DW ='1' THEN 
			IF CHUC_R =X"0" AND DONVI_R =X"0"  THEN DONVI_N <= X"9";
																 CHUC_N <= X"9";
			ELSIF 			DONVI_R =X"0" THEN DONVI_N <= X"9";	
														 CHUC_N <= CHUC_R -1;													 
			ELSE 					 DONVI_N <= DONVI_R -1;
			END IF;	
		END IF; 
		END IF;
	 END PROCESS;
--OUTPUT LOGIC
 DONVI <= DONVI_R;
 CHUC <= CHUC_R;


end Behavioral;

