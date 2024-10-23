----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:36:18 03/20/2023 
-- Design Name: 
-- Module Name:    dk_16led_4ct - Behavioral 
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

entity dk_16led_4ct is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (15 downto 0));
end dk_16led_4ct;

architecture Behavioral of dk_16led_4ct is
signal ena_db:std_logic;
signal rst :std_logic;
signal q_js_pst:std_logic_vector(15 downto 0);
signal q_js_tsp:std_logic_vector(15 downto 0);
signal q_js_tnv:std_logic_vector(15 downto 0);
signal q_js_ttr:std_logic_vector(15 downto 0);
signal oe :std_logic_vector(3 downto 0);
begin
    rst <= btn0;
IC1:entity work.chia_10ena
    port map( ckht =>ckht,
	           ena5hz => ena_db);
				  
IC2:entity work.js_pst
    port map( ckht =>ckht,
	           ena_db=> ena_db,
				  rst => rst,
				  oe  => oe(0),
				  q   => q_js_pst);
				  
IC3:entity work.js_tsp
    port map( ckht =>ckht,
	           ena_db=> ena_db,
				  rst => rst,
				  oe  => oe(1),
				  q   => q_js_tsp);

IC4:entity work.js_tnv
    port map( ckht =>ckht,
	           ena_db=> ena_db,
				  rst => rst,
				  oe  => oe(2),
				  q   => q_js_tnv);
				  
IC5:entity work.js_ttr
    port map( ckht =>ckht,
	           ena_db=> ena_db,
				  rst => rst,
				  oe  => oe(3),
				  q   => q_js_ttr);
				  
IC6:entity work.dieukhien_chophep
    port map(ckht =>ckht,
	          ena_db => ena_db,
				 rst => rst,
				 oe => oe);		  
led <= q_js_pst or q_js_tsp or q_js_tnv or q_js_ttr;
end Behavioral;

