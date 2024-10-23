----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:12:51 02/11/2023 
-- Design Name: 
-- Module Name:    dahop_4kenh_2bit_con - Behavioral 
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

entity dahop_4kenh_2bit_con is
    Port ( sw : in  STD_LOGIC_VECTOR (9 downto 0);
           led : out  STD_LOGIC_VECTOR (1 downto 0));
end dahop_4kenh_2bit_con;
architecture Behavioral of dahop_4kenh_2bit_con is
begin
IC1: entity work.dahop_4kenh_2bit
       port map( ia=>sw(1 downto 0),
		                  ib=>sw(3 downto 2),
								ic=>sw(5 downto 4),
								id=>sw(7 downto 6),
								o=> led(1 downto 0),
								s=>sw(9 downto 8));
end Behavioral;

