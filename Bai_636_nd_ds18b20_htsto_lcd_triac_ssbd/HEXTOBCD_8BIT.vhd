----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:34:59 02/17/2023 
-- Design Name: 
-- Module Name:    HEXTOBCD_8BIT - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HEXTOBCD_8BIT is
    Port ( sohex8bit : in  STD_LOGIC_VECTOR (7 downto 0);
           donvi : out  STD_LOGIC_VECTOR (3 downto 0);
           chuc : out  STD_LOGIC_VECTOR (3 downto 0);
           tram : out  STD_LOGIC_VECTOR (3 downto 0));
end HEXTOBCD_8BIT;

architecture Behavioral of HEXTOBCD_8BIT is

begin
	process(sohex8bit)
	 variable bcd_hex: std_logic_vector(19 downto 0);
	 variable dem: integer range 0 to 7;
	 begin
	     bcd_hex :="000000000000" & sohex8bit;
		  dem := 7;
		  
		  while dem > 0
		  loop
		      bcd_hex := bcd_hex(18 downto 0) & '0';
				dem := dem-1;
				if bcd_hex(11 downto 8) >="0101" then
					bcd_hex(11 downto 8) := bcd_hex(11 downto 8)+"0011";
				end if;
				if bcd_hex(15 downto 12) >="0101" then
				   bcd_hex(15 downto 12) := bcd_hex(15 downto 12)+"0011";
				end if;
		  end loop;
		  bcd_hex := bcd_hex(18 downto 0) & '0';
		  donvi <= bcd_hex(11 downto 8);
		  chuc  <= bcd_hex(15 downto 12);
		  tram <= bcd_hex(19 downto 16);
	  end process;
end Behavioral;

