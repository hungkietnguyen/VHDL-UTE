----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:40 03/16/2023 
-- Design Name: 
-- Module Name:    AUTO_DAO_ENA_UD - Behavioral 
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

entity AUTO_DAO_ENA_UD is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENA_UD : out  STD_LOGIC;
           Q : in  STD_LOGIC_VECTOR (7 downto 0));
end AUTO_DAO_ENA_UD;

architecture Behavioral of AUTO_DAO_ENA_UD is
SIGNAL UD_R, UD_N: STD_LOGIC;
begin
PROCESS(CKHT,RST)

BEGIN
  IF RST='1' THEN UD_R<= '0';
  ELSIF FALLING_EDGE(CKHT) THEN UD_R<=UD_N;
 END IF;
 END PROCESS;
 
  UD_N<= '0' WHEN Q =X"99" ELSE
		   '1' WHEN Q =X"00" ELSE
	       UD_R ;	

 ENA_UD <= UD_R;
end Behavioral;

