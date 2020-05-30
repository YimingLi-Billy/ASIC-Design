// $Id: $
// File name:   fir_filter.sv
// Created:     9/23/2015
// Author:      foo
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: Course Staff Provided Starter Test bench

`timescale 1ns/10ps

module tb_fir_filter();

	// Define local constants
	localparam NUM_VAL_BITS	= 16;
	localparam MAX_VAL_BIT	= NUM_VAL_BITS - 1;
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD		= 10ns;
	
	// Test coefficient constants
	localparam COEFF1 		= 16'h8000; // 1.0
	localparam COEFF_5 		= 16'h4000; // 0.5
	localparam COEFF_25 	= 16'h2000; // 0.25
	localparam COEFF_125 	= 16'h1000; // 0.125
	localparam COEFF0  		= 16'h0000; // 0.0
	
	// Define our custom test vector type
	typedef struct
	{
		reg [MAX_VAL_BIT:0] coeffs[3:0];
		reg [MAX_VAL_BIT:0] samples[3:0];
		reg [MAX_VAL_BIT:0] results[3:0];
		reg errors[3:0];
	} testVector;
	
	// Test bench dut port signals
	reg tb_clk;
	reg tb_n_reset;
	reg tb_data_ready;
	reg tb_load_coeff;
	reg [MAX_VAL_BIT:0] tb_sample;
	reg [MAX_VAL_BIT:0] tb_coeff;
	wire tb_one_k_samples;
	wire tb_modwait;
	wire tb_err;
	wire [MAX_VAL_BIT:0] tb_fir_out;
	
	// Test bench verification signals
	integer tb_test_case_num;
	integer tb_test_sample_num;
	integer tb_std_test_case;
	reg [MAX_VAL_BIT:0] tb_expected_fir_out;
	reg tb_expected_err;
	reg tb_expected_one_k_samples;
	testVector tb_test_vectors[];
	
	task reset_dut;
	begin
		// Activate the design's reset (does not need to be synchronize with clock)
		tb_n_reset = 1'b0;
		
		// Wait for a couple clock cycles
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		// Release the reset
		@(negedge tb_clk);
		tb_n_reset = 1;
		
		// Wait for a while before activating the design
		@(posedge tb_clk);
		@(posedge tb_clk);
	end
	endtask
	
	// Clock gen block
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end
	
	// DUT portmap
	fir_filter DUT(
									.clk(tb_clk),
									.n_reset(tb_n_reset),
									.sample_data(tb_sample),
									.fir_coefficient(tb_coeff),
									.data_ready(tb_data_ready),
									.load_coeff(tb_load_coeff),
									.one_k_samples(tb_one_k_samples),
									.modwait(tb_modwait),
									.fir_out(tb_fir_out),
									.err(tb_err)
								);
	
	// Task for sending a signle coefficient
	task send_coeff;
		input [MAX_VAL_BIT:0] coeff;
	begin
		// Synchronize to a negative clock edge to avoid metastability
		@(negedge tb_clk);
		
		// Start sending
		tb_coeff = coeff;
		tb_load_coeff = 1'b1;
		
		// Handle the handshake timing with a timeout 'thread'
		fork : SCF
		begin
			// Have to just pulse the lc due to it going through a synchronizer
			#(CLK_PERIOD * 1.25);
			tb_load_coeff = 0;
			// Wait for modwait to deassert -> signals done with current coeff
			@(negedge tb_modwait);
			disable SCF;
		end
		begin
			// Set a timeout incase design's modwait doesn't work
			// Should only ever take a couple clock cycles given the synchronizer
			#(10 * CLK_PERIOD);
			$error("Module took too long to load coefficient");
			disable SCF;
		end
		// Wait for 'threads' to finish
		join
	end
  endtask
	
	// Task for loading a set of coefficients
	task load_coeff;
		input [MAX_VAL_BIT:0] coeffs [3:0];
	begin
		send_coeff(coeffs[0]);
		send_coeff(coeffs[1]);
		send_coeff(coeffs[2]);
		send_coeff(coeffs[3]);
	end
	endtask
	
	// Task for sending/handling a sample
	task test_sample;
		// Test inputs
		input [MAX_VAL_BIT:0] sample_value;
		
		// Expected outputs
		input [MAX_VAL_BIT:0] expected_fir_out;
		input expected_err;
		input expected_one_k_samples;
	begin
		// Synchronize to a negative clock edge to avoid metastability
		@(negedge tb_clk);
		
		// Start sending the new sample value
		tb_test_sample_num += 1;
		tb_sample = sample_value;
		tb_data_ready = 1'b1;
		
		// Updated verification signals
		tb_expected_fir_out = expected_fir_out;
		tb_expected_err			= expected_err;
		tb_expected_one_k_samples = expected_one_k_samples;
		
		// Handle the handshake timing with a timeout 'thread'
		fork : DL
		begin
			// Wait for the modwait to assert -> signals sample is being loaded
			@(posedge tb_modwait);
			tb_data_ready = 0;
			// Wait for modwait to deassert -> signals done with current sample
			@(negedge tb_modwait);
			disable DL;
		end
		begin
			// Set a timeout incase design's modwait doesn't work
			#(25 * CLK_PERIOD);
			$error("Module took too long to process the sample");
			disable DL;
		end
		// Wait for 'threads' to finish
		join
		
		// Check the outputs
		@(posedge tb_clk); // Wait for a clock cycle to let things propagate (since we don't require the delay of modwait deassertion to take care of it)
		// Handle the fir_out
		if(expected_fir_out == tb_fir_out)
		begin
			$info("Test Case #%0d Sample #%0d: Had a correct fir_out value", tb_test_case_num, tb_test_sample_num);
		end
		else
		begin
			$error("Test Case #%0d Sample #%0d: Had an incorrect fir_out value", tb_test_case_num, tb_test_sample_num);
		end
		
		// Handle the error
		if(expected_err == tb_err)
		begin
			$info("Test Case #%0d Sample #%0d: Had a correct err value", tb_test_case_num, tb_test_sample_num);
		end
		else
		begin
			$error("Test Case #%0d Sample #%0d: Had an incorrect err value", tb_test_case_num, tb_test_sample_num);
		end
		
		// Handle the one_k_samples
		if(expected_one_k_samples == tb_one_k_samples)
		begin
			$info("Test Case #%0d Sample #%0d: Had a correct one_k_samples value", tb_test_case_num, tb_test_sample_num);
		end
		else
		begin
			$error("Test Case #%0d Sample #%0d: Had an incorrect one_k_samples value", tb_test_case_num, tb_test_sample_num);
		end
		
		// Add some padding between samples
		#(CLK_PERIOD);
	end
	endtask
	
	
	// Task for a test case
	task test_stream;
		input testVector tv;
	
		//input [MAX_VAL_BIT:0] coeffs [3:0];
		//input [MAX_VAL_BIT:0] samples [3:0];
		
		//input [MAX_VAL_BIT:0] expected_outs [3:0];
		//input expected_errs [3:0];
		
		integer s;
	begin
		// Reset the design
		tb_test_case_num += 1;
		reset_dut;
		
		// Load the set of coefficients
		load_coeff(tv.coeffs);
		
		// Send the stream of samples provided
		tb_test_sample_num = 0;
		for(s = 0; s < 4; s++)
		begin
			test_sample(tv.samples[s], tv.results[s], tv.errors[s], 1'b0);
		end
	end
	endtask
	
	// Standard test vector population (Done separately for cleaner viewing)
	initial
	begin // TODO: Add more standard test cases here
		// Populate the test vector array to use
		tb_test_vectors = new[2];
		// Test case 0
		tb_test_vectors[0].coeffs		= {{COEFF_5}, {COEFF1}, {COEFF1}, {COEFF_5}};
		tb_test_vectors[0].samples	= {16'd100, 16'd100, 16'd100, 16'd100};
		tb_test_vectors[0].results	= {16'd0, 16'd50, 16'd50 ,16'd50};
		tb_test_vectors[0].errors		= {1'b0, 1'b0, 1'b0, 1'b0};
		// Test case 1
		tb_test_vectors[1].coeffs		= tb_test_vectors[0].coeffs;
		tb_test_vectors[1].samples	= {16'd1000, 16'd1000, 16'd100, 16'd100};
		tb_test_vectors[1].results	= {16'd450, 16'd500, 16'd50 ,16'd50};
		tb_test_vectors[1].errors		= {1'b0, 1'b0, 1'b0, 1'b0};
	end
	
	// Test bench process
	initial
	begin
		// Initial values
		tb_test_case_num = 0;
		tb_n_reset = 1'b1;
		tb_data_ready = 1'b0;
		tb_load_coeff = 1'b0;
		tb_sample = 16'd0;
		tb_coeff = COEFF0;
		
		// Wait for some time before starting test cases
		#(1ns);
		
		// Power on reset (just inspect on waves)
		reset_dut;
		
		// Standard 4 sample test cases
		for(tb_std_test_case = 0; tb_std_test_case < tb_test_vectors.size(); tb_std_test_case++)
		begin
			test_stream(tb_test_vectors[tb_std_test_case]);
		end
		
		// TODO: Add non standard test cases here
		
	end
endmodule
