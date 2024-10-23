----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:29:11 02/16/2023 
-- Design Name: 
-- Module Name:    binary_gray_4bit - Behavioral 
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

entity binary_gray_4bit is
    Port ( binary : in  STD_LOGIC_VECTOR (3 downto 0);
           gray : out  STD_LOGIC_VECTOR (3 downto 0));
end binary_gray_4bit;
architecture Behavioral of binary_gray_4bit is
begin
   gray<= binary xor ('0' & binary(3 downto 1));


end Behavioral;

