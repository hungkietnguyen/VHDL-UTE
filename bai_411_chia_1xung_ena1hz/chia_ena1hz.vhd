----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:42:31 02/20/2023 
-- Design Name: 
-- Module Name:    chia_ena1hz - Behavioral 
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

entity chia_ena1hz is
    Port ( ckht : in  STD_LOGIC;
           ena1hz : out  STD_LOGIC);
end chia_ena1hz;

architecture Behavioral of chia_ena1hz is
constant n:  integer :=50000000;
signal d1hz_r :integer range 0 to n:=1;
signal d1hz_n :integer range 0 to n:=1;
begin
     process(ckht)
	  begin
	       if falling_edge(ckht) then d1hz_r <= d1hz_n;
			 end if;
	  end process;
	  --next state logic
	  d1hz_n <= 0 when d1hz_r = n else
	             d1hz_r +1;
	  ena1hz <= '1' when d1hz_r = n/2 else '0';
				 
end Behavioral;

