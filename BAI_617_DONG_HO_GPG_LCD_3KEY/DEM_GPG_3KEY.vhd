----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:29:14 03/27/2023 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

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
           RST : in  STD_LOGIC;
           BTN_UP : in  STD_LOGIC;
           BTN_DW : in  STD_LOGIC;
			  GT_MOD: out STD_LOGIC_VECTOR(1 DOWNTO 0);
           BTN_MOD : in  STD_LOGIC;
           ENA5HZ : in  STD_LOGIC;
           GIO, PHUT,GIAY : out  STD_LOGIC_VECTOR (5 downto 0));
end DEM_GPG_3KEY;

architecture Behavioral of DEM_GPG_3KEY is
SIGNAL GTMOD: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL CDB_UP,CDB_DW: STD_LOGIC;
begin
		GT_MOD <= GTMOD;
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
				RST => RST,
				BTN => BTN_MOD,
				GT_MOD => GTMOD);

K4: ENTITY WORK.DEM_GPG_MUD
   PORT MAP( CKHT => CKHT,	
				 RST => RST,
				 ENA_DB => ENA_DB,
				 CDB_UP =>CDB_UP,
				 CDB_DW => CDB_DW,
				 ENA5HZ => ENA5HZ,
				 GT_MOD => GTMOD,
				 
				 GIO => GIO,
				 PHUT => PHUT,
				 GIAY => GIAY);
end Behavioral;

