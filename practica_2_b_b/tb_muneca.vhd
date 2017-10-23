--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:05:47 10/23/2017
-- Design Name:   
-- Module Name:   C:/A_REPOSITORIO/docencia/TOC 2017-18/practica_2_b/tb_muneca.vhd
-- Project Name:  practica_2_b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: muneca
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_muneca IS
END tb_muneca;
 
ARCHITECTURE behavior OF tb_muneca IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muneca
    PORT(
         clk : IN  std_logic;
         rst_n : IN  std_logic;
         r : IN  std_logic;
         c : IN  std_logic;
         g : OUT  std_logic;
         l : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst_n : std_logic := '0';
   signal r : std_logic := '0';
   signal c : std_logic := '0';

 	--Outputs
   signal g : std_logic;
   signal l : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muneca PORT MAP (
          clk => clk,
          rst_n => rst_n,
          r => r,
          c => c,
          g => g,
          l => l
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
