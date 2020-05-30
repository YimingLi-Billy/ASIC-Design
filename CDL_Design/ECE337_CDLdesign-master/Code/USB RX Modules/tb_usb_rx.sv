// $Id: $
// File name:   tb_usb_rx.sv
// Created:     2/5/2013
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: 

`timescale 1ns / 10ps

module tb_usb_rx();

  // Define parameters
  parameter CLK_PERIOD        = 2.5;
  parameter NORM_DATA_PERIOD  = (10 * CLK_PERIOD);
  
  //localparam OUTPUT_CHECK_DELAY = (CLK_PERIOD - 0.2);
  //localparam WORST_FAST_DATA_PERIOD = (NORM_DATA_PERIOD * 0.96);
  //localparam WORST_SLOW_DATA_PERIOD = (NORM_DATA_PERIOD * 1.04);
  
  //  DUT inputs
  reg tb_clk;
  reg tb_n_rst;
  reg tb_d_plus;
  reg tb_d_minus;
  
  // DUT outputs
  wire [2:0] tb_rx_packet;
  wire [7:0] tb_rx_packet_data;
  wire tb_store_rx_packet_data;
  
  // Test bench debug signals
  // Overall test case number for reference
  integer tb_test_num;
  string  tb_test_case;
  // Test case 'inputs' used for test stimulus
  reg [7:0] tb_test_data; // should be the decoded version of what gets sent through.
  
  // Test case expected output values for the test case
  reg [2:0] tb_expected_rx_packet;
  reg [7:0] tb_expected_rx_packet_data;
  reg       tb_expected_store_rx_packet_data;
  
  // DUT portmap
  usb_rx DUT
  (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .d_plus(tb_d_plus),
    .d_minus(tb_d_minus),
    .rx_packet(tb_rx_packet),
    .rx_packet_data(tb_rx_packet_data),
    .store_rx_packet_data(tb_store_rx_packet_data)
  );
  
  // Tasks for regulating the timing of input stimulus to the design
  task send_sequence; // TODO: I need to change this....
    input  [7:0] data;
    reg    [7:0] d_plus_input;
    reg    [7:0] d_minus_input;
    time   data_period;
    integer i;
    integer j;
  begin
    // First synchronize to away from clock's rising edge
    @(negedge tb_clk)
    
    
    d_plus_input = '1;
    d_minus_input = '0;
    if(data[7] == 1'b0) begin
       d_plus_input[7] = 1'b0;
       d_minus_input[7] = 1'b1;    
    end
    else begin
      $display("Was this a valid data packet? It may cause a glitch.");
    end 
    for(i = 6; i > -1; i = i - 1) 
    begin
      if(data[i] == 1'b0) begin
        d_plus_input[i] = !d_plus_input[i+1];
        d_minus_input[i] = !d_minus_input[i +1];
      end 
      else begin
       d_plus_input[i] = d_plus_input[i+1];
       d_minus_input[i] = d_minus_input[i+1];
      end
    end
    
    // Send data bits
    for(j = 7; j > -1; j = j - 1)
    begin
      tb_d_plus = d_plus_input[j];
      tb_d_minus = d_minus_input[j];
      #data_period;
    end
    
    // Send stop bit
    //tb_serial_in = stop_bit;
    //#data_period;
  end
  endtask

  task send_eop;
    reg [7:0] d_plus_input;
    reg [7:0] d_minus_input;
    integer i;
    time data_period;
  begin
    d_plus_input = 8'b00111111;
    d_minus_input = 8'b0000000;
    for(i = 7; i > -1; i = i - 1) begin
      tb_d_plus = d_plus_input[i];
      tb_d_minus = d_minus_input[i];
      #data_period;
    end
  end
  endtask
  
  task reset_dut;
  begin
    // Activate the design's reset (does not need to be synchronize with clock)
    tb_n_rst = 1'b0;
    
    // Wait for a couple clock cycles
    @(posedge tb_clk);
    @(posedge tb_clk);
    
    // Release the reset
    @(negedge tb_clk);
    tb_n_rst = 1;
    
    // Wait for a while before activating the design
    @(posedge tb_clk);
    @(posedge tb_clk);
  end
  endtask
  
  task check_outputs;
  begin
    // Don't need to syncrhonize relative to clock edge for this design's outputs since they should have been stable for quite a while given the 2 Data Period gap between the end of the packet and when this should be used to check the outputs
    
    // Data recieved should match the data sent
    assert(tb_expected_rx_packet_data == tb_rx_packet_data)
      $info("Test case %0d: Test data correctly received", tb_test_num);
    else
      $error("Test case %0d: Test data was not correctly received", tb_test_num);
      
    // Should tell what kind of packet is being transmitted and/or where the receiver is in processing the current packet (e.g. "DONE")
    assert(tb_expected_rx_packet == tb_rx_packet)
      $info("Test case %0d: DUT correctly shows the right packet", tb_test_num);
    else
      $error("Test case %0d: DUT incorrectly shows the right packet", tb_test_num);
    
    // For every 'data packet' regrardless of token, this should be asserted once the data is ready and hasn't failed. 
    assert(tb_expected_store_rx_packet_data == tb_store_rx_packet_data)
      $info("Test case %0d: DUT correctly asserted the store rx packet data flag", tb_test_num);
    else
      $error("Test case %0d: DUT did not correctly asserted the store rx packet data flag", tb_test_num);
  end
  endtask
  
  always
  begin : CLK_GEN
    tb_clk = 1'b0;
    #(CLK_PERIOD / 2);
    tb_clk = 1'b1;
    #(CLK_PERIOD / 2);
  end

  // Actual test bench process
  initial
  begin : TEST_PROC
    // Initialize all test bench signals
    tb_test_num               = -1;
    tb_test_case              = "TB Init";
    tb_test_data              = 8'b0;
    tb_expected_rx_packet       = 3'b0; 
    tb_expected_rx_packet_data = 8'b0;
    tb_expected_store_rx_packet_data       = 1'b0;
    // Initilize all inputs to inactive/idle values
    tb_n_rst      = 1'b1; // Initially inactive
    tb_d_plus  = 1'b1; // Initially idle
    tb_d_minus = 1'b0; // Initially idle
    
    // Get away from Time = 0
    #0.1; 
    
    // Test case 0: Basic Power on Reset
    tb_test_num  = 0;
    tb_test_case = "Power-on-Reset";
    
    // Power-on Reset Test case: Simply populate the expected outputs
    // These values don't matter since it's a reset test but really should be set to 'idle'/inactive values
    tb_test_data        = 8'b0;
    
    // Define expected ouputs for this test case
    // Note: expected outputs should all be inactive/idle values
    // For a good packet RX Data value should match data sent
    tb_expected_rx_packet       = 8'b0;

    tb_expected_rx_packet_data       = 8'b0;
    // Not intentionally creating an overrun condition -> overrun should be 0
    tb_expected_store_rx_packet_data       = 1'b0;
    
    // DUT Reset
    reset_dut;
    
    // Check outputs
    check_outputs();
    
    // Test case 1: Normal IN Packet
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "Normal IN Packet";
    
    // Setup packet info for debugging/verificaton signals
    tb_test_data       = 8'b00000001; // sync byte
    
    // Define expected ouputs for this test case
    // For a good packet RX Data value should match data sent
    tb_expected_rx_packet_data       = tb_test_data;
    tb_expected_rx_packet            = 3'b000; // This shouldn't change until a PID is read in
    tb_expected_store_rx_packet_data = 1'b0; // This shouldn't change until a data packet is read in.
    
    // DUT Reset
    reset_dut;
    
    // Send packet
    send_packet(tb_test_data, NORM_DATA_PERIOD);
    
    // Check outputs
    check_outputs();

    tb_test_data = 8'b10010110; // IN PID; correct. not incurring errors.
    
    tb_expected_rx_packet_data       = tb_test_data;
    tb_expected_rx_packet            = 3'b001;

    send_packet(tb_test_data, NORM_DATA_PERIOD);

    check_outputs();

    tb_test_data = 8'b00000001; // ADDRESS: Note, since it should only be 7 bits long, I made the 8th bit 0. Given protocol this might be different.
    tb_expected_rx_packet_data       = tb_test_data;
    tb_expected_store_rx_packet_data = 1'b1;

    send_packet(tb_test_data, NORM_DATA_PERIOD);

    check_outputs();
        
    tb_test_data = 8'b00000010; // ENDPOINT: Note this is 4 bits long so I put it on the last 4 to make the value stick 
                                // (if it were the first four it'd be different). Also assigned an aribtrary value.
    tb_expected_rx_packet_data       = tb_test_data; 

    send_packet(tb_test_data, NORM_DATA_PERIOD);

    check_outputs();   

    tb_test_data = 8'b????????; // CRC 5-bit, this isn't a value I know. I just know it is 5 bits and needs to be correct. 
    tb_expected_rx_packet_data       = tb_test_data;

    send_packet(tb_test_data, NORM_DATA_PERIOD);

    check_outputs(); 

    send_eop();

    tb_expected_store_rx_packet_data = 1'b0;
    tb_expected_rx_packet = 3'b101;

    check_outputs();


    // Test case 2: Not Implemented
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num += 1;
    tb_test_case = "Whatever else is appropriate";
    

  end
endmodule