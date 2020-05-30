// 337 TA Provided Lab 2 Testbench
// This code serves as a starter test bench for the 16 bit adder design 

`timescale 1ns / 100ps

module tb_adder_16bit
();

// Define local parameters used by the test bench
localparam NUM_INPUT_BITS  = 16;
localparam MAX_INPUT_BIT   = NUM_INPUT_BITS - 1;
localparam NUM_OUTPUT_BITS = NUM_INPUT_BITS + 1;
localparam MAX_OUTPUT_BIT  = NUM_OUTPUT_BITS - 1;
localparam NUM_SUM_BITS    = NUM_INPUT_BITS;
localparam MAX_SUM_BIT     = NUM_SUM_BITS - 1;
localparam OVERFLOW_BIT    = MAX_SUM_BIT + 1;
localparam TEST_DELAY      = 10;

// Declare custom test vector type
typedef struct{
  string                  test_name;
  logic [MAX_INPUT_BIT:0] test_a;
  logic [MAX_INPUT_BIT:0] test_b;
  logic                   test_cin;
} testVector;

// Declare test bench 'navigation' signals
integer tb_test_case_num;
string  tb_test_case;
string  tb_test_case_stage;
logic   tb_test_case_err;

// Declare test bench expected value signals
logic [OVERFLOW_BIT:0] tb_expected_outs;
logic [MAX_SUM_BIT:0]  tb_expected_sum;
logic                  tb_expected_overflow;

// Declare the unpacked/dynamically sized test-vector array
testVector tb_test_cases [];

// Declare Design Under Test (DUT) portmap signals
logic [MAX_INPUT_BIT:0] tb_a;
logic [MAX_INPUT_BIT:0] tb_b;
logic tb_carry_in;
logic [MAX_SUM_BIT:0] tb_sum;
logic tb_overflow;

// DUT Portmap
adder_16bit DUT (.a(tb_a), .b(tb_b), .carry_in(tb_carry_in), .sum(tb_sum), .overflow(tb_overflow));


// Initial block to cleanly define the contents of the test-vector array
initial begin
  // Create the test-vector array with enough slots for test cases
  // STUDENT TODO: Update the array declaration to have enough slots
  tb_test_cases = new[9];

  // First Test Case/Test-Vector
  tb_test_cases[0].test_name = "Zeros Check";
  tb_test_cases[0].test_a    = '0;
  tb_test_cases[0].test_b    = '0;
  tb_test_cases[0].test_cin  = 1'b0;

  // STUDENT TODO: Add your additional test cases here after increasing the array size

  tb_test_cases[1].test_name = "A large B small";
  tb_test_cases[1].test_a    = 16'b1111111111111111;
  tb_test_cases[1].test_b    = '0;
  tb_test_cases[1].test_cin  = 1'b0;

  tb_test_cases[2].test_name = "0";
  tb_test_cases[2].test_a    = '0;
  tb_test_cases[2].test_b    = '0;
  tb_test_cases[2].test_cin  = 1'b0;

  tb_test_cases[3].test_name = "A large B large";
  tb_test_cases[3].test_a    = 16'b1111111111111111;
  tb_test_cases[3].test_b    = 16'b1111111111111111;
  tb_test_cases[3].test_cin  = 1'b0;

  tb_test_cases[4].test_name = "0";
  tb_test_cases[4].test_a    = '0;
  tb_test_cases[4].test_b    = '0;
  tb_test_cases[4].test_cin  = 1'b0;

  tb_test_cases[5].test_name = "A small B large";
  tb_test_cases[5].test_a    = '0;
  tb_test_cases[5].test_b    = 16'b1111111111111111;
  tb_test_cases[5].test_cin  = 1'b0;

  tb_test_cases[6].test_name = "0";
  tb_test_cases[6].test_a    = '0;
  tb_test_cases[6].test_b    = '0;
  tb_test_cases[6].test_cin  = 1'b0;

  tb_test_cases[7].test_name = "A small B small";
  tb_test_cases[7].test_a    = '0;
  tb_test_cases[7].test_b    = '0;
  tb_test_cases[7].test_cin  = 1'b1;

  tb_test_cases[8].test_name = "A small B small";
  tb_test_cases[8].test_a    = '0;
  tb_test_cases[8].test_b    = '0;
  tb_test_cases[8].test_cin  = 1'b0;
end

// Handle expected results bit-slice mappings
assign tb_expected_sum      = tb_expected_outs[MAX_SUM_BIT:0];
assign tb_expected_overflow = tb_expected_outs[OVERFLOW_BIT];

// Initial block for actually test bench runtime code
initial begin
  // Initial values for all DUT inputs and test bench signals
  tb_test_case_num     = -1;
  tb_test_case         = "Start of Time";
  tb_test_case_stage   = "Boot-Strapping";
  tb_a                 = 0;
  tb_b                 = 0;
  tb_carry_in          = 1'b0;
  tb_expected_outs     = 0;
  tb_test_case_err     = 0;
  
  // Wait some time before starting the test cases (avoid T=0 glitches)
  #(1ns);

  // Execute each of the test-vectors
  for(tb_test_case_num = 0; tb_test_case_num < tb_test_cases.size(); tb_test_case_num ++) begin
    // Update the 'navigation' signals for this test case
    tb_test_case     = tb_test_cases[tb_test_case_num].test_name;
    tb_test_case_err = 1'b0;
    
    // Apply the test vector's DUT input values
    tb_test_case_stage = "Applying Inputs";
    tb_a        = tb_test_cases[tb_test_case_num].test_a;
    tb_b        = tb_test_cases[tb_test_case_num].test_b;
    tb_carry_in = tb_test_cases[tb_test_case_num].test_cin;

    // Calculate the expected outputs
    tb_expected_outs = tb_a + tb_b + tb_carry_in;

    // Wait for DUT to process the inputs
    #(TEST_DELAY - 1);
    
    // Check the DUT's Sum output value
    tb_test_case_stage = "Check DUT Outputs for Correcness";
    if(tb_expected_sum == tb_sum) begin
      $info("Correct Sum value for test case %d!", tb_test_case);
    end
    else begin
      tb_test_case_err = 1'b1;
      $error("Incorrect Sum value for test case %d!", tb_test_case);
    end

    // Check the DUT's Overflow output value
    if(tb_expected_overflow == tb_overflow) begin
      $info("Correct Overflow value for test case %d!", tb_test_case);
    end
    else begin
      tb_test_case_err = 1'b1;
      $error("Incorrect Overflow value for test case %d!", tb_test_case);
    end
    
    // Add some padding delay after the checks before moving on to next testcase
    #(1);
  end
end

// Wrap-up process
final begin
  if(tb_test_cases.size() != tb_test_case_num) begin
    // Didn't run the test bench through all test cases
    $display("This test bench was not run long enough to execute all test cases. Please run this test bench for at least a total of %d ns", (tb_test_cases.size() * TEST_DELAY));
  end
  else begin
    // Test bench was run to completion
    $display("This test bench has run to completion");
  end
end

endmodule
