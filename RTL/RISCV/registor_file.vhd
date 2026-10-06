----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 10/03/2026 07:02:51 PM
-- Design Name:
-- Module Name: registor_file - Behavioral
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is
    generic (
        XLEN : integer range 0 to 64 := 64
            
    );
 port(
     clk, rst, we1, we2, we3 : in std_ulogic; -- we разрешения на запись сlk стандартно re разрешение на чтение
     d_n1, d_n2, d_n3 : in std_ulogic_vector(XLEN-1 downto 0); --запись 
     we1_addr, we2_addr, we3_addr : in std_ulogic_vector(4 downto 0); -- адрес записи 
     q_o1, q_o2, q_o3, q_o4, q_o5, q_o6 : out std_ulogic_vector(XLEN-1 downto 0); -- data out чтение
     rd1_addr, rd2_addr, rd3_addr, rd4_addr, rd5_addr, rd6_addr : in std_ulogic_vector(4 downto 0) -- адреса чтения 
  ); 
end register_file;

architecture registor_file of register_file is
    type XVF11 is array (1 to 31) of std_ulogic_vector(XLEN-1 downto 0); --масив по факту регистры
    signal alisa : XVF11 :=(others => (others => '0')); --присваиваем 0 всем регистрам   
    constant X0 : std_ulogic_vector(XLEN-1 downto 0) := (others => '0');
begin
    process(clk, rst)
    begin
        if rst = '1' then
            alisa <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if we1 = '1' and we1_addr /= "00000" then
                alisa(TO_INTEGER(unsigned(we1_addr))) <= d_n1;
            end if;
             if we2 = '1' and we2_addr /= "00000" then
                alisa(TO_INTEGER(unsigned(we2_addr))) <= d_n2;
            end if;
            if we3 = '1' and we3_addr /= "00000" then
                alisa(TO_INTEGER(unsigned(we3_addr))) <= d_n3;
            end if;
        end if;

    end process;
    
   
        q_o1 <= X0 when rd1_addr = "000000" else alisa(TO_INTEGER(unsigned(rd1_addr)));
        q_o2 <= X0 when rd2_addr = "000000" else alisa(TO_INTEGER(unsigned(rd2_addr)));
        q_o3 <= X0 when rd3_addr = "000000" else alisa(TO_INTEGER(unsigned(rd3_addr)));
        q_o4 <= X0 when rd4_addr = "000000" else alisa(TO_INTEGER(unsigned(rd4_addr)));
        q_o5 <= X0 when rd5_addr = "000000" else alisa(TO_INTEGER(unsigned(rd5_addr)));
        q_o6 <= X0 when rd6_addr = "000000" else alisa(TO_INTEGER(unsigned(rd6_addr)));

end registor_file;