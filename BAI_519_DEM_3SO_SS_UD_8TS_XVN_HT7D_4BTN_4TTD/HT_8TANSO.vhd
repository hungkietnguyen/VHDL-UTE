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

entity HT_8TANSO is
    Port ( ENA_DB : OUT  STD_LOGIC;
           ENA1HZ,ENA2HZ, ENA5HZ, ENA10HZ, ENA20HZ,ENA25HZ,ENA50HZ,ENA100HZ : in  STD_LOGIC;
           DV_TS : out  STD_LOGIC_VECTOR (3 downto 0);
           CH_TS : out  STD_LOGIC_VECTOR (3 downto 0);
			  TR_TS : out  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0));
end HT_8TANSO;

architecture Behavioral of HT_8TANSO is
SIGNAL TRCHDV: STD_LOGIC_VECTOR(11 DOWNTO 0);
begin
	PROCESS(ENA1HZ,ENA2HZ,ENA5HZ,ENA10HZ, ENA20HZ,ENA25HZ, ENA50HZ,ENA100HZ,S)
	BEGIN
	CASE S IS 
		WHEN "000" =>ENA_DB <= ENA1HZ;
									 TRCHDV <= X"001";
		WHEN "001" =>ENA_DB <= ENA2HZ;
									 TRCHDV <= X"002";	
		WHEN "010" =>ENA_DB <= ENA5HZ;
									 TRCHDV <= X"005";	
		WHEN "011" =>ENA_DB <= ENA10HZ;
									 TRCHDV <= X"010";	
		WHEN "100" =>ENA_DB <= ENA20HZ;
									 TRCHDV <= X"020";
		WHEN "101" =>ENA_DB <= ENA25HZ;
									 TRCHDV <= X"025";	
		WHEN "110" =>ENA_DB <= ENA50HZ;
									 TRCHDV <= X"050";							 
		WHEN OTHERS =>ENA_DB <= ENA100HZ;
									 TRCHDV <= X"100";		
	END CASE;
END PROCESS;
	DV_TS <= TRCHDV(3 DOWNTO 0);
	CH_TS <= TRCHDV(7 DOWNTO 4);
	TR_TS <= TRCHDV(11 DOWNTO 8);

end Behavioral;

