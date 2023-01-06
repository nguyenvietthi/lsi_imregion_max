module eda_compare #(
  parameter M                = 16                             ,
  parameter N                = 16                             ,
  parameter PIXEL_WIDTH      = 8                              ,
  parameter WINDOW_WIDTH     = 9                              ,
  parameter ADDR_WIDTH       = $clog2(M*N)                    
)(
  input                                           clk             ,
  input                                           reset_n         ,
  input                                           new_pixel       ,
  input        [PIXEL_WIDTH * WINDOW_WIDTH - 1:0] window_values   ,
  input        [WINDOW_WIDTH - 2:0]               neigh_addr_valid,
  input        [WINDOW_WIDTH - 2:0]               iterated_idx    ,
  output logic                                    compare_out     ,
  output logic [WINDOW_WIDTH - 2:0]               equal_positions ,
  output       [WINDOW_WIDTH - 2:0]               push_positions   
);
	//Find max value in 9 pixels
	logic [PIXEL_WIDTH - 1]   max_value    ;
  logic [PIXEL_WIDTH - 1:0] value_l1[0:3];
  generate
    for (int i = 0; i < 8; i = i + 2) begin
      eda_max cl1 (
				.a   (window_values[i * PIXEL_WIDTH + 7 : i * PIXEL_WIDTH]            ),
				.b   (window_values[(i + 1) * PIXEL_WIDTH + 7 : (i + 1) * PIXEL_WIDTH]),
				.out (value_l1[i / 2]                                                 )
      );
    end
  endgenerate

  logic [PIXEL_WIDTH - 1:0] value_l2[0:1];
  generate
    for (int i = 0; i < 4; i = i + 2) begin 
      eda_max cl2 (
				.a   (value_l1[i]    ),
				.b   (value_l1[i + 1]),
				.out (value_l2[i / 2])
      );
    end
  endgenerate

  logic [PIXEL_WIDTH - 1:0] value_l3[0:0];

  generate
    for (int i = 0; i < 2; i = i + 2) begin 
      eda_max cl3 (
				.a   (value_l2[i]    ),
				.b   (value_l2[i + 1]),
				.out (value_l3[i / 2])
      );
    end
  endgenerate

  eda_max clfinal (
		.a   (value_l3[0]                                                 ),
		.b   (window_values[PIXEL_WIDTH * WINDOW_WIDTH - 1 -: PIXEL_WIDTH]),
		.out (max_value                                                   )
  );

  always_comb begin
  	if (max_value > window_values[4 * PIXEL_WIDTH + 7 -: PIXEL_WIDTH]) begin
  		compare_out = 0;
  	end
  end

  // Generate equal_positions
  logic [WINDOW_WIDTH - 2:0] equal_positions_tmp ;
  generate
  	for (int i = 0; i < WINDOW_WIDTH; i++) begin
  		if(i < 4) begin
  			always_comb begin
  				if(window_values[i * PIXEL_WIDTH + 7 : i * PIXEL_WIDTH] == max_value) begin
  					equal_positions_tmp[i] = 1;
  				end else begin
  					equal_positions_tmp[i] = 0;
  				end
  			end
      end else if(i > 4) begin
  			always_comb begin
  				if(window_values[i * PIXEL_WIDTH + 7 : i * PIXEL_WIDTH] == max_value) begin
  					equal_positions_tmp[i - 1] = 1;
  				end else begin
  					equal_positions_tmp[i - 1] = 0;
  				end
  			end
      end
  	end
  endgenerate

  always_ff @(posedge clk or negedge reset_n) begin
  	if(~reset_n) begin
  		equal_positions <= 0;
  	end else begin
  		if(new_pixel) begin
  			equal_positions <= equal_positions_tmp & neigh_addr_valid;
  		end else if(push_positions) begin
  			equal_positions <= 0;
  		end
  	end
  end

  // Generate push positions
  logic [WINDOW_WIDTH - 2:0] index_push_fifo    ;
  logic [WINDOW_WIDTH - 2:0] index_push_fifo_reg;

  assign index_push_fifo = equal_positions & ~iterated_idx;

  always_ff @(posedge clk or negedge reset_n) begin : proc_
  	if(~reset_n) begin
  		index_push_fifo_reg <= 0;
  	end else begin
  		index_push_fifo_reg <= index_push_fifo;
  	end
  end

  assign push_positions = index_push_fifo & (index_push_fifo ^ index_push_fifo_reg); // active 1 cycle

endmodule