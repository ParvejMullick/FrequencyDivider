----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:31:42 08/16/2023 
-- Design Name: 
-- Module Name:    FrequencyDivider - Behavioral 
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

entity FrequencyDivider is
    Port ( clk : in  STD_LOGIC;
           n : in  STD_LOGIC_VECTOR (3 downto 0);
           clr : in  STD_LOGIC;
           q2 : out  STD_LOGIC);
end FrequencyDivider;

architecture Behavioral of FrequencyDivider is
component FourBitCounter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
component comperator is
    Port ( in1 : in  STD_LOGIC_VECTOR (3 downto 0);
           in2 : in  STD_LOGIC_VECTOR (3 downto 0);
           op : out  STD_LOGIC);
end component;
component D_flipflop is
    Port ( D : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

signal a0, a1, out1:STD_LOGIC;
signal out2:STD_LOGIC_VECTOR (3 downto 0);
begin

a0 <= clr and (not out1);
 
cp1 : FourBitCounter port map (clk, a0, out2);
cp2 : comperator port map ( out2, n, a1);
cp3 : D_flipflop port map (a1, not clr,not clk, out1);

q2 <= out1;



end Behavioral;
