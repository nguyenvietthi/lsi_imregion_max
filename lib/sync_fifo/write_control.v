`include "eda_global_define.vh"

module write_control #(
	parameter MEM_DEPTH  = `CFG_FIFO_DEPTH      , // Memory depth
	parameter DATA_WIDTH = `CFG_DATA_WIDTH      , // Data width
	parameter ADDR_WIDTH = $clog2(MEM_DEPTH) // Address width
)
(
	input                     clk     , // Clock signal
	input                     reset_n , // Source domain asynchronous reset (active low)
	input                     wr_valid, // Request write data into FIFO
	input                     wr_full , // FIFO full flag
	output                    wr_en   , // Write data
	output reg [ADDR_WIDTH:0] wr_addr   // Write address
);

	//============================================
	//               Write address
	//============================================

	always @(posedge clk or negedge reset_n) begin : proc_wr_addr
		if(~reset_n) begin
			wr_addr <= 0;
		end else if (wr_en) begin
			wr_addr <= wr_addr + 1;
		end
	end

	//============================================
	//                Write enable
	//============================================

	assign wr_en = wr_valid & (!wr_full);

endmodule