----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:28:01 02/28/2023 
-- Design Name: 
-- Module Name:    lam_dep_xung - Behavioral 
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

entity lam_dep_xung is
    Port ( ckht : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end lam_dep_xung;
architecture Behavioral of lam_dep_xung is
signal qff:std_logic;
begin
   process(ckht)
	begin
	    if falling_edge (ckht) then qff <= d;
		 end if;
	end process;
	 q<=(not qff) and d;
   
end Behavioral;

