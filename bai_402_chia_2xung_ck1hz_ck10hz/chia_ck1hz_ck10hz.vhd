----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:30:23 02/16/2023 
-- Design Name: 
-- Module Name:    chia_ck1hz_ck10hz - Behavioral 
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

entity chia_ck1hz_ck10hz is
    Port ( ckht : in  STD_LOGIC;
           ck1hz : out  STD_LOGIC;
           ck10hz : out  STD_LOGIC);
end chia_ck1hz_ck10hz;
architecture Behavioral of chia_ck1hz_ck10hz is
constant n:  integer :=50000000;
signal d1hz_r, d1hz_n :integer range 0 to n:=1;
signal d10hz_r, d10hz_n :integer range 0 to n/10:=1;
begin
     process(ckht)
	  begin
	       if falling_edge(ckht) then d10hz_r <= d10hz_n;
			                            d1hz_r <= d1hz_n;
			 end if;
	  end process;
	  --next state logic
	  d1hz_n <= 0 when d1hz_r = n-1 else
	             d1hz_r +1;
	  d10hz_n <= 0 when d10hz_r = n/10 -1 else
	             d10hz_r +1;
	  --output logic
	  ck1hz <='1' when d1hz_r < n/2 else
	          '0';
	  ck10hz <='1' when d1hz_r < n/20 else
	          '0';
end Behavioral;

