----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:38:50 09/26/2016 
-- Design Name: 
-- Module Name:    sumador - Behavioral 
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

entity sumador is
port (
	op1:in std_logic_vector(3 downto 0);
	op2:in std_logic_vector(3 downto 0);
	res:out std_logic_vector (3 downto 0)
);
end sumador;

architecture rtl of sumador is

begin

res<= std_logic_vector(signed(op1)+signed(op2));
end rtl;

