`include "eda_global_define.svh"

module eda_strobe_ram #(
  parameter M                = `CFG_M                         ,
  parameter N                = `CFG_N                         ,
  parameter WINDOW_WIDTH     = `CFG_WINDOW_WIDTH              ,
  parameter ADDR_WIDTH       = `CFG_ADDR_WIDTH                ,
  parameter I_WIDTH          = `CFG_I_WIDTH                   ,
  parameter J_WIDTH          = `CFG_J_WIDTH                    
) (
  input                       clk             ,
  input                       reset_n         ,
  input                       update_strb     ,
  input                       clear           ,
  input                       new_pixel       ,
  input                       iterated_all    ,
  input                       done            ,
  input  [ADDR_WIDTH - 1:0]   pre_center_addr ,
  input  [ADDR_WIDTH - 1:0]   upleft_addr     ,
  input  [ADDR_WIDTH - 1:0]   up_addr         ,
  input  [ADDR_WIDTH - 1:0]   upright_addr    ,
  input  [ADDR_WIDTH - 1:0]   left_addr       ,
  input  [ADDR_WIDTH - 1:0]   right_addr      ,
  input  [ADDR_WIDTH - 1:0]   downleft_addr   ,
  input  [ADDR_WIDTH - 1:0]   down_addr       ,
  input  [ADDR_WIDTH - 1:0]   downright_addr  ,
  input  [M-1:0]              sel_row         , // Find next row (Ex: 00010..00)
  input  [M-1:0][N-1:0]       sel_col         , // Find next column (Ex: 00010..00) for all rows
  output [M-1:0][N-1:0]       strb_value       
);

  logic [M - 1:0][N - 1:0]                     strb_memory;
  logic [WINDOW_WIDTH - 2:0][ADDR_WIDTH - 1:0] addr_arr   ;

  //|----------|--------|-----------|
  //| upleft   |   up   | upright   |
  //|----------|--------|-----------|
  //| left     | center |   right   |
  //|----------|--------|-----------|
  //| downleft | down   | downright |
  //|----------|--------|-----------|

  assign addr_arr = {upleft_addr, up_addr, upright_addr, left_addr, right_addr, downleft_addr, down_addr, downright_addr};

  // always_ff @(posedge clk or negedge reset_n) begin : proc_strb_memory_pre_center_addr
  //   if ((!update_strb) & new_pixel) begin
  //     strb_memory[pre_center_addr[ADDR_WIDTH-1:J_WIDTH]][pre_center_addr[J_WIDTH-1:0]] <= 1;
  //   end
  // end

  // genvar i, j;
  // generate
  //   for (i = 0; i < M; i++) begin
  //     for (j = 0; j < N; j++) begin
  //       if ((i == 0) & (j == 0)) begin
  //         always_ff @(posedge clk or negedge reset_n) begin : proc_strb_memory
  //           if(~reset_n) begin
  //             strb_memory[i][j] <= 1;
  //           end else begin
  //             if (update_strb & new_pixel) begin
  //               strb_memory[i][j] <= 0;
  //             end
  //           end
  //         end
  //       end
  //       else begin
  //         always_ff @(posedge clk or negedge reset_n) begin : proc_strb_memory
  //           if(~reset_n) begin
  //             strb_memory[i][j] <= 0;
  //           end else begin
  //             if (update_strb & new_pixel) begin
  //               if (sel_row[i] & sel_col[i][j]) begin
  //                 strb_memory[i][j] <= 1;
  //               end
  //               else begin
  //                 strb_memory[i][j] <= 0;
  //               end
  //             end
  //           end
  //         end
  //       end
  //     end
  //   end
  // endgenerate
  // genvar i, j;

  generate
    for (genvar i = 0; i < M; i = i + 1) begin
      for (genvar j = 0; j < N; j = j + 1) begin
        assign strb_value[i][j] = strb_memory[i][j];
      end
    end
  endgenerate

  always_ff @(posedge clk or negedge reset_n) begin
    if(~reset_n) begin
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < N; j++) begin
          if ((i == 0) & (j == 0)) begin
            strb_memory[i][j] <= 1;
          end else begin
            strb_memory[i][j] <= 0;
          end
        end
      end
    end else if (clear) begin
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < N; j++) begin
          if ((i == 0) & (j == 0)) begin
            strb_memory[i][j] <= 1;
          end else begin
            strb_memory[i][j] <= 0;
          end
        end
      end
    end else if (update_strb & new_pixel & (!iterated_all)) begin
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < N; j++) begin
          if ((i == 0) & (j == 0)) begin
            strb_memory[i][j] <= 0;
          end else begin
            if (sel_row[i] & sel_col[i][j]) begin
              strb_memory[i][j] <= 1;
            end
            else begin
              strb_memory[i][j] <= 0;
            end
          end
        end
      end
    end else if ((!update_strb) & new_pixel & (!iterated_all)) begin
      strb_memory[pre_center_addr[ADDR_WIDTH-1:J_WIDTH]][pre_center_addr[J_WIDTH-1:0]] <= 1;
    end
  end

endmodule