`timescale 1ns / 100ps

module tb_flex_counter
();

// Define local parameters used by the test bench
localparam NUM_INPUT_BITS = 5;
localparam NUM_CNT_BITS = NUM_INPUT_BITS - 1;

localparam CLK_PERIOD = 2.5;
localparam  FF_SETUP_TIME = 0.190;
localparam  FF_HOLD_TIME  = 0.100;
localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts
localparam  INACTIVE_VALUE     = 1'b1;

localparam  RESET_OUTPUT_VALUE = 1'b0;
//localparam MAX_INPUT_BIT   = NUM_INPUT_BITS - 1;
//localparam NUM_OUTPUT_BITS = NUM_INPUT_BITS + 1;
//localparam MAX_OUTPUT_BIT  = NUM_OUTPUT_BITS - 1;
//localparam NUM_SUM_BITS    = NUM_INPUT_BITS;
//localparam MAX_SUM_BIT     = NUM_SUM_BITS - 1;
//localparam OVERFLOW_BIT    = MAX_SUM_BIT + 1;
localparam TEST_DELAY      = 10;

// Declare Design Under Test (DUT) portmap signals
logic [NUM_CNT_BITS:0] tb_rollover_val;
reg [NUM_CNT_BITS:0] tb_count_out;
reg tb_rollover_flag;
reg tb_clk;
reg tb_n_rst;
logic tb_clear;
logic tb_count_enable;

// Declare test bench 'navigation' signals
integer tb_test_num;
string  tb_test_case;
integer  tb_stream_test_num;
logic   tb_stream_check_tag;
integer i;
integer j;
integer ct;
integer flag;

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
  task check_output;
    input logic  expected_flag;
    input logic  [NUM_CNT_BITS:0]expected_count;
    input string check_tag;
  begin
    if(expected_count == tb_count_out) begin // Check passed
      $info("Correct count_out output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect count_out output %s during %s test case %d / %d", check_tag, tb_test_case, expected_count,tb_count_out);
    end

    if(expected_flag == tb_rollover_flag) begin // Check passed
      $info("Correct rollover_flag output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect rollover output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

// Task to cleanly and consistently check for correct values during MetaStability Test Cases
  task check_clear;
    input string check_tag;
  begin
    #(CLK_PERIOD)
    if(tb_count_out == 0) begin // Check passed
      $info("Correct count_out output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect count_out output %s during %s test case", check_tag, tb_test_case);
    end

    if((tb_rollover_flag == 1'b0)) begin // Check passed
      $info("Correct rollover_flag output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect rollover_flag output %s during %s test case", check_tag, tb_test_case);
    end

  end
  endtask


// Test Bench Clock Generation
always begin: CLK_GEN
	tb_clk = 1'b0;
	#(CLK_PERIOD/2.0);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2.0);
end

// DUT Portmap
flex_counter DUT (.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), 
			.count_enable(tb_count_enable), .rollover_val(tb_rollover_val), 
			.count_out(tb_count_out), .rollover_flag(tb_rollover_flag));

// Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;              // Initialize to be inactive
    tb_clear = 1'b0;
    tb_count_enable = 0;
    tb_rollover_val = 10;
    tb_test_num = 0;               // Initialize test case counter
    tb_stream_test_num = 0;
    tb_test_case = "Test bench initializaton";
    tb_stream_check_tag = "N/A";
    // Wait some time before starting first test case
    #(0.1);
    

    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    //tb_async_in  = INACTIVE_VALUE; // Set to be the the non-reset value
    //tb_rollover_flag = 1;
    //tb_count_out = 8;
    tb_rollover_val = 10;
    tb_n_rst  = 1'b0;    // Activate reset
    
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    check_output( RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE, 
                  "after reset applied");
    
    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output( RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE, 
                  "after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    #(2 * FF_HOLD_TIME);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    #0.1;
    // Check that internal state was correctly keep after reset release
    check_output( RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE, 
                  "after reset was released");


    // ************************************************************************    
    // Test Case 2:  Rollover for a rollover value that is not a power of two
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_count_enable = 0;
    tb_test_case = "Rollover for a rollover value that is not a power of two";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_n_rst  = 1'b1;              // Initialize to be inactive
    tb_clear = 1'b0;
    tb_rollover_val = 10;
    reset_dut();
    
    // Stimulate test
    tb_count_enable = 1;
    // Allow value to feed in to design
    @(posedge tb_clk);
    #(FF_HOLD_TIME);
    
    check_output(0,1,"after one clock edge");

    #(CLK_PERIOD * tb_rollover_val);
    #(0.1)
    check_output(1, tb_rollover_val, "after rollover_val clock edges");

    #(CLK_PERIOD);
    check_output(0, 1, "after rollover");


    // Move away from risign edge and allow for propagation delays before checking


    // ************************************************************************
    // Test Case 3: Continuous Counting
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Continuous Counting";
    tb_count_enable = 0;
    // Start out with inactive value and reset the DUT to isolate from prior tests
    reset_dut();
    tb_n_rst  = 1'b1;              // Initialize to be inactive
    tb_clear = 1'b0;
    tb_count_enable = 0;
    tb_rollover_val = 10;

    // Assign test case stimulus
    tb_count_enable = 1'b1;
    @(posedge tb_clk);
    #(0.1);
    for(i = 0; i < (tb_rollover_val * 10); i++) begin
	#(0.1);
	check_output(((i % tb_rollover_val + 1) / tb_rollover_val), (i % tb_rollover_val + 1), "after continuously count enabled");
	@(posedge tb_clk);
	
    end

    
    // ************************************************************************
    // Test Case 4: Discontinuous Counting
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Discontinuous Counting";
    tb_count_enable = 0;
    // Start out with inactive value and reset the DUT to isolate from prior tests
    reset_dut();
    tb_n_rst  = 1'b1;              // Initialize to be inactive
    tb_clear = 1'b0;
    tb_rollover_val = 10;
    ct = 1;
    flag = 0;

    // Assign test case stimulus
    tb_count_enable = 1'b1;
    @(posedge tb_clk);
    #(0.1);
    for(j = 0; j < (tb_rollover_val * 10); j++) begin
	if((j % tb_rollover_val + 1) % 2 == 0)
		tb_count_enable = 0;
	else begin
		tb_count_enable = 1;
	end
	
	ct = ct + (j % tb_rollover_val) % 2;
	if (ct > tb_rollover_val)
		ct = 1;
	if (ct == tb_rollover_val)
		flag = 1;
	else 
		flag = 0;
	
	check_output(flag, ct, "after discontinuously count enabled");
	@(posedge tb_clk);
	#(0.1);
    end

    
    

    // ************************************************************************
    // Test Case 5: Clearing while counting to check clear vs. count enable priority
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Hold Violation with Input as a '1'";
    tb_count_enable = 0;
    // Start out with inactive value and reset the DUT to isolate from prior tests
    reset_dut();
    tb_n_rst  = 1'b1;              // Initialize to be inactive
    tb_clear = 1'b0;
    tb_rollover_val = 10;

    // Allow value to feed in to design
    @(posedge tb_clk);
    // Wait until test is inside the hold time after the current rising clock edge
    #(FF_HOLD_TIME * 0.5);
    // Change the input value 
    tb_count_enable = 1;
    @(posedge tb_clk);
    #(CLK_PERIOD * 5);
    tb_clear = 1;
    @(posedge tb_clk);
    #(0.1)
    check_clear("after first clear");
    #(CLK_PERIOD * 5);
    check_clear("longer after first clear");
    

    // Wait for DUT to process the stimulus
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    // Move away from risign edge and allow for propagation delays before checking
    
    
    // STUDENT: Add your additional test cases here


  end

endmodule