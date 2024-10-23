----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:04:12 03/27/2023 
-- Design Name: 
-- Module Name:    DAU_CHAM - Behavioral 
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

entity DAU_CHAM is
    Port ( GT_MOD_T : in  STD_LOGIC_VECTOR (1 downto 0);
           DC_8LED : out  STD_LOGIC_VECTOR (7 downto 0));
end DAU_CHAM;

architecture Behavioral of DAU_CHAM is

begin
	PROCESS(GT_MOD_T)
	BEGIN
		CASE GT_MOD_T IS
			WHEN "01" => DC_8LED <= X"01";
			WHEN "10" => DC_8LED <= X"08";
			WHEN "11" => DC_8LED <= X"40";
			WHEN OTHERS => DC_8LED <= X"00";
		END CASE;
	END PROCESS;
end Behavioral;

