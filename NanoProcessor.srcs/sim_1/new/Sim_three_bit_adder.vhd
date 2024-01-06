----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2023 14:59:44
-- Design Name: 
-- Module Name: Sim_three_bit_adder - Behavioral
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

entity Sim_three_bit_adder is
--  Port ( );
end Sim_three_bit_adder;

architecture Behavioral of Sim_three_bit_adder is
 COMPONENT three_bit_adder
      PORT(Cin: IN STD_LOGIC;
          A,B : in STD_LOGIC_VECTOR (2 downto 0);
          Cout : OUT STD_LOGIC;
          Sum : out STD_LOGIC_VECTOR (2 downto 0));
 END COMPONENT;

Signal Cin,Cout : STD_LOGIC;
Signal A,Sum : STD_LOGIC_VECTOR(2 downto 0);
Signal B: STD_LOGIC_VECTOR(2 downto 0) := "001";

begin
UUT: three_bit_adder PORT MAP(
        A => A,
        B => B,
        Cin => Cin,
        Sum => Sum,
        Cout => Cout
);
PROCESS
       BEGIN
            
            A(0) <= '0';
            A(1) <= '0';
            A(2) <= '0';
           
            Cin <= '0';  --- for the adder
            WAIT FOR 100 ns;
            
            A(0) <= '1';
            A(1) <= '0';
            A(2) <= '1';
        
         
            WAIT FOR 100 ns;
    
            A(0) <= '1';
            A(1) <= '1';
            A(2) <= '1';
            
            
            WAIT;
    END PROCESS;

end Behavioral;