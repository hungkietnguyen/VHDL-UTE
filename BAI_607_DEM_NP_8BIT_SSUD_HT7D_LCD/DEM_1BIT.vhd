----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:24 02/16/2023 
-- Design Name: 
-- Module Name:    DEM_4BIT - Behavioral 
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

entity DEM_1BIT is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENA_DB : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DEM_1BIT;

architecture Behavioral of DEM_1BIT is
SIGNAL Q_R, Q_N : STD_LOGIC;
BEGIN
 PROCESS(CKHT, RST)
  BEGIN
   IF RST ='1' THEN Q_R <= '0';
	 ELSIF FALLING_EDGE(CKHT) THEN Q_R <= Q_N;
	 END IF;
 END PROCESS;
	 Q_N <= NOT Q_R WHEN ENA_DB = '1' ELSE Q_R;
	 Q <= Q_R;
	

end Behavioral;

