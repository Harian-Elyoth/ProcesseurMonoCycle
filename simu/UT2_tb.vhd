library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UT2_tb is
end entity;

architecture BENCH of UT2_tb is
    signal IMM		: std_logic_vector (7 downto 0);
		signal RA, RB, RW	: std_logic_vector (3 downto 0) := "0000";
		signal OP	: std_logic_vector (1 downto 0);
		signal REGWR, WE, CLK, SEL1, SEL2		: std_logic;
		signal N	:  std_logic;
		
		begin
		  
		  clock : process
		  
		  begin
		    
		    clk <= '1';
		    
		    wait for 10 ns;
		    
		    clk <= '0';
		    
		    wait for 10 ns;
		    
		    end process;
		    
		    test_bench : process
		    
		    begin
		      
		      
		      wait for 10 ns;
		      
		      RA <="0000";
		      RB <="0000";
		      RW <= "0000";
		      REGWR <= '0';
		      WE <= '0';
		      SEL1 <= '0';
		      SEL2 <= '0';
		      S <= "00000000000000000000000000000000";
		      
		      --Addition de 2 registres 
		      -- R(1) = R(1) + R(15);
		      
		      OP <= "00";
		      RW <= "0001";
          RA <= "0001";
          RB <= "1111";
          REGWR <= '1';
    
          wait for 10 ns; 
		      
		      assert S <= X"00000030" report "INSTRUCTION 1 ERROR" severity note;
		      
		      wait for 10 ns;
		      
		      --Addition registre avec Immediat --
		      --R(2) = R(15) + 1
		      
		      Imm <="00000001";
          RW <= "0010";
          RA <= "1111";
          SEL1 <= '1';
          
          wait for 10 ns;
          
          assert S <= X"00000031" report "Instruction 2 error" severity note;
          
          wait for 10 ns;
          
          --Soustraction de 2 registres
          --R(3) = R(3) - R(15)
          
  		      OP <= "10";
		      RW <= "0011";
          RA <= "0011";
          RB <= "1111";
          REGWR <= '1';
          SEL1 <= '0';
          
          wait for 10 ns;
          
          assert S = X"FFFFFFD0" report "Instruction 3 error" severity note;
    
          wait for 10 ns;
          
          --SOustraction d'un registre avec une valeur Immediate
          --R(15) = R(15) - 1;
          
          Imm <="00000001";
          RW <= "1111";
          RA <= "1111";
          SEL1 <= '1';
          
          wait for 10 ns;
          
          assert S = X"0000002F" report "Instruction 4 error" severity note;
          
          wait for 10 ns;
          
          --Copie un registre dans un autre
          --R(4) = R(3)
          OP <= "11";
		      RW <= "0100";
          RA <= "0011";
          REGWR <= '1';
          SEL1 <= '0';
          
          wait for 10 ns;
          
          assert S = X"FFFFFFD0" report "Instruction 5 error" severity note;
          
          wait for 10 ns;
          
          --ecriture d'un registre dans un mot memoire
          --R(4) => Addre(5);
          
          WE <= '1';
          RB <= "0100";
          OP <= "01";
          SEL1 <= '1';
          SEL2 <= '1';
          Imm <= "00000101";
          
          wait for 10 ns;
          
          assert S = X"FFFFFFD0" report "Instruction 7 erreur" severity note;
          
          wait for 10 ns;
          
          --Lecture d'un mot memoire dans un registre
          --R(5) = Memory Adress (5)
          
          Imm <= "00000101";
          SEL1 <= '1';
          OP <= "01";
          WE <= '0';
          SEL2 <= '1';
          REGWR <= '1';
          RW <= "0101";
          
          wait for 10 ns;
          
          assert S = X"FFFFFFD0" report "Instruction 6 erreur" severity note;
          wait;
          
        end process;
        UT : entity work.UT2 port map(IMM , RA, RB, RW, OP, REGWR, WE, CLK, SEL1, SEL2, N);
        
      end architecture;
          
          