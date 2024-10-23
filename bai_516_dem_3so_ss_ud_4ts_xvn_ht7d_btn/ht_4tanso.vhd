----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:08:54 04/11/2023 
-- Design Name: 
-- Module Name:    ht_4tanso - Behavioral 
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

entity ht_4tanso is
    Port ( ena1hz : in  STD_LOGIC;
           ena5hz : in  STD_LOGIC;
           ena10hz : in  STD_LOGIC;
           ena20hz : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           dv_ts : out  STD_LOGIC_VECTOR (3 downto 0);
           ch_ts : out  STD_LOGIC_VECTOR (3 downto 0);
           ena_db : out  STD_LOGIC);
end ht_4tanso;

architecture Behavioral of ht_4tanso is
begin
   process(ena1hz, ena5hz, ena10hz, ena20hz, s)
	     begin
		       case s is
				      when "00" => ena_db <= ena1hz;
						             ch_ts  <= x"0";
										 dv_ts  <= x"1";
						when "01" => ena_db <= ena5hz;
						             ch_ts  <= x"0";
										 dv_ts  <= x"5";
						when "10" => ena_db <= ena10hz;
						             ch_ts  <= x"1";
										 dv_ts  <= x"0";
                  when others => ena_db <= ena20hz;
						             ch_ts  <= x"2";
										 dv_ts  <= x"0";
				 end case;
	end process;
end Behavioral;

