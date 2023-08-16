----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:28:07 08/16/2023 
-- Design Name: 
-- Module Name:    FourBitCounter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourBitCounter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end FourBitCounter;

architecture Behavioral of FourBitCounter is
signal count : std_logic_vector(3 downto 0);
begin

process(clk, rst)
begin

if(rst = '0') then
 count <= "0000";
elsif(rising_edge(clk)) then
 count <= count + "0001";
end if;
end process;

q <= count;
end Behavioral;
