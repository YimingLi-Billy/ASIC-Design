// $Id: $
// File name:   tb_protocol_controller.sv
// Created:     11/12/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: tb

`timescale 1ns / 10ps

module tb_protocol_controller();

// Timing related constants
localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay

//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
// Testing control signal(s)
string   tb_test_case;
integer  tb_test_case_num;
string   tb_check_tag;

//*****************************************************************************
// General System signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst;

//*****************************************************************************
// Protocol Controller Signals
//*****************************************************************************
logic			tb_Buffer_Occupancy;
logic [6:0]             tb_TX_Packet_Data_Size;
logic                   tb_Buffer_Reserved;
logic [2:0]             tb_RX_Packet;
logic                   tb_RX_Error;
logic                   tb_RX_Transfer_Active;
logic                   tb_RX_Data_Ready;
logic                   tb_TX_Transfer_Active;
logic                   tb_TX_Error;
logic                   tb_D_Mode;
logic                   tb_clear;
logic [1:0]             tb_TX_Packet;

// Expected value check signals
logic                   tb_expected_RX_Error;
logic                   tb_expected_TX_Error;
logic                   tb_expected_D_Mode;
logic                   tb_expected_RX_Transfer_Active;
logic                   tb_expected_TX_Transfer_Active;
logic                   tb_expected_RX_Data_Ready;
logic [1:0]             tb_expected_TX_Packet;
logic			tb_expected_clear;

//*****************************************************************************
// Clock Generation Block
//*****************************************************************************
// Clock generation block
always begin
  // Start with clock low to avoid false rising edge events at t=0
  tb_clk = 1'b0;
  // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
  tb_clk = 1'b1;
  // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
end

//*****************************************************************************
// DUT Instance
//*****************************************************************************
protocol_controller DUT (
		    // Input
		    .clk(tb_clk), 
		    .n_rst(tb_n_rst),
                    .Buffer_Occupancy(tb_Buffer_Occupancy),
                    .TX_Packet_Data_Size(tb_TX_Packet_Data_Size),
                    .Buffer_Reserved(tb_Buffer_Reserved),
                    .RX_Packet(tb_RX_Packet),
		    // Output
                    .RX_Error(tb_RX_Error),
                    .RX_Transfer_Active(tb_RX_Transfer_Active),
                    .RX_Data_Ready(tb_RX_Data_Ready),
                    .TX_Transfer_Active(tb_TX_Transfer_Active),
                    .TX_Error(tb_TX_Error),
                    .D_Mode(tb_D_Mode),
                    .TX_Packet(tb_TX_Packet),
                    .clear(tb_clear));

//*****************************************************************************
// DUT Related TB Tasks
//*****************************************************************************
// Task for standard DUT reset procedure
task reset_dut;
begin
  // Activate the reset
  tb_n_rst = 1'b0;

  // Maintain the reset for more than one cycle
  @(posedge tb_clk);
  @(posedge tb_clk);

  // Wait until safely away from rising edge of the clock before releasing
  @(negedge tb_clk);
  tb_n_rst = 1'b1;

  // Leave out of reset for a couple cycles before allowing other stimulus
  // Wait for negative clock edges, 
  // since inputs to DUT should normally be applied away from rising clock edges
  @(negedge tb_clk);
  @(negedge tb_clk);
end
endtask

// Task to cleanly and consistently check DUT output values
task check_outputs;
  input string check_tag;
begin
  if (tb_expected_RX_Error == tb_RX_Error)
    $info("Correct 'RX_Error' output %s during %s test case", check_tag, tb_test_case);
  else 
    $error("Incorrect 'RX_Error' output %s during %s test case", check_tag, tb_test_case);

  if (tb_expected_TX_Error == tb_TX_Error)
    $info("Correct 'TX_Error' output %s during %s test case", check_tag, tb_test_case);
  else 
    $error("Incorrect 'TX_Error' output %s during %s test case", check_tag, tb_test_case);

  if (tb_expected_RX_Transfer_Active == tb_RX_Transfer_Active)
    $info("Correct 'RX_Transfer_Active' output %s during %s test case", check_tag, tb_test_case);
  else 
    $error("Incorrect 'RX_Transfer_Active' output %s during %s test case", check_tag, tb_test_case);

  if (tb_expected_TX_Transfer_Active == tb_TX_Transfer_Active)
    $info("Correct 'TX_Transfer_Active' output %s during %s test case", check_tag, tb_test_case);
  else 
    $error("Incorrect 'TX_Transfer_Active' output %s during %s test case", check_tag, tb_test_case);

  if (tb_expected_RX_Data_Ready == tb_RX_Data_Ready)
    $info("Correct 'RX_Data_Ready' output %s during %s test case", check_tag, tb_test_case);
  else 
    $error("Incorrect 'RX_Data_Ready' output %s during %s test case", check_tag, tb_test_case);

  if (tb_expected_D_Mode == tb_D_Mode)
    $info("Correct 'D_Mode' output %s during %s test case", check_tag, tb_test_case);
  else 
    $error("Incorrect 'D_Mode' output %s during %s test case", check_tag, tb_test_case);

  if (tb_expected_TX_Packet == tb_TX_Packet)
    $info("Correct 'RX_Error' output %s during %s test case", check_tag, tb_test_case);
  else 
    $error("Incorrect 'RX_Error' output %s during %s test case", check_tag, tb_test_case);

  if (tb_expected_clear == tb_clear)
    $info("Correct 'clear' output %s during %s test case", check_tag, tb_test_case);
  else 
    $error("Incorrect 'clear' output %s during %s test case", check_tag, tb_test_case);
end
endtask

//*****************************************************************************
//*****************************************************************************
// Main TB Process
//*****************************************************************************
//*****************************************************************************
initial begin
  // Initialize Test Case Navigation Signals
  tb_test_case       = "Initilization";
  tb_test_case_num   = -1;
  // Wait some time before starting first test case
  #(0.1);

  //*****************************************************************************
  // Power-on-Reset Test Case
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Power-on-Reset";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Expected Outputs
  tb_expected_RX_Error = 0;
  tb_expected_TX_Error = 0;
  tb_expected_D_Mode = 0;
  tb_expected_RX_Transfer_Active = 0;
  tb_expected_TX_Transfer_Active = 0;
  tb_expected_RX_Data_Ready = 0;
  tb_expected_TX_Packet = 0;
  tb_expected_clear = 0;

  // Reset the DUT
  reset_dut();

  // Check outputs for reset state
  check_outputs("after DUT reset");

  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);


end

endmodule
