----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:40:35 03/02/2023 
-- Design Name: 
-- Module Name:    DEM_2BIT - Behavioral 
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

entity DEM_2BIT is
	port ( CKHT, ENA1KHZ : IN STD_LOGIC;
				 Q : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)); 
end DEM_2BIT;

architecture Behavioral of DEM_2BIT is
SIGNAL Q_R,Q_N: STD_LOGIC_VECTOR(1 DOWNTO 0);
begin
	PROCESS(CKHT) 
	BEGIN
		IF FALLING_EDGE(CKHT) THEN Q_R<= Q_N;
		END IF;
	END PROCESS;

 Q_N <=  Q_R + 1 WHEN ENA1KHZ ='1' ELSE 
			Q_R;
 Q <= Q_R;
 
end Behavioral;

