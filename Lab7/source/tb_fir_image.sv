// $Id: $
// File name:   fir_filter.sv
// Created:     9/23/2015
// Author:      foo
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: Course Staff Provided Image Processing Test bench

`timescale 1ns / 100ps

module tb_fir_image();
	
	parameter		INPUT_FILENAME		= "./docs/test_1.bmp";
	parameter		RESULT1_FILENAME		= "./docs/filtered_1.bmp";
	parameter		RESULT2_FILENAME		= "./docs/filtered_2.bmp";
	parameter		RESULT3_FILENAME		= "./docs/filtered_3.bmp";
	
	// Define file io offset constants
	localparam SEEK_START	= 0;
	localparam SEEK_CUR		= 1;
	localparam SEEK_END		= 2;
	
	// Bitmap file based parameters
	localparam BMP_HEADER_SIZE_BYTES	= 14;	// The length of the BMP file header field in Bytes
	localparam PIXEL_ARR_PTR_ADDR			= BMP_HEADER_SIZE_BYTES - 4;
	localparam DIB_HEADER_C1_SIZE			= 40; // The length of the expected BITMAPINFOHEADER DIB header
	localparam DIB_HEADER_C2_SIZE			= 12; // The length of the expected BITMAPCOREHEADER DIB header
	localparam NO_COMPRESSION 				= 0;	// The compression mode value should be 0 if no compression is used (normal case)

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
	
	// Test bench dut port signals
	reg tb_clk;
	reg tb_n_reset;
	reg tb_data_ready;
	reg tb_load_coeff;
	reg [MAX_VAL_BIT:0] tb_sample_r;
	reg [MAX_VAL_BIT:0] tb_sample_g;
	reg [MAX_VAL_BIT:0] tb_sample_b;
	reg [MAX_VAL_BIT:0] tb_coeff;
	wire tb_one_k_samples_r;
	wire tb_one_k_samples_g;
	wire tb_one_k_samples_b;
	wire tb_modwait_r;
	wire tb_modwait_g;
	wire tb_modwait_b;
	wire tb_err_r;
	wire tb_err_g;
	wire tb_err_b;
	wire [MAX_VAL_BIT:0] tb_fir_out_r;
	wire [MAX_VAL_BIT:0] tb_fir_out_g;
	wire [MAX_VAL_BIT:0] tb_fir_out_b;
	
	// Declare Image Processing Test Bench Variables
	integer r;										// Loop variable for working with rows of pixels
	integer c;										// Loop variable for working with pixels in a row
	reg [7:0] tmp_byte;						// temp variable for read/writing bytes from/to files
	integer in_file;							// Input file handle
	integer res_file;							// Result file handle
	string  curr_res_filename;
	integer num_rows;							// The number of rows of pixels in the image file
	integer num_cols;						// The number of pixels pwer row in the image file
	integer num_pad_bytes;				// The number of padding bytes at the end of each row
	reg [2:0][7:0] in_pixel_val;	// The raw bytes read from the input file
	reg [2:0][7:0] res_pixel_val;	// The averaged values for the result file
	integer i;										// Loop variable for misc. for loops
	integer quiet_catch; // Just used to remove warnings about not capturing the value of the file function returns
	
	// The bitmap file header is 14 Bytes
	reg [(BMP_HEADER_SIZE_BYTES - 1):0][7:0] in_bmp_file_header;
	reg [(BMP_HEADER_SIZE_BYTES - 1):0][7:0] res_bmp_file_header;
	reg [31:0] in_image_data_ptr;		// The starting byte address of the pixel array in the input file
	reg [31:0] res_image_data_ptr;	// The starting byte address of the pixel array in the result file
	// The normal/supported DIB header is 40 Bytes
	reg [(DIB_HEADER_C1_SIZE - 1):0][7:0] dib_header;
	reg [31:0] dib_header_size;	// The dib header size is a 32-bit unsigned integer
	reg [31:0] image_width;			// The image width (pixels) is a 32-bit signed integer
	reg [31:0] image_height;		// The image height (pixels) is a 32-bit signed integer
	reg [15:0] num_pixel_bits;	// The number of pixels per bit (1, 4, 8, 16, 24, 32) is an unsigned integer
	reg [31:0] compression_mode;// The type of compression used (this test bench doesn't support compression)
	// Pixel array stuff
	integer row_size_bytes;	// Used to store the calculated row size for the pixel array
	
	// 2-D Filter approach buffers
	reg [2:0][7:0] tb_input_image [][];
	reg [2:0][7:0] tb_row_pass_output [][];
	reg [2:0][7:0] tb_col_pass_output [][];
	reg [2:0][7:0] tb_merged_output [][];
	reg [8:0] tb_temp_merge_sum;
	
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
	fir_filter RF(
									.clk(tb_clk),
									.n_reset(tb_n_reset),
									.sample_data(tb_sample_r),
									.fir_coefficient(tb_coeff),
									.data_ready(tb_data_ready),
									.load_coeff(tb_load_coeff),
									.one_k_samples(tb_one_k_samples_r),
									.modwait(tb_modwait_r),
									.fir_out(tb_fir_out_r),
									.err(tb_err_r)
								);
	fir_filter GF(
									.clk(tb_clk),
									.n_reset(tb_n_reset),
									.sample_data(tb_sample_g),
									.fir_coefficient(tb_coeff),
									.data_ready(tb_data_ready),
									.load_coeff(tb_load_coeff),
									.one_k_samples(tb_one_k_samples_g),
									.modwait(tb_modwait_g),
									.fir_out(tb_fir_out_g),
									.err(tb_err_g)
								);
	fir_filter BF(
									.clk(tb_clk),
									.n_reset(tb_n_reset),
									.sample_data(tb_sample_b),
									.fir_coefficient(tb_coeff),
									.data_ready(tb_data_ready),
									.load_coeff(tb_load_coeff),
									.one_k_samples(tb_one_k_samples_b),
									.modwait(tb_modwait_b),
									.fir_out(tb_fir_out_b),
									.err(tb_err_b)
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
			@(negedge tb_modwait_r); // All modwaits should be identical just use the red one
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
	task load_filter;
		input [MAX_VAL_BIT:0] coeffs [3:0];
	begin
		send_coeff(coeffs[0]);
		send_coeff(coeffs[1]);
		send_coeff(coeffs[2]);
		send_coeff(coeffs[3]);
	end
	endtask
	
	// Task for sending/handling a pixel
	task send_pixel;
		// Test inputs
		input [2:0][7:0] pixel;
	begin
		// Synchronize to a negative clock edge to avoid metastability
		@(negedge tb_clk);
		
		// Start sending the new sample value
		tb_sample_r = {'0, pixel[2]};
		tb_sample_g = {'0, pixel[1]};
		tb_sample_b = {'0, pixel[0]};
		tb_data_ready = 1'b1;
		
		// Handle the handshake timing with a timeout 'thread'
		fork : DL
		begin
			// Wait for the modwait to assert -> signals sample is being loaded
			@(posedge tb_modwait_r);
			tb_data_ready = 0;
			// Wait for modwait to deassert -> signals done with current sample
			@(negedge tb_modwait_r); // All modwaits should be identical just use the red one
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
	end
	endtask
	
	// Task for extracting the input file's header info
	task read_input_header;
	begin
		// Open the input file
		in_file = $fopen(INPUT_FILENAME, "rb");
		// Read in the Bitmap file header information (data is stored in little-endian (LSB first) format)
		for(i = 0; i < BMP_HEADER_SIZE_BYTES; i = i + 1) // Read the data in LSB format
		begin
			// Read a byte at a time
			quiet_catch = $fscanf(in_file,"%c" , in_bmp_file_header[i]);
		end
		// Extract the pixel array pointer (contains the file byte offset of the first byte of the pixel array)
		in_image_data_ptr[31:0] = in_bmp_file_header[(BMP_HEADER_SIZE_BYTES - 1):PIXEL_ARR_PTR_ADDR]; // The pixel array pointer is a 4 byte unsigned integer at the end of the header
		// Read in the DIB header information (LSB format)
		quiet_catch = $fscanf(in_file,"%c" , dib_header[0]);
		quiet_catch = $fscanf(in_file,"%c" , dib_header[1]);
		quiet_catch = $fscanf(in_file,"%c" , dib_header[2]);
		quiet_catch = $fscanf(in_file,"%c" , dib_header[3]);
		dib_header_size = dib_header[3:0];
		if(DIB_HEADER_C1_SIZE == dib_header_size)
		begin
			$display("Input bitmap file uses the BITMAPINFOHEADER type of DIB header");
			for(i = 4; i < dib_header_size; i = i + 1) // Read data in LSB format
			begin
				// Read a byte at a time
				quiet_catch = $fscanf(in_file,"%c" , dib_header[i]);
			end
			
			// Exract useful values from the header
			image_width				= dib_header[7:4];		// image width is bytes 4-7
			image_height			= dib_header[11:8];		// image height is bytes 8-11
			num_pixel_bits		= dib_header[15:14];	// number of bits per pixel is bytes 14 & 15
			compression_mode	= dib_header[19:16];	// compression mode is bytes 16-19
			
			if(16'd24 != num_pixel_bits)
				$fatal("This input file is using a pixel size (%0d)that is not supported, only 24bpp is supported", num_pixel_bits);
			
			if(NO_COMPRESSION != compression_mode)
				$fatal("This input file is using compression, this is not supported by this test bench");
			
		end
		else if(DIB_HEADER_C2_SIZE == dib_header_size)
		begin
			$display("Input bitmap file uses the BITMAPCOREHEADER  type of DIB header");
			for(i = 4; i < dib_header_size; i = i + 1) // Read data in LSB format
			begin
				// Read a byte at a time
				quiet_catch = $fscanf(in_file,"%c" , dib_header[i]);
			end
			
			// Exract useful values from the header
			image_width			= {16'd0,dib_header[5:4]};	// image width is bytes 4 & 5
			image_height		= {16'd0,dib_header[7:6]};	// image height is bytes 6 & 7
			num_pixel_bits	= dib_header[11:10];				// number of bits per pixel is bytes 10 & 11
			
			if(16'd24 != num_pixel_bits)
				$fatal("This input file is using a pixel size (%0d)that is not supported, only 24bpp is supported", num_pixel_bits);
		end
		else
		begin
			$fatal("Unsupported DIB header size of %0d found in input file", dib_header_size);
		end
		
		// Shouldn't need a color palette -> skip it
		res_image_data_ptr = BMP_HEADER_SIZE_BYTES + dib_header_size;
		
		// Should be at the start of the image data (there shoudln't be a color palette)
		// Skip padding if needed
		if($ftell(in_file) != in_image_data_ptr)
			quiet_catch = $fseek(in_file, in_image_data_ptr, SEEK_START);
	end
	endtask
	
	// Task to populate the input image buffer
	task extract_input_image;
	begin
		// Calculate image data row size
		row_size_bytes = (((num_pixel_bits * image_width) + 31) / 32) * 4;
		// Calculate the number of rows in the pixel array
		num_rows = image_height;
		// Calculate the number of pixels per row
		num_cols = image_width;
		// Calculate the number of padding bytes per row
		num_pad_bytes	= row_size_bytes - (num_cols * 3);
		tb_input_image = new[num_rows];
		for(r = 0; r < num_rows; r = r + 1)
		begin
			tb_input_image[r] = new[num_cols];
			for(c = 0; c < num_cols; c = c + 1)
			begin
				// Get the input pixel value from the file (LSB format)
				quiet_catch = $fscanf(in_file, "%c", tb_input_image[r][c][0]);
				quiet_catch = $fscanf(in_file, "%c", tb_input_image[r][c][1]);
				quiet_catch = $fscanf(in_file, "%c", tb_input_image[r][c][2]);
			end
			// Finished a row of pixels
			// Skip past any padding bytes in the input file (get to the next row)
			quiet_catch = $fseek(in_file, num_pad_bytes, SEEK_CUR);
			// Ready to start working on the next row of pixels
		end
		
		// Done with pixel array section of input and row-dimension 1-D pass
		// Done with input file
		$fclose(in_file);
	end
	endtask
	
	// Task for generating the output file's header info to match the input one's
	task generate_output_header;
		input string filename;
	begin
		// Open the result file
		curr_res_filename = filename;
		res_file = $fopen(filename, "wb");
		// Create the bmp file header field (shouldn't change from input file, except for potetinally the image data ptr field)
		res_bmp_file_header = in_bmp_file_header;
		// Correct the image data ptr for discarding the color palette when allowed
		res_bmp_file_header[(BMP_HEADER_SIZE_BYTES - 1):PIXEL_ARR_PTR_ADDR] = res_image_data_ptr;
		// Write the bitmap header field to the result file
		for(i = 0; i < BMP_HEADER_SIZE_BYTES; i = i + 1) // Write data in LSB format
		begin
			// Write a byte at a time
			$fwrite(res_file, "%c", res_bmp_file_header[i]);
		end
		// Create the DIB header for the result file (shouldn't change from input file)
		for(i = 0; i < dib_header_size; i = i + 1) // Write data in LSB format
		begin
			// Write a byte at a time
			$fwrite(res_file, "%c", dib_header[i]);
		end
		
		// Should be at the start of the image data (there shoudln't be a color palette)
		// Skip padding if needed
		if($ftell(res_file) != res_image_data_ptr)
			quiet_catch = $fseek(res_file, res_image_data_ptr, SEEK_START);
	end
	endtask
	
	// Task for dumping an image buffer to the currently open result file
	task dump_image_buffer_to_file;
		input reg [2:0][7:0] image_buffer [][];
	begin
		// Populate the image data in the result file
		for(r = 0; r < num_rows; r = r + 1)
		begin
			for(c = 0; c < num_cols; c = c + 1)
			begin
				// Done filtering each color portion of the pixel -> store full pixel to the file (LSB Format)
				$fwrite(res_file, "%c", image_buffer[r][c][0]);
				$fwrite(res_file, "%c", image_buffer[r][c][1]);
				$fwrite(res_file, "%c", image_buffer[r][c][2]);
			end
			// Finished a row of pixels
			// Add padding bytes to result file (advance it to the next row)
			quiet_catch = $fseek(res_file, num_pad_bytes, SEEK_CUR);
		end
		
		// Done with result file
		// Create end of file marker
		$fwrite(res_file, "%c", 8'd0);
		// Done with result file
		$fclose(res_file);
		$info("Done generating filtered file '%s' from input file '%s'", curr_res_filename, INPUT_FILENAME);
	end
	endtask
	
	// Test bench process
	initial
	begin
		// Initial values
		tb_n_reset = 1'b1;
		tb_data_ready = 1'b0;
		tb_load_coeff = 1'b0;
		tb_sample_r = 16'd0;
		tb_sample_g = 16'd0;
		tb_sample_b = 16'd0;
		tb_coeff = COEFF0;
		
		// Wait for some time before starting test cases
		#(1ns);
		
		// Read the input header
		read_input_header;
		
		// Populate the input buffer and close up the input file
		extract_input_image;
		
		// Handle the row dimensional 1-D pass
		// Generate the output header for this pass' result file
		generate_output_header(RESULT1_FILENAME);
		
		// Reset the filters
		reset_dut;
		
		// Load the coefficients
		load_filter({{COEFF_25}, {COEFF1}, {COEFF1}, {COEFF_25}});
		
		// Feed each pixel from the input image file through the DUT and store the result in the result image file
		tb_row_pass_output = new[num_rows];
		for(r = 0; r < num_rows; r = r + 1)
		begin
			tb_row_pass_output[r] = new[num_cols];
			for(c = 0; c < num_cols; c = c + 1)
			begin
				// Send the pixel to the filters
				send_pixel(tb_input_image[r][c]);
				
				// filters should be done with the corresponding output pixel
				// Capture the result pixel (B=LSB,R=MSB as per 24bpp form of 8.8.8.0.0 RGBAX format)
				tb_row_pass_output[r][c][2] = tb_fir_out_r[7:0];
				tb_row_pass_output[r][c][1] = tb_fir_out_g[7:0];
				tb_row_pass_output[r][c][0] = tb_fir_out_b[7:0];
				
				// Add some spacing between pixels
				#(5 * CLK_PERIOD);
			end
			// Finished a row of pixels
		end
		
		// Populate the image data from the first pass into it's result file
		dump_image_buffer_to_file(tb_row_pass_output);
		
		// Column Dimension 1-D pass to complete a 2-D filter of the image
		// Generate the output header for this pass' result file
		generate_output_header(RESULT2_FILENAME);
		
		// Reset the filters
		reset_dut;
		
		// Load the coefficients
		load_filter({{COEFF_25}, {COEFF1}, {COEFF1}, {COEFF_25}});
		
		// Allocate the output table
		tb_col_pass_output = new[num_rows];
		for(r = 0; r < num_rows; r = r + 1)
		begin
			tb_col_pass_output[r] = new[num_cols];
		end
		
		// Stream the output of the row-dimension pass through in as a column-dimension pass
		for(c = 0; c < num_cols; c = c + 1)
		begin
			for(r = 0; r < num_rows; r = r + 1)
			begin
				// Send the pixel to the filters
				send_pixel(tb_input_image[r][c]);
				
				// filters should be done with the corresponding output pixel
				// Capture the result pixel (B=LSB,R=MSB as per 24bpp form of 8.8.8.0.0 RGBAX format)
				tb_col_pass_output[r][c][2] = tb_fir_out_r[7:0];
				tb_col_pass_output[r][c][1] = tb_fir_out_g[7:0];
				tb_col_pass_output[r][c][0] = tb_fir_out_b[7:0];
			end
			
		end
		
		// Populate the image data in the result file
		dump_image_buffer_to_file(tb_col_pass_output);
		
		// Merge the outputs of the two phases (horizontal edge highlight plus vertical edge highlight
		// Generate the output header for this pass' result file
		generate_output_header(RESULT3_FILENAME);
		
		// Calculate merged buffer
		tb_merged_output = new[num_rows];
		for(r = 0; r < num_rows; r = r + 1)
		begin
			tb_merged_output[r] = new[num_cols];
			for(c = 0; c < num_cols; c = c + 1)
			begin
				for(integer p = 0; p < 3; p++)
				begin
					tb_temp_merge_sum = tb_row_pass_output[r][c][p] + tb_col_pass_output[r][c][p];
					if (255 < tb_temp_merge_sum)
					begin // Saturate color plane sums
						tb_merged_output[r][c][p] = 8'd255;
					end
					else
					begin
						tb_merged_output[r][c][p] = tb_temp_merge_sum[7:0];
					end
				end
			end
		end
		
		// Generate a merged output file
		dump_image_buffer_to_file(tb_merged_output);
	end
	
	
	
endmodule

