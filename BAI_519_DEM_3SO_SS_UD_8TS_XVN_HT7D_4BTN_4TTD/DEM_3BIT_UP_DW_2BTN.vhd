----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:34:59 02/23/2023 
-- Design Name: 
-- Module Name:    DEM_4BIT_UP_DW_2BTN - Behavioral 
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

entity DEM_3BIT_UP_DW_2BTN is
    Port ( CKHT  : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           BTN_UP : in  STD_LOGIC;
           BTN_DW : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0));
end DEM_3BIT_UP_DW_2BTN;

architecture Behavioral of DEM_3BIT_UP_DW_2BTN is
SIGNAL XCDLH_UP, XCDLH_DW: STD_LOGIC;
begin
	IC1: ENTITY WORK.CD_LAM_HEP_BTN
		PORT MAP( CKHT => CKHT,
					 BTN => BTN_UP,
					 XCDLH => XCDLH_UP);
	IC2: ENTITY WORK.CD_LAM_HEP_BTN 
		PORT MAP( CKHT => CKHT,
					 BTN  => BTN_DW,
					XCDLH =>XCDLH_DW);
	IC3: ENTITY WORK.DEM_3BIT_UD
		PORT MAP( CKHT => CKHT,
					 RST => RST,
					 ENA_UP => XCDLH_UP,
					 ENA_DW => XCDLH_DW,
					 Q => Q);
end Behavioral;

