----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:06:39 02/22/2023 
-- Design Name: 
-- Module Name:    CD_LAM_HEP_BTN - Behavioral 
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

entity CD_LAM_HEP_BTN is
    Port ( CKHT : in  STD_LOGIC;
           BTN : in  STD_LOGIC;
           XCDLH : out  STD_LOGIC);
end CD_LAM_HEP_BTN;

architecture Behavioral of CD_LAM_HEP_BTN is
SIGNAL XCD: STD_LOGIC;
BEGIN
U1: ENTITY WORK.DEBOUNCE_BTN
  PORT MAP (CKHT => CKHT,
            BTN => BTN,
				DB_TICK => XCD);
U2: ENTITY WORK.LAM_HEP_XUNG
    PORT MAP(CKHT => CKHT,
             D => XCD,
            Q => XCDLH);	


end Behavioral;

