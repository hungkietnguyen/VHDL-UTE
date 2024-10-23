----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:20:35 05/16/2023 
-- Design Name: 
-- Module Name:    DEM_GPG_3KEY - Behavioral 
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

entity DEM_GPG_3KEY is
    Port ( CKHT : in  STD_LOGIC;
	        ENA_DB : in  STD_LOGIC;
           BTN_UP : in  STD_LOGIC;
           BTN_DW : in  STD_LOGIC;
			  BTN_MOD : in  STD_LOGIC;
           ENA5HZ : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DC_8LED : out  STD_LOGIC_VECTOR (7 downto 0);
           GIO : out  STD_LOGIC_VECTOR (5 downto 0);
           PHUT : out  STD_LOGIC_VECTOR (5 downto 0);
           GIAY : out  STD_LOGIC_VECTOR (5 downto 0));
end DEM_GPG_3KEY;
architecture Behavioral of DEM_GPG_3KEY is
SIGNAL GT_MOD: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL CDB_UP,CDB_DW: STD_LOGIC;
begin
K1: ENTITY WORK.DEBOUNCE_BTN
	 PORT MAP(CKHT => CKHT,
				BTN => BTN_UP,
				DB_TICK => CDB_UP);
				
K2: ENTITY WORK.DEBOUNCE_BTN
	 PORT MAP(CKHT => CKHT,
				BTN => BTN_DW,
				DB_TICK => CDB_DW);
				
K3: ENTITY WORK.XULY_MOD_DC				
	 PORT MAP(CKHT => CKHT,
				RST => RST,
				BTN_MOD => BTN_MOD,
				GT_MOD => GT_MOD,
				DC_8LED => DC_8LED);

K4: ENTITY WORK.DEM_GPG_MUD
    PORT MAP( CKHT => CKHT,	
				 RST => RST,
				 ENA_DB => ENA_DB,
				 CDB_UP =>CDB_UP,
				 CDB_DW => CDB_DW,
				 ENA5HZ => ENA5HZ,
				 GT_MOD => GT_MOD,
				 GIO => GIO,
				 PHUT => PHUT,
				 GIAY => GIAY);
end Behavioral;
				 
				

