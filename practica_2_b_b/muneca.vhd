----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:51 10/23/2017 
-- Design Name: 
-- Module Name:    muneca - Behavioral 
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

entity muneca is
port (clk : in std_logic;
rst_n : in std_logic;
r : in std_logic;
c : in std_logic;
g : out std_logic;
l : out std_logic);
end muneca;


architecture Behavioral of muneca is
type t_state is (tranquila_st,habla_st,dormida_st,asustada_st);
signal current_state :t_state;
signal next_state:t_state;

begin

p_siguiente:process(current_state,r,c)
begin
case current_state is
	when tranquila_st=>
		if c='0' and r='1' then
			next_state<=habla_st;
		elsif c='1' and r='0' then
			next_state<=dormida_st;
		else
			next_state<= tranquila_st;
		end if;
		
	when habla_st=>
		if c='1' then
			next_state<=dormida_st;
		else
			next_state<=habla_St;
		end if;
		
	when dormida_st=>
		if r='1' then
			next_state<=asustada_st;
		else
			next_state<=dormida_st;
		end if;

	when asustada_st=>
		if c='0' and r='0' then
			next_state<=tranquila_st;
		elsif c='1' and r='0' then
			next_state<=dormida_st;
		else 
			next_state<=asustada_st;
		end if;
end case;
end process;

p_salida:process(current_state)
begin
case current_state is
	when tranquila_st=>
		g<='0';
		l<='0';
	when habla_st=>
		g<='1';
		l<='0';
	when dormida_st=>
		g<='0';
		l<='0';
	when asustada_st=>
		g<='1';
		l<='1';
end case;
end process;

p_registro:process(clk,rst_n)
begin
	if rst_n='0' then
		current_state<=tranquila_st;
	elsif rising_edge(clk) then
		current_state<=next_state;
	end if;
end process;
end Behavioral;

