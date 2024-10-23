----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:17:18 03/31/2023 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity chia_10ena is
    Port ( ckht : in  STD_LOGIC;
           ena20hz : out  STD_LOGIC;
           ena1khz : out  STD_LOGIC);
end chia_10ena;
architecture Behavioral of chia_10ena is
constant n:            integer :=50000000;
signal d20hz_r, d20hz_n :  integer range 0 to n/20:=1;
signal d1khz_r, d1khz_n :integer range 0 to n/1000:=1;
begin

     process(ckht)
	  begin
	       if falling_edge(ckht) then d20hz_r <= d20hz_n;
			                            d1khz_r <= d1khz_n;
			 end if;
	  end process;
	  --next state logic
	  d20hz_n <= 0 when d20hz_r = n else
	             d20hz_r +1;
	  d1khz_n <= 0 when d1khz_r = n/1000  else
	             d1khz_r +1;
	  --output logic
	  ena20hz <='1' when d20hz_r = n/(20*2) else
	          '0';
	  ena1khz <='1' when d1khz_r = n/(1000*2) else
	          '0';
end Behavioral;

