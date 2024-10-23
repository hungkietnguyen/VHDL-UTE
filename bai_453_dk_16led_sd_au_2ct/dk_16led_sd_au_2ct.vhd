----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:06:07 03/21/2023 
-- Design Name: 
-- Module Name:    dk_16led_sd_au_2ct - Behavioral 
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

entity dk_16led_sd_au_2ct is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (15 downto 0));
end dk_16led_sd_au_2ct;
architecture Behavioral of dk_16led_sd_au_2ct is
signal ena_db: std_logic;
signal rst :std_logic;
signal q_sd_pst : std_logic_vector(15 downto 0);
signal q_sd_tsp : std_logic_vector(15 downto 0);
signal oe :std_logic_vector(1 downto 0);
begin
  rst <= btn0;
  led <= q_sd_pst or q_sd_tsp;
IC1: entity work.chia_10ena
     port map( ckht => ckht,
	            ena5hz =>ena_db);
IC2: entity work.sd_pst
	     port map( ena_db => ena_db,
		            ckht => ckht,
						rst => rst,
						oe =>oe(0),
						q => q_sd_pst);
IC3: entity work.sd_tsp
	     port map( ena_db => ena_db,
		            ckht => ckht,
						rst => rst,
						oe =>oe(1),
						q => q_sd_tsp);
IC4: entity work.dieukhien_chophep
     port map(ckht =>ckht,
	           rst => rst,
				  oe => oe,
				  ena_db =>ena_db);
end Behavioral;

