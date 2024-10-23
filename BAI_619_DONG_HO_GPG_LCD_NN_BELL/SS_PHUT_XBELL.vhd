----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:22:18 04/13/2023 
-- Design Name: 
-- Module Name:    SS_PHUT_XBELL - Behavioral 
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

entity SS_PHUT_XBELL is
    Port ( CKHT : in  STD_LOGIC;
           PHUT : in  STD_LOGIC_VECTOR (5 downto 0);
           XK_BELL : out  STD_LOGIC);
end SS_PHUT_XBELL;

architecture Behavioral of SS_PHUT_XBELL is
SIGNAL PHUT2_R, PHUT2_N : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL XKT: STD_LOGIC;
begin
	PROCESS(CKHT)
	BEGIN
	 IF FALLING_EDGE(CKHT) THEN PHUT2_R <= PHUT2_N;
	 END IF;
	END PROCESS;
	XK_BELL <= XKT;
	
	PROCESS(PHUT, PHUT2_R)
	BEGIN
		PHUT2_N <= PHUT2_R;
		XKT<= '0';
		IF PHUT2_R/=PHUT THEN PHUT2_N <= PHUT;
									 XKT <='1';
		END IF;
	END PROCESS;

end Behavioral;

