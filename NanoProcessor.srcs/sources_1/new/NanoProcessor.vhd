----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.06.2023 09:51:58
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           zero : out STD_LOGIC;
           Carry : out STD_LOGIC;
           R7 : out STD_LOGIC_VECTOR(3 downto 0);
           Display_7_Seg : out STD_LOGIC_VECTOR(6 downto 0);
           Anode_activate : out STD_LOGIC_VECTOR (3 downto 0));
end NanoProcessor;

architecture Behavioral of NanoProcessor is
component Slow_Clk
    port( Clk_in : in STD_LOGIC;
          Clk_out : out STD_LOGIC);
end component;

component PC
    Port(
       Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Count_in : in STD_LOGIC_VECTOR (2 downto 0);
       Count_out : out STD_LOGIC_VECTOR (2 downto 0));
end component; 

component Prog_ROM
    Port ( Memo_select : in STD_LOGIC_VECTOR (2 downto 0);
           Ins_bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component  Ins_decoder
    Port ( Data : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_enable : out STD_LOGIC_VECTOR (2 downto 0);
           Immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           Load_select : out STD_LOGIC;
           Reg_select0 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_select1 : out STD_LOGIC_VECTOR (2 downto 0);
           Add_sub_select : out STD_LOGIC;
           Jump_flag : out STD_LOGIC;
           Jump_address : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component three_bit_adder
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (2 downto 0);
           Cout : out STD_LOGIC);
end component;

component Mux_2way_3bit
    Port ( A : in STD_LOGIC_VECTOR(2 downto 0);
           B : in STD_LOGIC_VECTOR(2 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component Mux_2way_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Add_Sub
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           M  : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 downto 0);
           carry : out STD_LOGIC;
           zero : out STD_LOGIC);
end component;

component Reg_Bank
    Port ( Reg_Enable : in STD_LOGIC_VECTOR(2 downto 0);
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
end component;

component LUT_16_7
    port(address : in STD_LOGIC_VECTOR (3 downto 0);
         data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Mux_8way_4bit
    Port ( D0,D1,D2,D3,D4,D5,D6,D7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component; 
                                         
signal signalIn, signalOut, reg_enable, jadd, sum, muxIn0, muxIn1 : STD_LOGIC_VECTOR(2 downto 0);
signal instruction : STD_LOGIC_VECTOR(11 downto 0);
signal reg_check, value, muxIn2, reg_value, q0, q1, q2, q3, q4, q5, q6, q7, out0, out1 : STD_LOGIC_VECTOR(3 downto 0); 
signal loadsel, sel, jflag, Carry0, zero0, clk_out, clock : STD_LOGIC; 
signal DisplaySeg : STD_LOGIC_VECTOR(6 downto 0);
       
begin
slow_clock0 : Slow_Clk
    port map(
        Clk_in => Clk,
        Clk_out => clk_out);
        
Program_Counter : PC
    port map(
        Clk => clk_out,
        Reset => Reset,
        Count_in => signalIn,
        Count_out => signalOut);
        
Prog_ROM0 : Prog_ROM
    port map(
        Memo_select => signalOut,
        Ins_bus => instruction);
        
Instruction_Decoder : Ins_decoder
    port map(
        Data => instruction,
        Reg_check => out0,
        Reg_enable => reg_enable,
        Immediate_value => value,
        Load_select => loadsel, 
        Reg_select0 => muxIn0,
        Reg_select1 => muxIn1,              
        Add_sub_select => sel,
        Jump_flag => jflag,
        Jump_address => jadd);
        
Mux_2way_4bit0 : Mux_2way_4bit
    port map(
        A => value,
        B => muxIn2,
        S => loadsel,
        Q => reg_value);
        
Reg_Bank0 : Reg_Bank
    port map(
        Reg_Enable => reg_enable,
        Reset => Reset,
        D => reg_value,
        Clk => clk_out,
        Q0 => q0,
        Q1 => q1,
        Q2 => q2,
        Q3 => q3,
        Q4 => q4,
        Q5 => q5,
        Q6 => q6,
        Q7 => q7);
        
Mux_8way_4bit0 : Mux_8way_4bit
    port map(
        D0 => q0,
        D1 => q1,
        D2 => q2,
        D3 => q3,
        D4 => q4,
        D5 => q5,
        D6 => q6,
        D7 => q7,
        S => muxIn0,
        Q => out0);
        
Mux_8way_4bit1 : Mux_8way_4bit
    port map(
        D0 => q0,
        D1 => q1,
        D2 => q2,
        D3 => q3,
        D4 => q4,
        D5 => q5,
        D6 => q6,
        D7 => q7,
        S => muxIn1,
        Q => out1);
        
Add_Sub0 : Add_Sub
    port map(
        A(0) => out0(0),
        A(1) => out0(1),
        A(2) => out0(2),
        A(3) => out0(3),
        B(0) => out1(0),
        B(1) => out1(1),
        B(2) => out1(2),
        B(3) => out1(3),
        M => sel,
        S(0) => muxIn2(0),
        S(1) => muxIn2(1),
        S(2) => muxIn2(2),
        S(3) => muxIn2(3),
        zero => zero0,
        carry => Carry0); 
        
three_bit_adder0 : three_bit_adder
    port map(
        A => signalOut,
        B => "001",
        Cin => '0',
        Sum => sum);
        
Mux_2way_3bit0 : Mux_2way_3bit
    port map(
        A => sum,
        B => jadd,
        S => jflag,
        Q => signalIn);
        
LUT_16_70 : LUT_16_7
    port map(
        address => q7,
        data => DisplaySeg);        

                
R7 <= q7;
zero <= zero0;
Carry <= Carry0;
Display_7_Seg <= DisplaySeg;
Anode_activate <= "1110";

end Behavioral;
