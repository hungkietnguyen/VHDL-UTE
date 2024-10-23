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

entity DEM_2BIT is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENA_DB : in  STD_LOGIC;
			  TG_NN : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
           Q : out  STD_LOGIC_VECTOR(1 DOWNTO 0));
end DEM_2BIT;

architecture Behavioral of DEM_2BIT is
SIGNAL Q_REG, Q_NEXT: STD_LOGIC_VECTOR(1 DOWNTO 0);
begin
PROCESS(CKHT,RST)

BEGIN
  IF RST='1' THEN Q_REG<=(OTHERS => '0');
  ELSIF FALLING_EDGE(CKHT) THEN Q_REG<=Q_NEXT;
 END IF;
 END PROCESS;
 
  Q_NEXT<= Q_REG +1 WHEN ENA_DB ='1' ELSE
			  "00"   WHEN TG_NN = "10100" ELSE
		     Q_REG;
  Q<=Q_REG;	

end Behavioral;

