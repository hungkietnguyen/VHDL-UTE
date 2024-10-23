----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:32:46 02/28/2023 
-- Design Name: 
-- Module Name:    cd_lam_hep_btn - Behavioral 
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

entity cd_lam_hep_btn is
    Port ( ckht : in  STD_LOGIC;
           btn : in  STD_LOGIC;
           xcdlh : out  STD_LOGIC);
end cd_lam_hep_btn;

architecture Behavioral of cd_lam_hep_btn is
signal xcd: std_logic;
begin
U1: entity work.debounce_btn
	port map( ckht => ckht,
							btn => btn,
							db_tick => xcd);
U2: entity work.lam_hep_xung
	port map( ckht => ckht,
							d => xcd,
			            q => xcdlh);

end Behavioral;

