--------------------------------------------------------------------------------
-- Company: Ain Shams university
-- Engineer: Abdelrahman Oun
--
-- Create Date:   13:54:30 01/01/2022
-- Design Name:   
-- Module Name:   E:/collage/4th communication/1st semester/ICs/project/code/ATM_FSM/FSM_tb.vhd
-- Project Name:  ATM_FSM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--USE ieee.numeric_std.ALL;
 
ENTITY FSM_tb IS
END FSM_tb;
 
ARCHITECTURE behavior OF FSM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         i_clock 				: IN  std_logic;
         i_reset 				: IN  std_logic;
         i_enable 			: IN  std_logic;
         i_rd_valid 			: IN  std_logic;
         i_rd_data 			: IN  std_logic_vector(7 downto 0);
         i_valid_ID 			: IN  std_logic;
         i_card_ID 			: IN  std_logic_vector(7 downto 0);
         i_card_valid 		: IN  std_logic;
         i_time_out 			: IN  std_logic;
         i_feeder_done 		: IN  std_logic;
         i_receive_value 	: IN  std_logic_vector(7 downto 0);
         i_keyboard_valid 	: IN  std_logic;
         i_keyboard_data 	: IN  std_logic_vector(7 downto 0);
         i_yes 				: IN  std_logic;
         i_no 					: IN  std_logic;
         i_deposit 			: IN  std_logic;
         i_withdraw 			: IN  std_logic;
         i_change_pass 		: IN  std_logic;
         i_overflow 			: IN  std_logic;
         o_reg_file_en 		: OUT  std_logic;
         o_RW 					: OUT  std_logic;
         o_address 			: OUT  std_logic_vector(1 downto 0);
         o_wr_data 			: OUT  std_logic_vector(7 downto 0);
         o_printer_en 		: OUT  std_logic;
         o_scan_en 			: OUT  std_logic;
         o_motor_en 			: OUT  std_logic;
         o_timer_en 			: OUT  std_logic;
         o_timer_reset 		: OUT  std_logic;
         o_send_en 			: OUT  std_logic;
         o_receive_en 		: OUT  std_logic;
         o_send_value 		: OUT  std_logic_vector(7 downto 0);
         o_keyboard_en 		: OUT  std_logic;
         o_counter_reset 	: OUT  std_logic;
         o_count 				: OUT  std_logic;
         o_current_state 	: OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i_clock 				: std_logic := '1';
   signal i_reset 				: std_logic := '1';
   signal i_enable 				: std_logic := '0';
   signal i_rd_valid 			: std_logic := '0';
   signal i_rd_data 				: std_logic_vector(7 downto 0) := (others => '0');
   signal i_valid_ID 			: std_logic := '0';
   signal i_card_ID 				: std_logic_vector(7 downto 0) := (others => '0');
   signal i_card_valid 			: std_logic := '0';
   signal i_time_out 			: std_logic := '0';
   signal i_feeder_done 		: std_logic := '0';
   signal i_receive_value 		: std_logic_vector(7 downto 0) := (others => '0');
   signal i_keyboard_valid 	: std_logic := '0';
   signal i_keyboard_data 		: std_logic_vector(7 downto 0) := (others => '0');
   signal i_yes 					: std_logic := '0';
   signal i_no 					: std_logic := '0';
   signal i_deposit 				: std_logic := '0';
   signal i_withdraw 			: std_logic := '0';
   signal i_change_pass 		: std_logic := '0';
   signal i_overflow 			: std_logic := '0';

 	--Outputs
   signal o_reg_file_en 		: std_logic;
   signal o_RW 					: std_logic;
   signal o_address 				: std_logic_vector(1 downto 0);
   signal o_wr_data 				: std_logic_vector(7 downto 0);
   signal o_printer_en 			: std_logic;
   signal o_scan_en 				: std_logic;
   signal o_motor_en 			: std_logic;
   signal o_timer_en 			: std_logic;
   signal o_timer_reset 		: std_logic;
   signal o_send_en 				: std_logic;
   signal o_receive_en 			: std_logic;
   signal o_send_value 			: std_logic_vector(7 downto 0);
   signal o_keyboard_en 		: std_logic;
   signal o_counter_reset 		: std_logic;
   signal o_count 				: std_logic;
   signal o_current_state 		: std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant CLOCK_PERIOD : time := 15 ns;
	
	procedure check_outputs ( constant pattern : in std_logic_vector (28 downto 0)) is
			
		variable error_counter : integer := 0;		
	begin
		
		error_counter := 0;
		
		if o_reg_file_en /= pattern(28) then
			error_counter := error_counter + 1;
		end if;
		
		if o_RW /= pattern(27) then
			error_counter := error_counter + 1;
		end if;	
		
		if o_address /= pattern(26 downto 25) then
			error_counter := error_counter + 1;
		end if;		
		
		if o_wr_data /= pattern(24 downto 17) then
			error_counter := error_counter + 1;
		end if;	
		
		if o_printer_en /= pattern(16) then
			error_counter := error_counter + 1;
		end if;		
		
		if o_scan_en /= pattern(15) then
			error_counter := error_counter + 1;
		end if;
		
		if o_motor_en /= pattern(14) then
			error_counter := error_counter + 1;
		end if;	
		
		if o_timer_en /= pattern(13) then
			error_counter := error_counter + 1;
		end if;		
		
		if o_send_en /= pattern(12) then
			error_counter := error_counter + 1;
		end if;		
		
		if o_receive_en /= pattern(11) then
			error_counter := error_counter + 1;
		end if;		
		
		if o_send_value /= pattern(10 downto 3) then
			error_counter := error_counter + 1;
		end if;		
		
		if o_keyboard_en /= pattern(2) then
			error_counter := error_counter + 1;
		end if;		
		
		if o_counter_reset /= pattern(1) then
			error_counter := error_counter + 1;
		end if;		
		
		if o_count /= pattern(0) then
			error_counter := error_counter + 1;
		end if;		
		
		if error_counter = 0 then
			Report "test case passed" severity note;
		else
			Report "error occurred and erroer counter not equal to zero" severity error;
		end if;	
	end procedure check_outputs;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          i_clock => i_clock,
          i_reset => i_reset,
          i_enable => i_enable,
          i_rd_valid => i_rd_valid,
          i_rd_data => i_rd_data,
          i_valid_ID => i_valid_ID,
          i_card_ID => i_card_ID,
          i_card_valid => i_card_valid,
          i_time_out => i_time_out,
          i_feeder_done => i_feeder_done,
          i_receive_value => i_receive_value,
          i_keyboard_valid => i_keyboard_valid,
          i_keyboard_data => i_keyboard_data,
          i_yes => i_yes,
          i_no => i_no,
          i_deposit => i_deposit,
          i_withdraw => i_withdraw,
          i_change_pass => i_change_pass,
          i_overflow => i_overflow,
          o_reg_file_en => o_reg_file_en,
          o_RW => o_RW,
          o_address => o_address,
          o_wr_data => o_wr_data,
          o_printer_en => o_printer_en,
          o_scan_en => o_scan_en,
          o_motor_en => o_motor_en,
          o_timer_en => o_timer_en,
          o_timer_reset => o_timer_reset,
          o_send_en => o_send_en,
          o_receive_en => o_receive_en,
          o_send_value => o_send_value,
          o_keyboard_en => o_keyboard_en,
          o_counter_reset => o_counter_reset,
          o_count => o_count,
          o_current_state => o_current_state
        );

   -- periodic signals -clock signal-
   clock_process :process
   begin
		i_clock <= '1';
		wait for CLOCK_PERIOD/2;
		i_clock <= '0';
		wait for CLOCK_PERIOD/2;
   end process;
 

   -- Stimulus process for input patterns and test cases
   stim_proc: process
	
	
   begin	
		
      -- hold reset for 15*10 = 150ns	
		i_reset <= '0';
      wait for CLOCK_PERIOD*10;
		i_reset <= '1';
		
		-- wait one clock periode and enable the control unit
		wait for CLOCK_PERIOD;
		i_enable <= '1';
		
      -- insert stimulus here 
		--check idle state
		wait for CLOCK_PERIOD;
		check_outputs ("00000000000000000000000000000");
		
		--check card inserted
		i_card_valid <= '1';
		
		wait for CLOCK_PERIOD*2;
		check_outputs ("00000000000001000000000000000");
		
		--check reg file write id
		i_card_valid <= '0';
		i_card_ID <= "11011010"; -- card id
		i_valid_ID <= '1';
		
		
		wait for CLOCK_PERIOD*2;
		check_outputs ("10001101101000000000000000000");
		
		--check reg file read pass
		wait for CLOCK_PERIOD;
		check_outputs ("11010000000000000000000000000");
		
		--check enter pass
		i_card_ID <= "00000000"; -- card id
		i_valid_ID <= '0';
		i_rd_data <= "11001010"; --password saved in database
		i_rd_valid <= '1';
		
		wait for CLOCK_PERIOD*2;
		check_outputs ("00000000000000010000000000100");
		
		--check compare pass
		i_keyboard_data <= "11001010"; -- same password saved in database
		i_keyboard_valid <= '1';
		
		wait for CLOCK_PERIOD*2;
		check_outputs ("00000000000000000000000000000");
		
		--check main menu
		wait for CLOCK_PERIOD*2;
		check_outputs ("00000000000000010000000000010");
		
		--check withdraw operation "enter cash value"
		i_rd_data <= "00000000";
		i_rd_valid <= '0';
		i_keyboard_data <= "00000000";
		i_keyboard_valid <= '0';
		i_withdraw <= '1'; 
		
		wait for CLOCK_PERIOD*2;
		check_outputs ("00000000000000010000000000100");
		
		--check reg file read account
		i_keyboard_data <= "00010000"; -- cash value entered from user
		i_keyboard_valid <= '1';
		
		wait for CLOCK_PERIOD*2;
		check_outputs ("11100000000000000000000000000");
		
		--check compare_value
		i_rd_data <= "11000000"; --password saved in database
		i_rd_valid <= '1';
		
		wait for CLOCK_PERIOD*2;
		check_outputs ("00000000000000000000000000000");
		
		--check reg file write withdraw
		wait for CLOCK_PERIOD;
		check_outputs ("10110001000000000000000000000");
		
		--check send cash
		wait for CLOCK_PERIOD;
		check_outputs ("00000000000000001000010000000");
		
		--check another service
		i_feeder_done <= '1';
		i_withdraw <= '0';
		i_keyboard_data <= "00000000";
		i_keyboard_valid <= '0';
		i_rd_data <= "00000000";
		i_rd_valid <= '0';
		
		wait for CLOCK_PERIOD*2;
		check_outputs ("00000000000000010000000000000");
		
		--check print reciept and printing
		i_yes <= '0';
		i_no <= '1';
		i_feeder_done <= '0';
		
		wait for CLOCK_PERIOD;
		i_yes <= '1';
		i_no <= '0';
		
		wait for CLOCK_PERIOD;
		check_outputs ("00000000000000010000000000000");
		
		wait for CLOCK_PERIOD;
		check_outputs ("00000000000010000000000000000");
		
		--check restore card
		i_yes <= '0';
		
		wait for CLOCK_PERIOD;
		check_outputs ("00000000000000100000000000010");
		
		--check idle state
		wait for CLOCK_PERIOD;
		check_outputs ("00000000000000000000000000000");
		
      wait;
   end process;

END;
