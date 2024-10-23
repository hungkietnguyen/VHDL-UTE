----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:34:54 03/14/2023 
-- Design Name: 
-- Module Name:    chia_10ena - Behavioral 
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

entity chia_10ena is
    Port ( ckht : in  STD_LOGIC;
           ena5hz : out  STD_LOGIC);
end chia_10ena;
architecture Behavioral of chia_10ena is
constant n:  integer :=50000000;
signal d5hz_r :integer range 0 to n/5:=1;
signal d5hz_n :integer range 0 to n/5:=1;
begin
     process(ckht)
	  begin
	       if falling_edge(ckht) then d5hz_r <= d5hz_n;
			 end if;
	  end process;
	  --next state logic
	  d5hz_n <= 0 when d5hz_r = n else
	             d5hz_r +1;
	  --output logic
	  ena5hz <='1' when d5hz_r = n/(5*2) else
	          '0';
end Behavioral;

