----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:15:25 02/14/2023 
-- Design Name: 
-- Module Name:    hextobcd_4bit - Behavioral 
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

entity hextobcd_4bit is
    Port ( sohex4bit : in  STD_LOGIC_VECTOR (3 downto 0);
           donvi : out  STD_LOGIC_VECTOR (3 downto 0);
           chuc : out  STD_LOGIC_VECTOR (3 downto 0));
end hextobcd_4bit;
architecture Behavioral of hextobcd_4bit is
begin
    process(sohex4bit)
    variable bcd_hex: std_logic_vector(11 downto 0);
    variable dem: integer range 0 to 3;
    begin
         bcd_hex :="00000000" &sohex4bit;
	      dem:=3;
	 
	      while dem >0
	      loop
	          bcd_hex:= bcd_hex(10 downto 0)&'0';
		       dem:=dem-1;
		       if bcd_hex(7 downto 4)>="0101" then
		           bcd_hex(7 downto 4):=bcd_hex(7 downto 4)+"0011";
		       end if;
	       end loop;
	       bcd_hex:=bcd_hex(10 downto 0) &'0';
	       donvi<=bcd_hex(7 downto 4);
	       chuc<=bcd_hex(11 downto 8);
	 end process;     
end Behavioral;

