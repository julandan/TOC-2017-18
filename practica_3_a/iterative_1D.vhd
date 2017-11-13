----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:58 11/13/2017 
-- Design Name: 
-- Module Name:    iterative_1D - Behavioral 
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


entity iterative_1D is
	generic (	g_width_data : natural := 32;
				g_width_count : natural := 5);
	port ( 	din : in std_logic_vector(g_width_data -1 downto 0);
			count_inicial:in unsigned(g_width_count -1 downto 0);
			num_patterns : out unsigned(g_width_count -1 downto 0)
			);
end iterative_1D;

architecture Behavioral of iterative_1D is
type t_pattern_vector is array (g_width_data downto 0) of t_pattern;
type t_count_vector is array (g_width_data downto 0) of unsigned(g_width_count -1 downto 0);
signal count : t_count_vector;
signal pattern : t_pattern_vector;

component cell is
	generic ( g_width : natural := 32);
	port (din : in std_logic;
		pattern_in : in t_pattern;
		count_in : in unsigned(g_width -1 downto 0);
		pattern_out : out t_pattern;
		count_out : out unsigned(g_width -1 downto 0)
		);
end component;
begin
count(0)<=count_inicial;
cell_generation : for idx in 0 to g_width_data-1 generate
	i_cell : cell
		generic map ( g_width => g_width_count)
		port map ( 	din => din(idx),
					pattern_in => pattern(idx),
					count_in => count(idx),
					pattern_out => pattern(idx+1),
					count_out => count(idx+1)
					);
end generate cell_generation;

num_patterns<=count(g_width_data);
end Behavioral;

