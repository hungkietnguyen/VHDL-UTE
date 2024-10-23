----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:37:10 03/13/2023 
-- Design Name: 
-- Module Name:    dk_16led_std_tsp - Behavioral 
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

entity dk_16led_std_tsp is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           sw0 : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (15 downto 0));
end dk_16led_std_tsp;
architecture Behavioral of dk_16led_std_tsp is
signal ena_db :std_logic;
signal rst :std_logic;
signal q_js_tsp :std_logic_vector( 15 downto 0);
begin
rst <= btn0;
led <= q_js_tsp;

IC1:entity work.chia_10ena
    port map( ckht =>ckht,
	           ena5hz => ena_db);
				  
IC2:entity work.js_tsp
    port map( ckht =>ckht,
	           ena_db=> ena_db,
				  rst => rst,
				  oe  => sw0,
				  q   => q_js_tsp);
end Behavioral;

