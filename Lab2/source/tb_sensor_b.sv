// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the sensor_b design 

`timescale 1ns / 100ps

module tb_sensor_b
();

	wire [3:0] test_input;
	wire test_output;

	localparam NUM_TEST_CASES = 16;
	localparam MAX_TEST_VAL		= (NUM_TEST_CASES - 1);
	
	reg [4:0] test_number;
	reg [3:0] tmp_input;
	reg expected_output;

	sensor_b DUT(.sensors(test_input), .error(test_output));
	
	assign test_input = tmp_input;
	
	initial
	begin
		for(test_number = 0; test_number < NUM_TEST_CASES; test_number = test_number + 1)
		begin
			// Send test input to design
			tmp_input = test_number[3:0];
			
			// Calculate the expected result
			expected_output = 1'b0;
			
			if(tmp_input[0] == 1'b1)
			begin
				expected_output = 1'b1;
			end
			else if ((tmp_input[1] == 1'b1) && ((tmp_input[2] == 1'b1) || (tmp_input[3] == 1'b1)))
			begin
				expected_output = 1'b1;
			end
			
			// wait to allow design to process input
			#9; 
			
			// Check expected with actual output from design
			if(test_output == expected_output) // Test case passed
				$info("Test case %d Passed!", test_number);
			else // Test case failed
				$error("Test case %d Failed!", test_number);
			#1;
		end
	end
endmodule
