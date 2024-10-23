----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:49:15 02/16/2023 
-- Design Name: 
-- Module Name:    chia_10ck - Behavioral 
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

entity chia_10ck is
    Port ( ckht : in  STD_LOGIC;
           ck1hz : out  STD_LOGIC;
           ck2hz : out  STD_LOGIC;
           ck5hz : out  STD_LOGIC;
           ck10hz : out  STD_LOGIC;
           ck20hz : out  STD_LOGIC;
           ck25hz : out  STD_LOGIC;
           ck50hz : out  STD_LOGIC;
           ck100hz : out  STD_LOGIC;
           ck1khz : out  STD_LOGIC;
           ck1mhz : out  STD_LOGIC);
end chia_10ck;
architecture Behavioral of chia_10ck is
constant n:  integer :=50000000;
signal d1mhz_r, d1mhz_n :integer range 0 to n:=1000000;
signal d1khz_r, d1khz_n :integer range 0 to n/1000:=1;
signal d100hz_r, d100hz_n :integer range 0 to n/100:=1;
signal d50hz_r, d50hz_n :integer range 0 to n/50:=1;
signal d25hz_r, d25hz_n :integer range 0 to n/25:=1;
signal d20hz_r, d20hz_n :integer range 0 to n/20:=1;
signal d10hz_r, d10hz_n :integer range 0 to n/10:=1;
signal d5hz_r, d5hz_n :integer range 0 to n/5:=1;
signal d2hz_r, d2hz_n :integer range 0 to n/2:=1;
signal d1hz_r, d1hz_n :integer range 0 to n:=1;
begin
     process(ckht)
	  begin
	       if falling_edge(ckht) then d1mhz_r <= d1mhz_n;
			                            d1khz_r <= d1khz_n;
												 d100hz_r <= d100hz_n;
												 d50hz_r <= d50hz_n;
												 d25hz_r <= d25hz_n;
												 d20hz_r <= d20hz_n;
												 d10hz_r <= d10hz_n;
												 d5hz_r <= d5hz_n;
												 d2hz_r <= d2hz_n;
												 d1hz_r <= d1hz_n;
			 end if;
	  end process;
	  --next state logic
	  d1mhz_n <= 0 when d1mhz_r = n/1000000-1 else
	             d1mhz_r +1;
	  d1khz_n <= 0 when d1khz_r = n/1000 -1 else
	             d1khz_r +1;
	  d100hz_n <= 0 when d100hz_r = n/100 -1 else
	             d100hz_r +1;
     d50hz_n <= 0 when d50hz_r = n/50 -1 else
	             d50hz_r +1;
	  d25hz_n <= 0 when d25hz_r = n/25 -1 else
	             d25hz_r +1;
	  d20hz_n <= 0 when d20hz_r = n/20 -1 else
	             d20hz_r +1;
	  d10hz_n <= 0 when d10hz_r = n/10 -1 else
	             d10hz_r +1;
	  d5hz_n <= 0 when d5hz_r = n/5 -1 else
	             d5hz_r +1;
	  d2hz_n <= 0 when d2hz_r = n/2 -1 else
	             d2hz_r +1;
	  d1hz_n <= 0 when d1hz_r = n/1 -1 else
	             d1hz_r +1;

	  --output logic
	  ck1hz <='1' when d1hz_r < n/(1*2) else
	          '0';
	  ck2hz <='1' when d2hz_r < n/(2*2) else
	          '0';
	  ck5hz <='1' when d5hz_r < n/(5*2) else
	          '0';
	  ck10hz <='1' when d10hz_r < n/(10*2) else
	          '0';
	  ck20hz <='1' when d20hz_r < n/(20*2) else
	          '0';
	  ck25hz <='1' when d25hz_r < n/(25*2) else
	          '0';
	  ck50hz <='1' when d50hz_r < n/(50*2) else
	          '0';
	  ck100hz <='1' when d100hz_r < n/(100*2) else
	          '0';
	  ck1khz <='1' when d1khz_r < n/(1000*2) else
	          '0';
	  ck1mhz <='1' when d1mhz_r < n/(1000000*2) else
	          '0';

end Behavioral;

