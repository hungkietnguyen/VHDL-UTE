----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:10:35 04/11/2023 
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
           ena1khz : out  STD_LOGIC;
           ena1hz : out  STD_LOGIC;
           ena5hz : out  STD_LOGIC;
           ena10hz : out  STD_LOGIC;
           ena20hz : out  STD_LOGIC);
end chia_10ena;
architecture Behavioral of chia_10ena is
constant n:            integer :=50000000;
signal d1hz_r, d1hz_n :  integer range 0 to n:=1;
signal d5hz_r, d5hz_n :  integer range 0 to n/5:=1; 
signal d10hz_r, d10hz_n :  integer range 0 to n/10:=1;
signal d20hz_r, d20hz_n :  integer range 0 to n/20:=1;
signal d1khz_r, d1khz_n :integer range 0 to n/1000:=1;
begin

     process(ckht)
	  begin
	       if falling_edge(ckht) then d1hz_r <= d1hz_n;
			                            d5hz_r  <= d5hz_n;
												 d10hz_r <= d10hz_n;
												 d20hz_r <= d20hz_n;
			                            d1khz_r <= d1khz_n;
												 
			 end if;
	  end process;
	  --next state logic
	  d1hz_n <= 0 when d1hz_r = n else
	             d1hz_r +1;
	  d5hz_n <= 0 when d5hz_r = n/5 else
	             d5hz_r +1;
	  d10hz_n <= 0 when d10hz_r = n/10 else
	             d10hz_r +1;				 
	  d20hz_n <= 0 when d20hz_r = n/20 else
	             d20hz_r +1;
	  d1khz_n <= 0 when d1khz_r = n/1000  else
	             d1khz_r +1;
	  --output logic
	  ena1hz <='1' when d1hz_r = n/2 else
	          '0';
	  ena5hz <='1' when d5hz_r = n/(5*2) else
	          '0';
	  ena10hz <='1' when d10hz_r = n/(10*2) else
	          '0';
	  ena20hz <='1' when d20hz_r = n/(20*2) else
	          '0';
	  ena1khz <='1' when d1khz_r = n/(1000*2) else
	          '0';
end Behavioral;

