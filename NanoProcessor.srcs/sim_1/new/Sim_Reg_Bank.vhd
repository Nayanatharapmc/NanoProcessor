----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 17:39:25
-- Design Name: 
-- Module Name: Sim_Reg_Bank - Behavioral
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

entity Sim_Reg_Bank is
--  Port ( );
end Sim_Reg_Bank;

architecture Behavioral of Sim_Reg_Bank is

COMPONENT Reg_Bank
    port(
           Reg_Enable : in STD_LOGIC_VECTOR(2 downto 0);
           Reset : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0)); 
END COMPONENT;

signal Reg_Enable : STD_LOGIC_VECTOR(2 downto 0);
signal D,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7 : STD_LOGIC_VECTOR(3 downto 0);
signal Reset,Clk : STD_LOGIC;
              
begin
UUT : Reg_Bank 
    PORT MAP(
        Reg_Enable => Reg_Enable,
        Reset => Reset,
        D =>D,
        Clk => Clk,
        Q0 => Q0,
        Q1 => Q1,
        Q2 => Q2,
        Q3 => Q3,
        Q4 => Q4,
        Q5 => Q5,
        Q6 => Q6,
        Q7 => Q7);
 Clk_process: process
                      begin
                          Clk <= '0';
                          wait for 5 ns;
                          Clk <= '1';
                          wait for 5 ns;
                      end process;
         
         process 
         begin
         
         Reset <= '1';
         wait for 50ns;
         
         Reset<='0';
         Reg_Enable<="001";
         D<="0001";
         wait for 105ns;
         
        
         
         Reset <= '1';
         wait for 50ns;
         
         Reset<='0';
         Reg_Enable<="111";
         D<="0001";
         wait for 105ns;
         
         Reg_Enable<="001";
         D<="1001";
         wait for 102ns;
         
          Reg_Enable<="010";
                 D<="1001";
                 wait for 102ns;
         Reg_Enable<="101";
         D<="1101";
         wait for 103ns;
          
          Reg_Enable<="110";
          D<="0011";

      
      WAIT;
end process;
    
end Behavioral;
