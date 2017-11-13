----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:52 11/13/2017 
-- Design Name: 
-- Module Name:    cell - Behavioral 
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
use work.definitions.all;



entity cell is
	generic ( g_width : natural := 32);
	port (din : in std_logic;
		pattern_in : in t_pattern;
		count_in : in unsigned(g_width -1 downto 0);
		pattern_out : out t_pattern;
		count_out : out unsigned(g_width -1 downto 0)
		);
end cell;

use work.definitions.all;
architecture Behavioral of cell is

signal pattern_cell: t_pattern;
begin

	p_pattern : process (pattern_in , din) is
	begin
	case pattern_in is
		when no_pattern =>
			if din='0' then 
				pattern_cell <= no_pattern;
			else 
				pattern_cell <= first_one;
			end if;
		when first_one =>
			if din='0' then 
				pattern_cell <= second_zero;
			else 
				pattern_cell <= second_one;
			end if;
		when second_one=>
			if din='0' then 
				pattern_cell <= second_zero;
			else 
				pattern_cell <= pattern_rec;
			end if;
		when second_zero=>
			if din='0' then 
				pattern_cell <= no_pattern;
			else 
				pattern_cell <= pattern_rec;
			end if;
		when pattern_rec=>
			if din='0' then
				pattern_cell <= no_pattern;
			else 
				pattern_cell <= first_one;
			end if;
	end case;
	end process p_pattern;


	p_count: process (count_in, pattern_cell) is
	begin
		if pattern_cell = pattern_rec then
			count_out <= count_in + 1;
		else
			count_out<=count_in;
		end if;
	end process p_count;
	
	pattern_out <= pattern_cell;

	end Behavioral;

