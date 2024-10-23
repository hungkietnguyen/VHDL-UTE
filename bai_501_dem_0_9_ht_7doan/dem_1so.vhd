----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:52:46 03/27/2023 
-- Design Name: 
-- Module Name:    dem_1so - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_1so is
    Port ( ckht : in  STD_LOGIC;
           ena_db : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena_ss : in  STD_LOGIC;
           donvi : out  STD_LOGIC_VECTOR (3 downto 0));
end dem_1so;
architecture Behavioral of dem_1so is
signal donvi_r, donvi_n :std_logic_vector(3 downto 0);
signal ena : std_logic;
begin
--register
     process(ckht,rst)
	     begin
	       if (rst='1') then donvi_r <= (others =>'0');
			 elsif falling_edge(ckht) then donvi_r <= donvi_n;
			 end if;
	  end process;
-- next state logic
	  ena <= ena_db and ena_ss;
	  donvi_n <= x"0" when donvi_r = x"a" and ena_ss='1' else
	             donvi_r + 1 when ena='1' else
	             donvi_r;
-- output logic
     donvi <= donvi_r;	  
end Behavioral;


