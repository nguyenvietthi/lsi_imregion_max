`include "eda_global_define.svh"

module comparator #(
	parameter FIFO_DEPTH = `CFG_FIFO_DEPTH       , // FIFO depth
	parameter ADDR_WIDTH = $clog2(`CFG_FIFO_DEPTH)  // Address width
)
(
	input                   clk              , // Clock signal
	input                   reset_n          , // Source domain asynchronous reset (active low)
	input                   i_valid_s        , // Request write data into FIFO
	input                   i_ready_m        , // Request read data from FIFO
	input  [ADDR_WIDTH:0]   wr_addr          , // Write address
	input  [ADDR_WIDTH:0]   rd_addr          , // Read address
	input  [ADDR_WIDTH-1:0] i_almostfull_lvl , // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
	input  [ADDR_WIDTH-1:0] i_almostempty_lvl, // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
	output reg              o_ready_s        , // Status write data into FIFO (if FIFO not full then o_ready_s = 1)					
	output reg              o_almostfull     , // FIFO almostfull flag (determined by i_almostfull_lvl)
	output reg              o_full           , // FIFO full flag
	output reg              o_valid_m        , // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
	output reg              o_almostempty    , // FIFO almostempty flag (determined by i_almostempty_lvl)
	output                  o_empty            // FIFO empty flag
);

	//============================================
	//      Internal signals and variables
	//============================================

	wire [ADDR_WIDTH:0] num_elements; // Number of elements

	//============================================
	//            Number of elements
	//============================================

	assign num_elements = wr_addr + ((~rd_addr) + 1); // Number of elements = write address - read address

	//============================================
	//                  Flags
	//============================================

	// Flag FIFO almost full
	always @(posedge clk or negedge reset_n) begin : proc_o_almostfull
		if(~reset_n) begin
			o_almostfull <= 0;
		end else if ((num_elements == i_almostfull_lvl - 1) & i_valid_s & (!i_ready_m)) begin
			o_almostfull <= 1;
		end
		else if ((num_elements == i_almostfull_lvl) & i_ready_m & (!i_valid_s)) begin
			o_almostfull <= 0;
		end
	end

	// Flag FIFO full and flag valid for reading data
	always @(posedge clk or negedge reset_n) begin : proc_o_full
		if(~reset_n) begin
			o_full <= 0;
			o_ready_s <= 1;
		end else if ((((num_elements == (FIFO_DEPTH-1)) & i_valid_s) | (num_elements == FIFO_DEPTH))  & (!i_ready_m)) begin
			o_full <= 1;
			o_ready_s <= 0;
		end
		else begin
			o_full <= 0;
			o_ready_s <= 1;
		end
	end

	// Flag FIFO almost empty
	always @(posedge clk or negedge reset_n) begin : proc_o_almostempty
		if(~reset_n) begin
			o_almostempty <= 1;
		end else if (((num_elements == i_almostempty_lvl + 1) & i_ready_m & (!i_valid_s)) | o_empty) begin
			o_almostempty <= 1;
		end
		else if ((num_elements == i_almostempty_lvl) & i_valid_s & (!i_ready_m)) begin
			o_almostempty <= 0;
		end
	end

	// Flag FIFO empty
	always @(posedge clk or negedge reset_n) begin : proc_o_empty
		if(~reset_n) begin
			// o_empty <= 1;
			o_valid_m <= 0;
		end else if ((((num_elements == 1) & i_ready_m) | (num_elements == 0)) & (!i_valid_s)) begin
			// o_empty <= 1;
			o_valid_m <= 0;
		end
		else begin
			// o_empty <= 0;
			o_valid_m <= 1;
		end
	end
  
  assign o_empty = (num_elements == 0);

endmodule