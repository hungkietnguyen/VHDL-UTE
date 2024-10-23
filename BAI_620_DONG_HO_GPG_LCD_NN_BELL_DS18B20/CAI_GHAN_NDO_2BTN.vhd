----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:22:04 04/08/2023 
-- Design Name: 
-- Module Name:    CAI_GHAN_NDO_2BTN - Behavioral 
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

entity CAI_GHAN_NDO_2BTN is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENA2HZ : in  STD_LOGIC;
           BTN_UP : in  STD_LOGIC;
           BTN_DW : in  STD_LOGIC;
           XK_BELL : out  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (5 downto 0));
end CAI_GHAN_NDO_2BTN;

architecture Behavioral of CAI_GHAN_NDO_2BTN is
SIGNAL XCD_UP, XCD_DW,XCD_UD: STD_LOGIC;
begin
U1: ENTITY WORK.DEBOUNCE_BTN
	PORT MAP(CKHT => CKHT,
				BTN => BTN_UP,
				DB_TICK => XCD_UP);
				
U2: ENTITY WORK.DEBOUNCE_BTN
	PORT MAP(CKHT => CKHT,
				BTN => BTN_DW,
				DB_TICK => XCD_DW);	

U3: ENTITY WORK.DEM_NP_6BIT_UD
	PORT MAP( CKHT => CKHT,
				 RST  => RST,
				 ENA_DB => ENA2HZ,
				 ENA_UP => XCD_UP,
				 ENA_DW => XCD_DW,
				 Q      => Q);

	XCD_UD <= XCD_UP OR XCD_DW;
U4: ENTITY WORK.LAM_HEP_XUNG
	 PORT MAP( CKHT => CKHT,
				  D    => XCD_UD,
				  Q    => XK_BELL);
				

end Behavioral;

