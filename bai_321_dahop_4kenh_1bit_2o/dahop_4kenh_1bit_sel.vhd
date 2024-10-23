----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:58:10 02/11/2023 
-- Design Name: 
-- Module Name:    dahop_4kenh_1bit_sel - Behavioral 
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

entity dahop_4kenh_1bit_sel is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0));
end dahop_4kenh_1bit_sel;
architecture Behavioral of dahop_4kenh_1bit_sel is
begin
   with s select
	        o<= i(0) when "00",
			          i(1) when "01",
						 i(2) when "10",
						 i(3) when others;
end Behavioral;

