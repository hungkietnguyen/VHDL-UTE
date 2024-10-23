----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:02 03/27/2023 
-- Design Name: 
-- Module Name:    XULY_MOD_DC - Behavioral 
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

entity XULY_MOD_DC is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           BTN_MOD : in  STD_LOGIC;
           GT_MOD : out  STD_LOGIC_VECTOR (1 downto 0);
           DC_8LED : out  STD_LOGIC_VECTOR (7 downto 0));
end XULY_MOD_DC;

architecture Behavioral of XULY_MOD_DC is
SIGNAL GT_MOD_T : STD_LOGIC_VECTOR (1 downto 0);
begin
N1: ENTITY WORK.DEM_2BIT_BTN
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 BTN  =>	BTN_MOD,
				 Q    => GT_MOD_T);
			GT_MOD <= GT_MOD_T;		 
N2: ENTITY WORK.DAU_CHAM
	PORT MAP(GT_MOD_T   => GT_MOD_T,
				DC_8LED    => DC_8LED);				 
end Behavioral;

