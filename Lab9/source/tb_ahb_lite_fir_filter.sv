
// $Id: $
// File name:   tb_apb_uart_rx.sv
// Created:     10/13/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: APB-UART Receiver Peripheral

`timescale 1ns / 10ps

module tb_ahb_lite_fir_filter();

// Timing related constants
localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay

// Sizing related constants
localparam DATA_WIDTH      = 2;
localparam ADDR_WIDTH      = 4;
localparam DATA_WIDTH_BITS = DATA_WIDTH * 8;
localparam DATA_MAX_BIT    = DATA_WIDTH_BITS - 1;
localparam ADDR_MAX_BIT    = ADDR_WIDTH - 1;

// Define our address mapping scheme via constants
localparam ADDR_STATUS      = 4'd0;
localparam ADDR_STATUS_BUSY = 4'd0;
localparam ADDR_STATUS_ERR  = 4'd1;
localparam ADDR_RESULT      = 4'd2;
localparam ADDR_SAMPLE      = 4'd4;
localparam ADDR_COEF_START  = 4'd6;  // F0
localparam ADDR_COEF_SET    = 4'd14; // Coeff Set Confirmation

// AHB-Lite-Slave reset value constants
// Student TODO: Update these based on the reset values for your config registers
localparam RESET_COEFF  = '0;
localparam RESET_SAMPLE = '0;

//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
// Testing setup signals
logic                      tb_enqueue_transaction;
logic                      tb_transaction_write;
logic                      tb_transaction_fake;
logic [ADDR_MAX_BIT:0]     tb_transaction_addr;
logic [DATA_MAX_BIT:0]     tb_transaction_data;
logic                      tb_transaction_error;
logic [2:0]                tb_transaction_size;
// Testing control signal(s)
logic    tb_enable_transactions;
integer  tb_current_transaction_num;
logic    tb_current_transaction_error;
logic    tb_model_reset;
string   tb_test_case;
integer  tb_test_case_num;
logic [DATA_MAX_BIT:0] tb_test_data;
string                 tb_check_tag;
logic                  tb_mismatch;
logic                  tb_check;

//*****************************************************************************
// General System signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst;

//*****************************************************************************
// AHB-Lite-Slave side signals
//*****************************************************************************
logic                  tb_hsel;
logic [1:0]            tb_htrans;
logic [ADDR_MAX_BIT:0] tb_haddr;
logic [2:0]            tb_hsize;
logic                  tb_hwrite;
logic [DATA_MAX_BIT:0] tb_hwdata;
logic [DATA_MAX_BIT:0] tb_hrdata;

logic                  tb_hresp;

//*****************************************************************************
// FIR Filter-side Signals
//*****************************************************************************
// From FIR Filter or Coefficient Loader (TB)
logic [DATA_MAX_BIT:0]  tb_fir_out;
logic                   tb_modwait;
logic                   tb_err;
logic [1:0]             tb_coeff_num;
// To FIR Filter or Coefficient Loader (From DUT)
logic                   tb_data_ready;
logic [DATA_MAX_BIT:0]  tb_sample_data;
logic                   tb_new_coeff_set;
logic [DATA_MAX_BIT:0]  tb_fir_coefficient;

// Expected value check signals
logic                   tb_expected_data_ready;
logic [DATA_MAX_BIT:0]  tb_expected_sample;
logic                   tb_expected_new_coeff_set;
logic [DATA_MAX_BIT:0]  tb_expected_coeff;

// For Testing
typedef struct
{
	reg [DATA_MAX_BIT:0] coeffs[3:0];
	reg [DATA_MAX_BIT:0] samples[3:0];
	reg [DATA_MAX_BIT:0] results[3:0];
	reg errors[3:0];
} testVector;

logic [15:0]		tb_coeff1;
logic [15:0]		tb_coeff2;
logic [15:0]		tb_coeff3;
logic [15:0]		tb_coeff4;
integer tb_test_sample_num;
integer tb_std_test_case;
testVector tb_test_vectors[];

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
// Bus Model Instance
//*****************************************************************************
ahb_lite_bus BFM (.clk(tb_clk),
                  // Testing setup signals
                  .enqueue_transaction(tb_enqueue_transaction),
                  .transaction_write(tb_transaction_write),
                  .transaction_fake(tb_transaction_fake),
                  .transaction_addr(tb_transaction_addr),
                  .transaction_data(tb_transaction_data),
                  .transaction_error(tb_transaction_error),
                  .transaction_size(tb_transaction_size),
                  // Testing controls
                  .model_reset(tb_model_reset),
                  .enable_transactions(tb_enable_transactions),
                  .current_transaction_num(tb_current_transaction_num),
                  .current_transaction_error(tb_current_transaction_error),
                  // AHB-Lite-Slave Side
                  .hsel(tb_hsel),
                  .htrans(tb_htrans),
                  .haddr(tb_haddr),
                  .hsize(tb_hsize),
                  .hwrite(tb_hwrite),
                  .hwdata(tb_hwdata),
                  .hrdata(tb_hrdata),
                  .hresp(tb_hresp));


//*****************************************************************************
// DUT Instance
//*****************************************************************************
ahb_lite_fir_filter DUT ( .clk(tb_clk), 
		.n_rst(tb_n_rst),
		.hsel(tb_hsel),
		.haddr(tb_haddr),
		.hsize(tb_hsize[0]),
		.htrans(tb_htrans),
		.hwrite(tb_hwrite),
		.hwdata(tb_hwdata),
		.hrdata(tb_hrdata),
		.hresp(tb_hresp));

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

// Task to configure coefficients
task configure_coeff;
begin
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START), tb_coeff1, 1'b0, 1'b1);
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + 2), tb_coeff2, 1'b0, 1'b1);
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + 4), tb_coeff3, 1'b0, 1'b1);
  enqueue_transaction(1'b1, 1'b1, (ADDR_COEF_START + 6), tb_coeff4, 1'b0, 1'b1);
  execute_transactions(4);

  #(0.1);
end
endtask

// Task for sending/handling a sample
task test_sample;
	input [DATA_MAX_BIT:0] sample_value;
	input [DATA_MAX_BIT:0] expected_result;
	input expected_err;
begin		
	enqueue_transaction(1'b1, 1'b1, ADDR_SAMPLE, sample_value, expected_err, 1'b1);
	execute_transactions(1);
	
	@(CLK_PERIOD * 40)
	#(0.1)
	enqueue_transaction(1'b1, 1'b0, ADDR_RESULT, expected_result, expected_err, 1'b1);
	execute_transactions(1);
	// Add some padding between samples
	#(CLK_PERIOD);
end
endtask

// Task to test stream
task test_stream;
	input testVector tv;
	integer s;
begin
	// Reset the design
	tb_test_case_num += 1;
	reset_dut();

	// Load Coeffs
	configure_coeff();
  	enqueue_transaction(1'b1, 1'b1, ADDR_COEF_SET, 16'b1, 1'b0, 1'b1);
	execute_transactions(1);
	
	// Send the stream of samples provided
	tb_test_sample_num = 0;
	for(s = 0; s < 4; s++)
	begin
		test_sample(tv.samples[s], tv.results[s], tv.errors[s]);
	end
end
endtask

//*****************************************************************************
// Bus Model Usage Related TB Tasks
//*****************************************************************************
// Task to pulse the reset for the bus model
task reset_model;
begin
  tb_model_reset = 1'b1;
  #(0.1);
  tb_model_reset = 1'b0;
end
endtask

// Task to enqueue a new transaction
task enqueue_transaction;
  input logic for_dut;
  input logic write_mode;
  input logic [ADDR_MAX_BIT:0] address;
  input logic [DATA_MAX_BIT:0] data;
  input logic expected_error;
  input logic size;
begin
  // Make sure enqueue flag is low (will need a 0->1 pulse later)
  tb_enqueue_transaction = 1'b0;
  #0.1ns;

  // Setup info about transaction
  tb_transaction_fake  = ~for_dut;
  tb_transaction_write = write_mode;
  tb_transaction_addr  = address;
  tb_transaction_data  = data;
  tb_transaction_error = expected_error;
  tb_transaction_size  = {2'b00,size};

  // Pulse the enqueue flagsim:/tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/hrdata

  tb_enqueue_transaction = 1'b1;
  #0.1ns;
  tb_enqueue_transaction = 1'b0;
end
endtask

// Task to wait for multiple transactions to happen
task execute_transactions;
  input integer num_transactions;
  integer wait_var;
begin
  // Activate the bus model
  tb_enable_transactions = 1'b1;
  @(posedge tb_clk);

  // Process the transactions (all but last one overlap 1 out of 2 cycles
  for(wait_var = 0; wait_var < num_transactions; wait_var++) begin
    @(posedge tb_clk);
  end
  // Run out the last one (currently in data phase)
  @(posedge tb_clk);

  // Turn off the bus model
  @(negedge tb_clk);
  tb_enable_transactions = 1'b0;
end
endtask

// Task to clear/initialize all FIR-side inputs
task init_fir_side;
begin
  tb_fir_out   = '0;
  tb_modwait   = 1'b0;
  tb_err       = 1'b0;
  tb_coeff_num = 2'd0;
end
endtask

// Task to clear/initialize all FIR-side inputs
task init_expected_outs;
begin
  tb_expected_data_ready    = 1'b0;
  tb_expected_sample        = RESET_SAMPLE;
  tb_expected_new_coeff_set = 1'b0;
  tb_expected_coeff         = RESET_COEFF;
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
  tb_test_data       = '0;
  tb_check_tag       = "N/A";
  tb_check           = 1'b0;
  tb_mismatch        = 1'b0;
  // Initialize all of the directly controled DUT inputs
  tb_n_rst          = 1'b1;
  init_fir_side();
  // Initialize all of the bus model control inputs  tb_coeff1 = 16'b1;
  tb_coeff2 = 16'b10;
  tb_coeff3 = 16'b11;
  tb_coeff4 = 16'b100;
  tb_model_reset          = 1'b0;
  tb_enable_transactions  = 1'b0;  
  tb_enqueue_transaction  = 1'b0;
  tb_transaction_write    = 1'b0;
  tb_transaction_fake     = 1'b0;
  tb_transaction_addr     = '0;
  tb_transaction_data     = '0;
  tb_transaction_error    = 1'b0;
  tb_transaction_size     = 3'd0;

  // Wait some time before starting first test case
  #(0.1);

  // Clear the bus model
  reset_model();
  reset_dut();
  //*****************************************************************************
  // Power-on-Reset Test Case
  //*****************************************************************************
  // Update Navigation Infoest_stream(tb_test_vectors[tb_std_test_case]);
  tb_test_case     = "Power-on-Reset";
  tb_test_case_num = tb_test_case_num + 1;
  tb_test_data = 16'd1000; 
  enqueue_transaction(1'b1, 1'b1, ADDR_SAMPLE, tb_test_data, 1'b0, 1'b1);
  enqueue_transaction(1'b1, 1'b0, ADDR_SAMPLE, tb_test_data, 1'b0, 1'b1);
  execute_transactions(2);

  reset_dut();

  enqueue_transaction(1'b1, 1'b0, ADDR_SAMPLE, 16'b0, 1'b0, 1'b1);
  execute_transactions(1);

  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);
  //*****************************************************************************
  // Configure Coefficients
  //*****************************************************************************
  reset_dut();

  tb_coeff1 = 16'b1;
  tb_coeff2 = 16'b10;
  tb_coeff3 = 16'b11;
  tb_coeff4 = 16'b100;
  configure_coeff();
  enqueue_transaction(1'b1, 1'b0, ADDR_COEF_START, tb_coeff1, 1'b0, 1'b1);
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + 2), tb_coeff2, 1'b0, 1'b1);
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + 4), tb_coeff3, 1'b0, 1'b1);
  enqueue_transaction(1'b1, 1'b0, (ADDR_COEF_START + 6), tb_coeff4, 1'b0, 1'b1);
  execute_transactions(4);

  // Set new_coefficient_set
  enqueue_transaction(1'b1, 1'b1, ADDR_COEF_SET, 16'b1, 1'b0, 1'b1);
  execute_transactions(1);

  // Check if the new_coefficient_set is cleared
  #(CLK_PERIOD * 9);
  enqueue_transaction(1'b1, 1'b0, ADDR_COEF_SET, 16'b0, 1'b0, 1'b0);
  execute_transactions(1);


  //*****************************************************************************
  // Feed Sample Data
  //*****************************************************************************
  reset_dut();
  tb_coeff1 = 16'h4000;
  tb_coeff2 = 16'h8000;
  tb_coeff3 = 16'h8000;
  tb_coeff4 = 16'h4000;

  tb_test_vectors = new[2];
  // Test case 0
  tb_test_vectors[0].samples	= {16'd100, 16'd100, 16'd100, 16'd100};
  tb_test_vectors[0].results	= {16'd0, 16'd50, 16'd50 ,16'd50};
  tb_test_vectors[0].errors		= {1'b0, 1'b0, 1'b0, 1'b0};
  // Test case 1
  tb_test_vectors[1].samples	= {16'd1000, 16'd1000, 16'd100, 16'd100};
  tb_test_vectors[1].results	= {16'd450, 16'd500, 16'd50 ,16'd50};
  tb_test_vectors[1].errors		= {1'b0, 1'b0, 1'b0, 1'b0};

  for(tb_std_test_case = 0; tb_std_test_case < tb_test_vectors.size(); tb_std_test_case++)
		begin
			test_stream(tb_test_vectors[tb_std_test_case]);
		end


end
endmodule