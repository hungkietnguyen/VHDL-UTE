----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:35:45 04/08/2023 
-- Design Name: 
-- Module Name:    XULY_MOD - Behavioral 
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

entity XULY_MOD is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           BTN : in  STD_LOGIC;
           GT_MOD : out  STD_LOGIC_VECTOR (1 downto 0));
end XULY_MOD;

architecture Behavioral of XULY_MOD is
SIGNAL XCD,XCDLH: STD_LOGIC;
begin
U1: ENTITY WORK.DEBOUNCE_BTN
	PORT MAP( CKHT => CKHT,
				 BTN => BTN,
				 DB_TICK =>XCD);
				 
U2: ENTITY WORK.LAM_HEP_XUNG
	PORT MAP(CKHT => CKHT,
				D    => XCD,
				Q    => XCDLH);	
				
U3: ENTITY WORK.DEM_2BIT
	PORT MAP(CKHT => CKHT,
				RST  => RST,
				ENA_DB => XCDLH,
				Q     => GT_MOD);
end Behavioral;

