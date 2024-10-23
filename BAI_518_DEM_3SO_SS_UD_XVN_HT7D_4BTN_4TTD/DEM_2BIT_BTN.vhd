----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:01 02/22/2023 
-- Design Name: 
-- Module Name:    DEM_1BIT_BTN - Behavioral 
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

entity DEM_2BIT_BTN is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           BTN : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(1 DOWNTO 0));
end DEM_2BIT_BTN;

architecture Behavioral of DEM_2BIT_BTN is
SIGNAL XCDLH: STD_LOGIC;
BEGIN
 U1: ENTITY WORK.CD_LAM_HEP_BTN
  PORT MAP(CKHT => CKHT,
           BTN => BTN,
			  XCDLH =>XCDLH);
 U2: ENTITY WORK.DEM_2BIT
  PORT MAP( CKHT => CKHT,
           RST => RST,
			   ENA_DB => XCDLH,
				Q => Q);



end Behavioral;

