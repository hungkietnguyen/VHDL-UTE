----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:53:35 02/28/2023 
-- Design Name: 
-- Module Name:    dem_4bit_btn - Behavioral 
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

entity dem_4bit_btn is
    Port ( ckht : in  STD_LOGIC;
           btn : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end dem_4bit_btn;
architecture Behavioral of dem_4bit_btn is
signal xcd, xcdlh: std_logic;
begin
IC1: entity work.debounce_btn
     port map( btn =>btn,
	            ckht =>ckht,
					db_stick => xcd);
IC2: entity work.lam_hep_xung
     port map( d =>xcd,
	            ckht =>ckht,
					q =>xcdlh);
IC3: entity work.dem_4bit
     port map(ena_db => xcdlh,
	           ckht =>ckht,
				  rst => rst,
				  q=>q);
end Behavioral;




