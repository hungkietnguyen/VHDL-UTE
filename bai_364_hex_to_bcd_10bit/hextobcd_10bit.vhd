----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:44:30 02/16/2023 
-- Design Name: 
-- Module Name:    hextobcd_10bit - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hextobcd_10bit is
    Port ( sohex10bit : in  STD_LOGIC_VECTOR (9 downto 0);
           donvi : out  STD_LOGIC_VECTOR (3 downto 0);
           chuc : out  STD_LOGIC_VECTOR (3 downto 0);
           tram : out  STD_LOGIC_VECTOR (3 downto 0);
           nghin : out  STD_LOGIC_VECTOR (3 downto 0));
end hextobcd_10bit;
architecture Behavioral of hextobcd_10bit is
begin
    process(sohex10bit)
	 variable bcd_hex: std_logic_vector(25 downto 0);
	 variable dem: integer range 0 to 9;
	  begin
	     bcd_hex :="0000000000000000" &sohex10bit;
		  dem := 9;
		  
		  while dem > 0
		  loop
		      bcd_hex := bcd_hex(24 downto 0) & '0';
				dem := dem-1;
				if bcd_hex(13 downto 10) >="0101" then
				   bcd_hex(13 downto 10) := bcd_hex(13 downto 10)+"0011";
				end if;
				if bcd_hex(17 downto 14) >="0101" then
				   bcd_hex(17 downto 14) := bcd_hex(17downto 14)+"0011";
				end if; 
            if bcd_hex(21 downto 18) >="0101" then
				   bcd_hex(21 downto 18) := bcd_hex(21 downto 18)+"0011";
				end if;				
		  end loop;
		  bcd_hex := bcd_hex(24 downto 0) & '0';
		  donvi <= bcd_hex(13 downto 10);
		  chuc  <= bcd_hex(17 downto 14);
		  tram  <= bcd_hex(21 downto 18);
		  nghin <= bcd_hex(25 downto 22);
	  end process;
end Behavioral;

