`include "eda_global_define.svh"

module eda_compare #(
  parameter M                = `CFG_M                         ,
  parameter N                = `CFG_N                         ,
  parameter PIXEL_WIDTH      = `CFG_PIXEL_WIDTH               ,
  parameter WINDOW_WIDTH     = `CFG_WINDOW_WIDTH              ,
  parameter ADDR_WIDTH       = `CFG_ADDR_WIDTH                 
)(
  input                                           clk             ,
  input                                           reset_n         ,
  input                                           new_pixel       ,
  input        [PIXEL_WIDTH * WINDOW_WIDTH - 1:0] window_values   ,
  input        [WINDOW_WIDTH - 2:0]               neigh_addr_valid,
  input        [WINDOW_WIDTH - 2:0]               iterated_idx    ,
  output logic                                    compare_out     ,
  output       [WINDOW_WIDTH - 2:0]               push_positions   
);
  logic [WINDOW_WIDTH - 2:0]               equal_positions; 
	//Find max value in 9 pixels
	logic [PIXEL_WIDTH - 1:0] max_value    ;
  logic [PIXEL_WIDTH - 1:0] value_l1[0:3];
  generate
    for (genvar i = 0; i < 8; i = i + 2) begin
      eda_max cl1 (
				.a   (window_values[i * PIXEL_WIDTH + 7 -: PIXEL_WIDTH]      ),
				.b   (window_values[(i + 1) * PIXEL_WIDTH + 7 -: PIXEL_WIDTH]),
				.out (value_l1[i / 2]                                        )
      );
    end
  endgenerate

  logic [PIXEL_WIDTH - 1:0] value_l2[0:1];
  generate
    for (genvar i = 0; i < 4; i = i + 2) begin 
      eda_max cl2 (
				.a   (value_l1[i]    ),
				.b   (value_l1[i + 1]),
				.out (value_l2[i / 2])
      );
    end
  endgenerate

  logic [PIXEL_WIDTH - 1:0] value_l3[0:0];

  generate
    for (genvar i = 0; i < 2; i = i + 2) begin 
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
  	end else begin 
      compare_out = 1;
    end
  end

  // Generate equal_positions
  generate
  	for (genvar i = 0; i < WINDOW_WIDTH; i++) begin
  		if(i < 4) begin
  			always_comb begin
  				if(window_values[i * PIXEL_WIDTH + 7 : i * PIXEL_WIDTH] == window_values[4 * PIXEL_WIDTH + 7 -: PIXEL_WIDTH]) begin
  					equal_positions[i] = new_pixel;
  				end else begin
            equal_positions[i] = 0;
          end
  			end
      end else if(i > 4) begin
  			always_comb begin
  				if(window_values[i * PIXEL_WIDTH + 7 : i * PIXEL_WIDTH] == window_values[4 * PIXEL_WIDTH + 7 -: PIXEL_WIDTH]) begin
  					equal_positions[i - 1] = new_pixel;
  				end else begin
            equal_positions[i - 1] = 0;
          end
  			end
      end
  	end
  endgenerate

  assign push_positions = equal_positions & ~iterated_idx & neigh_addr_valid;

endmodule