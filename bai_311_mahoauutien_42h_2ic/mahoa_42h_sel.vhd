----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:44 02/08/2023 
-- Design Name: 
-- Module Name:    mahoa_42h_sel - Behavioral 
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

entity mahoa_42h_sel is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (1 downto 0);
           act : out  STD_LOGIC);
end mahoa_42h_sel;
architecture Behavioral of mahoa_42h_sel is
begin
    with i select
	  o<="11" when "1111"|"1110"|"1101"|"1100"|"1011"|"1010"|"1001"|"1000",
	         "10" when "0111"|"0110"|"0101"|"0100",
				"01" when "0011"|"0010",
				"00" when others;
	 act<=i(3) or i(2) or i(1) or i(0);
	 
end Behavioral;

