----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.06.2023 16:09:47
-- Design Name: 
-- Module Name: Sim_NanoProcessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sim_NanoProcessor is
--  Port ( );
end Sim_NanoProcessor;

architecture Behavioral of Sim_NanoProcessor is
  component NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           zero : out STD_LOGIC;
           Carry : out STD_LOGIC;
           R7 : out STD_LOGIC_VECTOR(3 downto 0);
           Display_7_Seg : out STD_LOGIC_VECTOR(6 downto 0);
           Anode_activate : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

  signal Clk, Reset, zero, Carry : STD_LOGIC;
  signal R7 : STD_LOGIC_VECTOR(3 downto 0);
  signal Display_7_Seg : STD_LOGIC_VECTOR(6 downto 0);
  signal Anode_activate : STD_LOGIC_VECTOR(3 downto 0);

begin
  -- Instantiate the NanoProcessor
  uut : NanoProcessor
    port map (
      Clk => Clk,
      Reset => Reset,
      zero => zero,
      Carry => Carry,
      R7 => R7,
      Display_7_Seg => Display_7_Seg,
      Anode_activate => Anode_activate);

   -- Clock process
  Clk_process: process
  begin
    Clk <= '0';
    wait for 5 ns;
    Clk <= '1';
    wait for 5 ns;
  end process;


 stimulus_process: process
  begin
    Reset <= '1';
    wait for 100 ns;
    Reset <= '0';
    
  
    -- Add additional stimulus or checks if needed
  
    -- Wait for simulation to finish
    wait;
  end process stimulus_process;
end Behavioral;