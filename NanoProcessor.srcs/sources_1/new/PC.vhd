----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 08:04:16
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count_in : in STD_LOGIC_VECTOR (2 downto 0);
           Count_out : out STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is
    component D_FF is
        port(
           D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
    end component;    
    
--signal D : std_logic_vector (2 downto 0);

begin
                   
D_FF0 : D_FF
    port map(
        D => Count_in(0),
        Clk => Clk,
        Res => Reset,
        Q => Count_out(0));
         
D_FF1 : D_FF
    port map(
        D => Count_in(1),
        Clk => Clk,
        Res => Reset,
        Q => Count_out(1));
  
D_FF2 : D_FF
    port map(
         D => Count_in(2),
         Clk => Clk,
         Res => Reset,
         Q => Count_out(2));        
            
--Count_out <= dp;

end Behavioral;
