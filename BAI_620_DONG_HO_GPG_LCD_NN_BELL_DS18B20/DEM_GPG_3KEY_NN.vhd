----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:32 04/08/2023 
-- Design Name: 
-- Module Name:    DEM_GPG_3KEY_NN - Behavioral 
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

entity DEM_GPG_3KEY_NN is
    Port ( CKHT : in  STD_LOGIC;
           ENA_DB : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           BTN_UP : in  STD_LOGIC;
           BTN_DW : in  STD_LOGIC;
           BTN_MOD : in  STD_LOGIC;
           ENA5HZ : in  STD_LOGIC;
			  
           CD_BUP : out  STD_LOGIC;
           CD_BDW : out  STD_LOGIC;
			  XK_BELL : out STD_LOGIC;
           GT_MOD : out  STD_LOGIC_VECTOR (1 downto 0);
           GIAY : out  STD_LOGIC_VECTOR (5 downto 0);
           PHUT : out  STD_LOGIC_VECTOR (5 downto 0);
           GIO : out  STD_LOGIC_VECTOR (5 downto 0));
end DEM_GPG_3KEY_NN;

architecture Behavioral of DEM_GPG_3KEY_NN is
SIGNAL PHUT1: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL GTMOD: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL CDB_UP, CDB_DW, RST_MOD, RST_1: STD_LOGIC;
begin
	GT_MOD <= GTMOD;
	CD_BUP <= CDB_UP;
	CD_BDW <= CDB_DW;
K1: ENTITY WORK.DEBOUNCE_BTN
	PORT MAP(CKHT => CKHT,
				BTN => BTN_UP,
				DB_TICK => CDB_UP);
				
K2: ENTITY WORK.DEBOUNCE_BTN
	PORT MAP(CKHT => CKHT,
				BTN => BTN_DW,
				DB_TICK => CDB_DW);
				
K3: ENTITY WORK.XULY_MOD				
	PORT MAP(CKHT => CKHT,
				RST => RST_MOD,
				BTN => BTN_MOD,
				GT_MOD => GTMOD);
				
	RST_MOD <= RST OR RST_1;
	
K4: ENTITY WORK.SS_PHUT_XBELL				
	PORT MAP(CKHT => CKHT,
				PHUT => PHUT1,
				XK_BELL => XK_BELL);
				
K5: ENTITY WORK.RESET_GT_MOD
	PORT MAP(CKHT => CKHT,
				RST  => RST,
				ENA_DB => ENA_DB,
				CDB_UP => CDB_UP,
				CDB_DW => CDB_DW,
				GT_MOD => GTMOD,
				RST_1  => RST_1);
				
K6: ENTITY WORK.DEM_GPG_MUD
   PORT MAP( CKHT => CKHT,	
				 RST => RST,
				 ENA_DB => ENA_DB,
				 CDB_UP =>CDB_UP,
				 CDB_DW => CDB_DW,
				 ENA5HZ => ENA5HZ,
				 GT_MOD => GTMOD,
				 
				 GIO => GIO,
				 PHUT => PHUT1,
				 GIAY => GIAY);
PHUT <= PHUT1;				 
end Behavioral;

