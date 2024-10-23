----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:08:51 05/23/2022 
-- Design Name: 
-- Module Name:    DEM_NP_6BIT_UD - Behavioral 
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

entity DEM_NP_6BIT_UD is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  ENA_DB: in  STD_LOGIC;
           ENA_UP : in  STD_LOGIC;
           ENA_DW : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (5 downto 0));
end DEM_NP_6BIT_UD;

architecture Behavioral of DEM_NP_6BIT_UD is
SIGNAL Q_R: STD_LOGIC_VECTOR ( 5 DOWNTO 0):="100101";
SIGNAL Q_N: STD_LOGIC_VECTOR (5 DOWNTO 0);
SIGNAL ENA_U,ENA_D:STD_LOGIC;
begin
	PROCESS(CKHT, RST)
	BEGIN
		IF RST ='1'  	THEN    Q_R  <= "100101";
		ELSIF FALLING_EDGE(CKHT) THEN Q_R  <= Q_N;
		END IF;
	END PROCESS;
	
	ENA_U <= ENA_DB AND ENA_UP;
	ENA_D <= ENA_DB AND ENA_DW;
	
	Q_N  <= Q_R +1  WHEN ENA_U ='1' AND Q_R  <"110000" ELSE
	        Q_R -1  WHEN ENA_D ='1' AND Q_R  >"001111" ELSE
			  Q_R;
	
	Q    <= Q_R;

end Behavioral;

