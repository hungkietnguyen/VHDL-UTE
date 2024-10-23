----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:11 03/09/2023 
-- Design Name: 
-- Module Name:    HT_4TANSO - Behavioral 
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

entity HT_4TANSO is
    Port ( ENA_DB : OUT  STD_LOGIC;
           ENA1HZ, ENA5HZ, ENA10HZ, ENA20HZ : in  STD_LOGIC;
           DV_TS : out  STD_LOGIC_VECTOR (3 downto 0);
           CH_TS : out  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0));
end HT_4TANSO;

architecture Behavioral of HT_4TANSO is

begin
	PROCESS(ENA1HZ,ENA5HZ,ENA10HZ, ENA20HZ,S)
	BEGIN
	CASE S IS 
		WHEN "00" =>ENA_DB <= ENA1HZ;
									 CH_TS <=X"0";
									 DV_TS <= X"1";
		WHEN "01" =>ENA_DB <= ENA5HZ;
									 CH_TS <=X"0";
									 DV_TS <= X"5";
		WHEN "10" =>ENA_DB <= ENA10HZ;
									 CH_TS <=X"1";
									 DV_TS <= X"0";	
		WHEN OTHERS =>ENA_DB <= ENA20HZ;
									 CH_TS <=X"2";
									 DV_TS <= X"0";	
	END CASE;
END PROCESS;
end Behavioral;

