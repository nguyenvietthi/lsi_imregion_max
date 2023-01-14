`include "eda_global_define.svh"

module eda_iterated_ram  #(
  parameter M                = `CFG_M                         ,
  parameter N                = `CFG_N                         ,
  parameter WINDOW_WIDTH     = `CFG_WINDOW_WIDTH              ,
  parameter ADDR_WIDTH       = `CFG_ADDR_WIDTH                ,
  parameter I_WIDTH          = `CFG_I_WIDTH                   ,
  parameter J_WIDTH          = `CFG_J_WIDTH                    
)(
  input                             clk             ,
  input                             reset_n         ,
  input                             clear           ,
  input                             new_pixel       ,
  input                             done            ,
  input        [WINDOW_WIDTH - 2:0] fifo_empty      ,
  input        [ADDR_WIDTH - 1:0]   center_addr     , //{i, j}
  input        [ADDR_WIDTH - 1:0]   upleft_addr     ,
  input        [ADDR_WIDTH - 1:0]   up_addr         ,
  input        [ADDR_WIDTH - 1:0]   upright_addr    ,
  input        [ADDR_WIDTH - 1:0]   left_addr       ,
  input        [ADDR_WIDTH - 1:0]   right_addr      ,
  input        [ADDR_WIDTH - 1:0]   downleft_addr   ,
  input        [ADDR_WIDTH - 1:0]   down_addr       ,
  input        [ADDR_WIDTH - 1:0]   downright_addr  ,
  input        [WINDOW_WIDTH - 2:0] neigh_addr_valid,
  input        [WINDOW_WIDTH - 2:0] push_positions  ,
  output logic [WINDOW_WIDTH - 2:0] iterated_idx    ,
  output logic [I_WIDTH - 1:0]      next_row        ,
  output logic [J_WIDTH - 1:0]      next_col        ,
  output logic [M - 1:0]            sel_row         , // Find next row (Ex: 00010..00)
  output logic [M - 1:0][N - 1:0]   sel_col         , // Find next column (Ex: 00010..00) for all rows
  output logic                      iterated_all     
);

  logic                                         inv_clk        ;
  logic                                         have_done      ;
	logic [M - 1:0][N - 1:0]                      iterated_memory;
	logic [WINDOW_WIDTH - 2:0][ADDR_WIDTH - 1:0]  addr_arr       ;
  logic [M - 1:0][N - 1:0]                      current_row    ; // Get data from all rows of iterated RAM
  logic [M - 1:0]                               combine_row    ; // Check if each row has pixel that has not iterated yet
  logic [N - 1:0]                               final_sel_col  ; // Find next column (Ex: 00010..00)

  assign inv_clk = (~clk);

  // Next row
  eda_one_hot_to_bin #(
    .ONE_HOT_WIDTH (M      ),
    .BIN_WIDTH     (I_WIDTH) 
  )
  eda_one_hot_to_bin_next_row (
    .one_hot_code (sel_row ),
    .bin_code     (next_row) 
  );

  // Next column
  eda_one_hot_to_bin #(
    .ONE_HOT_WIDTH (N      ),
    .BIN_WIDTH     (J_WIDTH) 
  )
  eda_one_hot_to_bin_next_col (
    .one_hot_code (final_sel_col ),
    .bin_code     (next_col      ) 
  );

  // Get data from all rows of iterated RAM
  generate
    for (genvar i = 0; i < M; i++) begin
      for (genvar j = 0; j < N; j++) begin
        assign current_row[i][j] = iterated_memory[i][j];
      end
    end
  endgenerate

  // Find next column (Ex: 00010..00)
  generate
    for (genvar i = 0; i < M; i++) begin
      assign sel_col[i] = ((current_row[i] + 1) & (~current_row[i]));
    end
  endgenerate

  // Check if each row has pixel that has not iterated yet
  generate
    for (genvar i = 0; i < M; i++) begin
      assign combine_row[i] = |sel_col[i];
    end
  endgenerate

  // Select row
  assign sel_row = (((~combine_row) + 1) & combine_row);

  // Select column
  always_comb begin
    final_sel_col = 0;
    for (int i = 0; i < M; i++) begin
      if (sel_row[i] == 1) begin
        final_sel_col = sel_col[i];
      end
    end
  end

  // Check if all pixels have been iterated
  always_ff @(posedge clk or negedge reset_n) begin : proc_iterated_all
    if(~reset_n) begin
      iterated_all <= 0;
    end else begin
      iterated_all <= ((final_sel_col == 0) & (sel_row == 0)) & (fifo_empty == {(WINDOW_WIDTH-1){1'b1}}) & new_pixel;
    end
  end

	assign addr_arr = {upleft_addr, up_addr, upright_addr, left_addr, right_addr, downleft_addr, down_addr, downright_addr};

  always_ff @(posedge clk or negedge reset_n) begin : proc_have_done
    if(~reset_n) begin
      have_done <= 0;
    end else begin
      if (!have_done) begin
        have_done <= done;
      end
      else begin
        have_done <= 0;
      end
    end
  end

	always_ff @(posedge inv_clk or negedge reset_n) begin
		if(~reset_n) begin
			iterated_memory <= 0;
		end else if(have_done) begin
			iterated_memory <= 0;
		end else begin
			for (int i = 0; i < WINDOW_WIDTH - 1; i++) begin
				if(push_positions[i]) begin
					iterated_memory[addr_arr[i][ADDR_WIDTH - 1:J_WIDTH]][addr_arr[i][J_WIDTH - 1:0]] <= 1;
				end
			end
			if (new_pixel) begin
				iterated_memory[center_addr[ADDR_WIDTH - 1:J_WIDTH]][center_addr[J_WIDTH - 1:0]] <= 1;
			end
		end
	end

	// genvarerate ouput
	generate
		for (genvar i = 0; i < WINDOW_WIDTH - 1; i++) begin
			always_comb begin
        if (neigh_addr_valid[i]) begin
          iterated_idx[i] = iterated_memory[addr_arr[i][ADDR_WIDTH - 1:J_WIDTH]][addr_arr[i][J_WIDTH - 1:0]];
        end else begin
          iterated_idx[i] = 0;
        end
			end
		end
	endgenerate
endmodule