----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:59:44 04/07/2023 
-- Design Name: 
-- Module Name:    dahop_8kenh - Behavioral 
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

entity dahop_8kenh is
    Port ( i0 : in  STD_LOGIC_VECTOR (3 downto 0);
           i1 : in  STD_LOGIC_VECTOR (3 downto 0);
           i2 : in  STD_LOGIC_VECTOR (3 downto 0);
           i3 : in  STD_LOGIC_VECTOR (3 downto 0);
           i4 : in  STD_LOGIC_VECTOR (3 downto 0);
           i5 : in  STD_LOGIC_VECTOR (3 downto 0);
           i6 : in  STD_LOGIC_VECTOR (3 downto 0);
           i7 : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC_VECTOR (2 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0));
end dahop_8kenh;

architecture Behavioral of dahop_8kenh is
begin
	process ( s,i0, i1, i2, i3, i4, i5, i6, i7)
	begin
		case s is
			when "000"		=> o <= i0;
			when "001"		=> o <= i1;
			when "010"		=> o <= i2;
			when "011"		=> o <= i3;
			when "100"		=> o <= i4;
			when "101"		=> o <= i5;
			when "110"		=> o <= i6;
			when others		=> o <= i7;
		end case;
	end process;
end Behavioral;

