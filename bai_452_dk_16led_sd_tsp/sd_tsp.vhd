----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:54:59 03/21/2023 
-- Design Name: 
-- Module Name:    sd_tsp - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sd_tsp is
    Port ( ckht : in  STD_LOGIC;
           ena_db : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           oe : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (15 downto 0));
end sd_tsp;

architecture Behavioral of sd_tsp is
signal z_r, z_n: std_logic_vector(15 downto 0);
signal v_r, v_n: std_logic_vector(15 downto 0);
signal k_r, k_n:integer range 0 to 15 :=15;
signal n_r, n_n:integer range 0 to 15 :=15;
begin
     process(ckht, rst)
	  begin 
	     if rst ='1' then z_r <= (others =>'0');
		                   v_r <= (others =>'0');
								 k_r <= 15;
								 n_r <= 0;
		  elsif falling_edge(ckht) then z_r <= z_n;
		                                v_r <= v_n;
								              k_r <= k_n;
								              n_r <= n_n;
		  end if;
	  end process;

     process(z_r, v_r, k_r, n_r, ena_db, oe)
	  begin
	     z_n <= z_r;
		  v_n <= v_r;
	     k_n <= k_r;
		  n_n <= n_r;
		  
		    if oe='0' then z_n <=(others =>'0');
			                v_n <=(others =>'0');
								 k_n <=15;
								 n_n <=0;
			 elsif ena_db = '1' then
			    if v_r =x"0000" then v_n <=x"8000";
				 elsif n_r < k_r then v_n <= '0' & v_r(15 downto 1); 
				                      n_n <= n_r +1;
				 elsif k_r > 0 then z_n <= z_r or v_r;
				                    v_n <= x"8000";
										  k_n <= k_r - 1;
										  n_n <=0;
				 else        z_n <=(others =>'0');
			                v_n <=(others =>'0');
								 k_n <=15;
								 n_n <=0;
				 end if;
            end if;
       end process;
       q <= z_r or v_r when oe='1' else (others =>'0');		       
end Behavioral;

