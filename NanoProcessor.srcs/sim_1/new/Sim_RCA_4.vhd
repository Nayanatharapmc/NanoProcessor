----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 14:25:43
-- Design Name: 
-- Module Name: TB_RCA4 - Behavioral
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

entity Sim_RCA_4 is
--  Port ( );
end Sim_RCA_4;

architecture Behavioral of Sim_RCA_4 is
 COMPONENT RCA_4
       PORT(  A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           M  : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 downto 0);
           carry : out STD_LOGIC;
           zero : out STD_LOGIC);
   END COMPONENT;
   
   SIGNAL A0,A1,A2,A3,B0,B1,B2,B3,M : std_logic;
   SIGNAL S0,S1,S2,S3,C_OUT ,zero: std_logic;

begin
UUT: RCA_4 PORT MAP(
        A(0) => A0,
        A(1) => A1,
        A(2) => A2,
        A(3) => A3,
        B(0) => B0,
        B(1) => B1,
        B(2) => B2,
        B(3) => B3,
        M => M,
        S(0) => S0,
        S(1) => S1,
        S(2) => S2,
        S(3) => S3,
        carry => C_OUT,
        zero => zero
);
PROCESS
   BEGIN
	--110 011 011 000 010 001--
	    M<='1';
		A0<='0';
		B0<='0';
		A1<='0';
		B1<='0';
		A2<='0';
		B2<='0';
		A3<='0';
		B3<='0';
		WAIT FOR 100 ns;
		
		A0<='0';
		B0<='1';
		A1<='0';
		B1<='1';
		A2<='0';
		B2<='1';
		A3<='1';
		B3<='0';
		WAIT FOR 100 ns;
		
		A0<='0';
		B0<='0';
		A1<='1';
		B1<='1';
		A2<='0';
		B2<='0';
		A3<='1';
		B3<='1';
		WAIT FOR 100 ns;
		
		A0<='0';
		B0<='1';
		A1<='0';
		B1<='1';
		A2<='1';
		B2<='0';
		A3<='1';
		B3<='1';
		WAIT FOR 100 ns;
		
		A0<='1';
		B0<='1';
		A1<='1';
		B1<='1';
		A2<='1';
		B2<='1';
		A3<='1';
		B3<='0';
		WAIT FOR 100 ns;
		
		A0<='0';
		B0<='0';
		A1<='0';
		B1<='0';
		A2<='1';
		B2<='1';
		A3<='1';
		B3<='1';
		WAIT FOR 100 ns;
		
		A0<='0';
		B0<='0';
		A1<='1';
		B1<='1';
		A2<='0';
		B2<='0';
		A3<='1';
		B3<='1';
		WAIT FOR 100 ns;
		
		A0<='0';
		B0<='1';
		A1<='0';
		B1<='1';
		A2<='0';
		B2<='1';
		A3<='0';
		B3<='1';
		WAIT FOR 100 ns;
		
		A0<='1';
		B0<='1';
		A1<='0';
		B1<='0';
		A2<='1';
		B2<='0';
		A3<='1';
		B3<='0';
      WAIT; -- will wait forever
   END PROCESS;
end Behavioral;