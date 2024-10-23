----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:43:38 04/08/2023 
-- Design Name: 
-- Module Name:    DKHIEN_BELL - Behavioral 
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

entity DKHIEN_BELL is
    Port ( CKHT, RST : in  STD_LOGIC;
           SW : in  STD_LOGIC;
           ENA5HZ : in  STD_LOGIC;
           XK_BELL : in  STD_LOGIC;
           NDO_NG : in  STD_LOGIC_VECTOR (7 downto 0);
           NDO_SS : in  STD_LOGIC_VECTOR (7 downto 0);
           BELL : out  STD_LOGIC);
end DKHIEN_BELL;

architecture Behavioral of DKHIEN_BELL is
SIGNAL BELL_1, BELL_2 : STD_LOGIC;
begin
	BELL_2 <= '1' WHEN NDO_NG > NDO_SS AND SW='1' ELSE '0';
	BELL <= BELL_1 OR BELL_2;

U0: ENTITY WORK.BELL_BIP
	PORT MAP( CKHT => CKHT,
				 RST => RST,
				 TG_BIP => ENA5HZ,
				 XK_BELL => XK_BELL,
				 BELL    => BELL_1);
end Behavioral;

