----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:36:08 03/14/2023 
-- Design Name: 
-- Module Name:    dk_16led_2ct_au_dv_pst_tsp - Behavioral 
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

entity dk_16led_2ct_au_dv_pst_tsp is
    Port ( ckht : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (15 downto 0));
end dk_16led_2ct_au_dv_pst_tsp;
architecture Behavioral of dk_16led_2ct_au_dv_pst_tsp is
signal ena_db:std_logic;
signal rst :std_logic;
signal q_dv_pst:std_logic_vector(15 downto 0);
signal q_dv_tsp:std_logic_vector(15 downto 0);
signal oe :std_logic_vector(1 downto 0);
begin
    rst <= btn0;
IC1:entity work.chia_10ena
    port map( ckht =>ckht,
	           ena5hz => ena_db);
				  
IC2:entity work.dv_pst
    port map( ckht =>ckht,
	           ena_db=> ena_db,
				  rst => rst,
				  oe  => oe(0),
				  q   => q_dv_pst);
				  
IC3:entity work.dv_tsp
    port map( ckht =>ckht,
	           ena_db=> ena_db,
				  rst => rst,
				  oe  => oe(1),
				  q   => q_dv_tsp);
				  
IC4:entity work.dieukhien_chophep
    port map(ckht =>ckht,
	          ena_db => ena_db,
				 rst => rst,
				 oe => oe);		  
led <= q_dv_pst or q_dv_tsp;
end Behavioral;
