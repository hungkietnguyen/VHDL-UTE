----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:28:36 03/09/2023 
-- Design Name: 
-- Module Name:    XOA_SO_0_VN - Behavioral 
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

entity XOA_SO_0_VN is
    Port ( TRAM : in  STD_LOGIC_VECTOR (3 downto 0);
           CHUC : in  STD_LOGIC_VECTOR (3 downto 0);
           ENA2B : out  STD_LOGIC_VECTOR (1 downto 0));
end XOA_SO_0_VN;

architecture Behavioral of XOA_SO_0_VN is

begin
	ENA2B <= "00" WHEN TRAM =X"0" AND CHUC =X"0" ELSE
				"01" WHEN TRAM =X"0"  ELSE
				"11";
end Behavioral;

