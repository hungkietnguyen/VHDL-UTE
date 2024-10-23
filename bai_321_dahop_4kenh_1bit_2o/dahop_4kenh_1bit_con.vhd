----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:57:12 02/11/2023 
-- Design Name: 
-- Module Name:    dahop_4kenh_1bit_con - Behavioral 
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

entity dahop_4kenh_1bit_con is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0));
end dahop_4kenh_1bit_con;
architecture Behavioral of dahop_4kenh_1bit_con is
begin
      o <= i(0) when s="00" else
               i(1) when s="01" else
			      i(2) when s="10" else
			      i(3) ;

end Behavioral;

