----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:00:22 03/25/2023 
-- Design Name: 
-- Module Name:    HEXTOBCD_GPG - Behavioral 
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

entity HEXTOBCD_GPG is
    Port ( GIO : in  STD_LOGIC_VECTOR (5 downto 0);
           PHUT : in  STD_LOGIC_VECTOR (5 downto 0);
           GIAY  : in  STD_LOGIC_VECTOR (5 downto 0);
           CH_GIO, CH_PHUT, CH_GIAY : out  STD_LOGIC_VECTOR (3 downto 0);
           DV_GIO, DV_PHUT, DV_GIAY : out  STD_LOGIC_VECTOR (3 downto 0));
end HEXTOBCD_GPG;

architecture Behavioral of HEXTOBCD_GPG is

begin
K1: ENTITY WORK.HEXTOBCD_6BIT
	PORT MAP( SOHEX6BIT => GIO,
				 DONVI => DV_GIO,
				 CHUC  => CH_GIO);
				 
K2: ENTITY WORK.HEXTOBCD_6BIT
	PORT MAP( SOHEX6BIT => PHUT,
				 DONVI => DV_PHUT,
				 CHUC  => CH_PHUT);
				 
K3: ENTITY WORK.HEXTOBCD_6BIT
	PORT MAP( SOHEX6BIT => GIAY,
				 DONVI => DV_GIAY,
				 CHUC  => CH_GIAY);				 
end Behavioral;

