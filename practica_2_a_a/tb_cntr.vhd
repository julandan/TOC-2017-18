----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:13:48 10/23/2017 
-- Design Name: 
-- Module Name:    tb_cntr - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_cntr is
  generic (k : integer := 4;            -- Module value
           n : integer := 2);           -- Counter width
end tb_cntr;

architecture Behavioral of tb_cntr is
--declaración de señales
signal clk :std_logic;
signal rst:std_logic;
signal cu: std_logic;
signal cuenta :std_logic_vector (n-1 downto 0);

--declaración de componentes
component cntr 
  generic (k : integer := 4;            -- Module value
           n : integer := 2);           -- Counter width
  port (rst  : in  std_logic;           -- Asynch reset
        clk  : in  std_logic;           -- Input clock
		cu	:in std_logic;
        cuenta : out std_logic_vector(n-1 downto 0));
end component;

begin--comienza el cuerpo de la arquietectura

dut: cntr port map (
	rst=>rst,
	clk=>clk,
	cu=>cu,
	cuenta=>cuenta
	);


p_clk:process
begin
	clk<='0';
	wait for 5 ns;
	clk<='1';
	wait for 5 ns;
end process;

p_rst:process
begin
rst<='0';
wait for 100 ns;
rst<='1';
wait for 100 ns;
rst<='0';
wait;
end process;

p_cu:process
begin
cu<='0';
wait for 200ns;
cu<='1';
wait for 200 ns;
end process;



end Behavioral;

