--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:23 11/13/2017
-- Design Name:   
-- Module Name:   C:/A_REPOSITORIO/docencia/TOC-2017-18.git/practica_3_a/tb_iterative_1D.vhd
-- Project Name:  practica_3_a
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: iterative_1D
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_iterative_1D IS
	generic (	g_width_data : natural := 32;
				g_width_count : natural := 5);
END tb_iterative_1D;
 
ARCHITECTURE behavior OF tb_iterative_1D IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT iterative_1D
	generic (	g_width_data : natural := 32;
				g_width_count : natural := 5);
    PORT(
         din : IN  std_logic_vector(31 downto 0);
		 count_inicial:in unsigned(g_width_count -1 downto 0);
         num_patterns : OUT  unsigned(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal din : std_logic_vector(31 downto 0) := (others => '0');
   signal count_inicial : unsigned(g_width_count -1 downto 0);

 	--Outputs
   signal num_patterns : unsigned(4 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: iterative_1D 
		generic map(	g_width_data => 32,
						g_width_count => 5)
		PORT MAP (
						din => din,
						count_inicial=>count_inicial,
						num_patterns => num_patterns
				);



 

   -- Stimulus process
   stim_proc: process
   begin		
	din<="00000000000000000000000000000101";
	count_inicial<=(others=>'0');
	wait for 100 ns;	
	count_inicial<=(others=>'0');
din<="00000000000000000000000000111101";
	wait for 100 ns;
		count_inicial<=(others=>'0');
din<="00000000000000000000000111111101";
		wait for 100 ns;
		count_inicial<=(others=>'0');
din<="00000000000000000000111111111101";
			wait for 100 ns;
		count_inicial<=(others=>'0');
din<="00000000000000000111111111111101";

			wait for 100 ns;
		count_inicial<=(others=>'0');
din<="00000000000000000111111111111101";
				wait for 100 ns;
		count_inicial<=(others=>'0');
din<="00000000000000111111111111111101";
    wait;
   end process;

END;
