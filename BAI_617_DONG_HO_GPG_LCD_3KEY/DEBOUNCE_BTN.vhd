----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:13:58 04/06/2022 
-- Design Name: 
-- Module Name:    DEBOUNCE_BTN - Behavioral 
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

entity DEBOUNCE_BTN is
    Port ( CKHT : in  STD_LOGIC;
           BTN : in  STD_LOGIC;
           DB_TICK : out  STD_LOGIC);
end DEBOUNCE_BTN;

architecture Behavioral of DEBOUNCE_BTN is
CONSTANT N: INTEGER:=20;
TYPE DB_STATE IS (ZERO, WAIT0, ONE, WAIT1);
SIGNAL DB_R, DB_N: DB_STATE;
SIGNAL DL_R, DL_N: UNSIGNED(N-1 DOWNTO 0);
begin
	PROCESS(CKHT)
	BEGIN
		IF FALLING_EDGE(CKHT) THEN DB_R <= DB_N;
											DL_R <= DL_N;
		END IF;
	END PROCESS;
	
	PROCESS(DL_R, DB_R, BTN)
	BEGIN
		DL_N <= DL_R;
		DB_N <= DB_R;
		
		CASE DB_R IS
			WHEN ZERO  => DB_TICK <= '0';
							 IF BTN = '1' THEN DB_N <= WAIT1;
													 DL_N <= (OTHERS => '1');
							 END IF;
			WHEN WAIT1 =>  DB_TICK <= '0';
								DL_N <= DL_R - 1;
								IF DL_R = 0 THEN
									IF BTN = '1' THEN DB_N <= ONE;
									ELSE              DB_N <= ZERO;
									END IF;
								END IF;
			WHEN ONE   => DB_TICK <= '1';
							 IF BTN = '0' THEN DB_N <= WAIT0;
													 DL_N <= (OTHERS => '1');
							 END IF;
			WHEN WAIT0 => DB_TICK <= '0';
							  DL_N <= DL_R - 1;
							  IF DL_R = 0 THEN
								IF BTN = '0' THEN DB_N <= ZERO;
								ELSE              DB_N <= ONE;
								END IF;
							  END IF;
		END CASE;
	END PROCESS;
end Behavioral;

