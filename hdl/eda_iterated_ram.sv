module eda_iterated_ram  #(
  parameter M                = 16                             ,
  parameter N                = 16                             ,
  parameter WINDOW_WIDTH     = 9                              ,
  parameter ADDR_WIDTH       = $clog2(M*N)                    ,
  parameter I_WIDTH          = $clog2(M)                      ,
  parameter J_WIDTH          = $clog2(M)                      
)(
  input                             clk             ,
  input                             reset_n         ,
  input                             clear           ,
  input                             new_pixel       ,
  input        [ADDR_WIDTH - 1:0]   center_addr     , //{i, j}
  input        [ADDR_WIDTH - 1:0]   upleft_addr     ,
  input        [ADDR_WIDTH - 1:0]   up_addr         ,
  input        [ADDR_WIDTH - 1:0]   upright_addr    ,
  input        [ADDR_WIDTH - 1:0]   left_addr       ,
  input        [ADDR_WIDTH - 1:0]   right_addr      ,
  input        [ADDR_WIDTH - 1:0]   downleft_addr   ,
  input        [ADDR_WIDTH - 1:0]   down_addr       ,
  input        [ADDR_WIDTH - 1:0]   downright_addr  ,
  input        [WINDOW_WIDTH - 2:0] push_positions  ,
  output logic [WINDOW_WIDTH - 2:0] iterated_idx    
);

	logic                    iterated_memory [M - 1:0] [N - 1:0];
	logic [ADDR_WIDTH - 1:0] addr_arr        [WINDOW_WIDTH - 2:0];

	assign addr_arr = {upleft_addr, up_addr, upright_addr, left_addr, right_addr, downleft_addr, down_addr, downright_addr};

	// clear data in inerated memory
	generate
		for (genvar i = 0; i < M; i++) begin
			for (genvar j = 0; j < N; j++) begin
				always_ff @(posedge clk or negedge reset_n) begin
					if(~reset_n) begin
						iterated_memory[i][j] <= 0;
					end else begin
						if(clear) begin
							iterated_memory[i][j] <= 0;
						end
					end
				end
			end
		end
	endgenerate

	// Update genvarerate of center pixel
	always_ff @(posedge clk or negedge reset_n) begin
		if(new_pixel) begin
			iterated_memory[center_addr[ADDR_WIDTH - 1:J_WIDTH]][center_addr[J_WIDTH - 1:0]] <= 1;
		end
	end

	// Update genvarerate
	generate
		for (genvar i = 0; i < WINDOW_WIDTH - 1; i++) begin
			always_ff @(posedge clk or negedge reset_n) begin
				if(push_positions[i]) begin
					iterated_memory[addr_arr[i][ADDR_WIDTH - 1:J_WIDTH]][addr_arr[i][J_WIDTH - 1:0]] <= 1;
				end
			end
		end
	endgenerate

	// genvarerate ouput
	generate
		for (genvar i = 0; i < WINDOW_WIDTH - 1; i++) begin
			always_comb begin
				iterated_idx[i] = iterated_memory[addr_arr[i][ADDR_WIDTH - 1:J_WIDTH]][addr_arr[i][J_WIDTH - 1:0]];
			end
		end
	endgenerate
endmodule