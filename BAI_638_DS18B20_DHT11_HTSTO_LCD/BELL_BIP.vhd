----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:59:33 03/23/2023 
-- Design Name: 
-- Module Name:    BELL_BIP - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BELL_BIP is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           TG_BIP : in  STD_LOGIC;
           XK_BELL : in  STD_LOGIC;
           BELL : out  STD_LOGIC);
end BELL_BIP;

architecture Behavioral of BELL_BIP is
SIGNAL Q_R, Q_N : STD_LOGIC;
BEGIN
 PROCESS(CKHT, RST)
  BEGIN
   IF RST ='1' THEN Q_R <= '0';
	 ELSIF FALLING_EDGE(CKHT) THEN Q_R <= Q_N;
	 END IF;
 END PROCESS;
	PROCESS(Q_R, TG_BIP, XK_BELL)
	BEGIN
	Q_N <= Q_R;
	IF XK_BELL ='1' THEN Q_N <='1';
	ELSIF TG_BIP ='1' THEN Q_N <='0';
	END IF;
	END PROCESS;
	BELL <= Q_R;
end Behavioral;

