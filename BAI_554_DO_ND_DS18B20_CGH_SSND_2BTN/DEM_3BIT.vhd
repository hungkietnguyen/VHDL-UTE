----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:12:40 05/04/2022 
-- Design Name: 
-- Module Name:    dem_3bit - Behavioral 
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

entity DEM_3BIT is
    Port (CKHT : IN  STD_LOGIC;
           ENA1KHZ : IN  STD_LOGIC;
           Q : OUT  STD_LOGIC_VECTOR (2 DOWNTO 0));
end DEM_3BIT;

architecture Behavioral of DEM_3BIT is
SIGNAL Q_R , Q_N : STD_LOGIC_VECTOR(2 DOWNTO 0 ):="000";
BEGIN
PROCESS(CKHT)
		BEGIN 
				IF FALLING_EDGE(CKHT) THEN Q_R <= Q_N;
				END IF;
		END PROCESS;
		Q_N <=  Q_R + 1 WHEN ENA1KHZ ='1' ELSE
					Q_R;
		Q <= Q_R;



end Behavioral;

