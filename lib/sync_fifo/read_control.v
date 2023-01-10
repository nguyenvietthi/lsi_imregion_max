`include "eda_global_define.svh"

module read_control #(
	parameter MEM_DEPTH  = `CFG_FIFO_DEPTH      , // Memory depth
	parameter DATA_WIDTH = `CFG_DATA_WIDTH      , // Data width
	parameter ADDR_WIDTH = $clog2(MEM_DEPTH) // Address width
)
(
	input                     clk     , // Clock signal
	input                     reset_n , // Source domain asynchronous reset (active low)
	input                     rd_ready, // Request read data from FIFO
	input                     rd_empty, // FIFO empty flag
	output reg [ADDR_WIDTH:0] rd_addr   // Read address
);

	//============================================
	//      Internal signals and variables
	//============================================

	wire rd_en; // Read enable

	//============================================
	//               Read address
	//============================================

	always @(posedge clk or negedge reset_n) begin : proc_rd_addr
		if(~reset_n) begin
			rd_addr <= 0;
		end 
    else begin
      if (rd_en & (rd_addr == ADDR_WIDTH'(MEM_DEPTH-1))) begin
        rd_addr <= 0;
      end
      else if (rd_en) begin
  			rd_addr <= rd_addr + 1;
  		end
    end
	end

	//============================================
	//                Read enable
	//============================================

	assign rd_en = rd_ready & (!rd_empty);

endmodule