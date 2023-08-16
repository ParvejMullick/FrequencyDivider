--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:35:09 08/16/2023
-- Design Name:   
-- Module Name:   D:/Mini Project/FrequencyDivider/testDivider.vhd
-- Project Name:  FrequencyDivider
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FrequencyDivider
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
 
ENTITY testDivider IS
END testDivider;
 
ARCHITECTURE behavior OF testDivider IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FrequencyDivider
    PORT(
         clk : IN  std_logic;
         n : IN  std_logic_vector(3 downto 0);
         clr : IN  std_logic;
         q2 : OUT  std_logic
        );
    END COMPONENT;
    

  --Inputs
   signal clk : std_logic := '0';
   signal n : std_logic_vector(3 downto 0) := (others => '0');
   signal clr : std_logic := '0';

 	--Outputs
   signal q2 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FrequencyDivider PORT MAP (
          clk => clk,
          n => n,
          clr => clr,
          q2 => q2
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
      clr <= '0';
		wait for 30 ns;
		clr <= '1';
		--wait for 30 ns;
		n <= "1101";
		wait for 5000 ns;
      
		n <= "0010";
		wait for 2000 ns;
		n <= "0110";
		wait for 2000 ns; 
		n <= "0001";
		wait for 600 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
