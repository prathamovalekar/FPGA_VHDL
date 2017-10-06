library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity rom_display is
	port(	incr :in std_logic;
			clr:in std_logic;
			clk:in std_logic;
			an:out unsigned (7 downto 0);
			a_to_g: out unsigned(6 downto 0)
			);
			
end entity;


architecture behave of rom_display is

	---------- Components -------------
	---------- De-bounce --------------
	component debounce is
		port (	incr : 	in std_logic;
				clk  :	in std_logic;
				incr_pulse:out std_logic);
	end component;

	----------------------------------
	-------------- ROM ---------------
	component rom is
		port(	addr:in unsigned (2 downto 0);
				dataout: out unsigned(3 downto 0));
	end component;
	
	
	----------------------------------
	----------- hex7dec --------------
	component hex7dec is
		port(	dataout : in unsigned (3 downto 0);
				a_to_g: out unsigned (6 downto 0));
	end component;


	---------------------------------------------
	------------- Signals -----------------------
	signal dataout_rom : unsigned(3 downto 0);
	signal addr : unsigned (2 downto 0);
	signal incr_pulse:std_logic;

	
---------------------------------------------------
begin

   ------------ Instantiation --------------------
   ------------- De-bounce -----------------------
    U0: debounce port map	(	incr=>incr,
								clk=>clk,
								incr_pulse=>incr_pulse);
								
	U1:	rom port map		(	addr=>addr,
								dataout=>dataout_rom);
								
	U2: hex7dec port map(		dataout=>dataout_rom,
								a_to_g=>a_to_g);
   
------------------------------------------------------
------------------------------------------------------   
	
	---------- Address Counter 	------------------
process(clk)
begin
		if (clk'event and clk='1') then
			if clr='1' then
				addr<=(others=>'0');
			elsif incr_pulse='1' then
				addr <= addr+1;
			     
			end if;
		end if;	
end process;
	-----------------------------------------------
	
	--------- SelectSignals for 7Segment -----------
	an(0) 			<='0';
	an(7 downto 1) 	<="1111111";

end behave;