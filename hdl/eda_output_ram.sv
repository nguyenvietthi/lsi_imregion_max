`include "eda_global_define.svh"

module eda_output_ram #(
  parameter M                = `CFG_M                            ,
  parameter N                = `CFG_N                            ,
  parameter PIXEL_WIDTH      = `CFG_PIXEL_WIDTH                  ,
  parameter WINDOW_WIDTH     = `CFG_WINDOW_WIDTH                 ,
  parameter ADDR_WIDTH       = `CFG_ADDR_WIDTH                   ,
  parameter I_WIDTH          = `CFG_I_WIDTH                      ,
  parameter J_WIDTH          = `CFG_J_WIDTH                      
)(
  input                       clk           ,  // Clock
  input                       reset_n       ,  // Asynchronous reset active low
  input                       clear         ,  // Synchronous reset active low, use when load new image
  input                       new_pixel     ,  
  input                       update_strb   ,
  input                       compare_out   ,
  input        [M-1:0][N-1:0] strb_value    ,
  output logic [M-1:0][N-1:0] matrix_output  
);

  logic compare_out_tmp;
  // logic iterated_all_reg;

  always_ff @(posedge clk or negedge reset_n) begin : proc_compare_out_tmp
    if(~reset_n) begin
      compare_out_tmp <= 1;
    end else begin
      if (clear | update_strb) begin
        compare_out_tmp <= 1;
      end
      else if ((!compare_out) & new_pixel) begin
        compare_out_tmp <= 0;
      end
    end
  end

  genvar i, j;
  generate
    for (i = 0; i < M; i = i+1) begin
      for (j = 0; j < N; j = j+1) begin
        always_ff @(posedge clk or negedge reset_n) begin
          if(~reset_n) begin
            matrix_output[i][j] <= 1'b1;
          end else begin
            // clear matrix, using when load new image
            if (clear) begin
              matrix_output[i][j] <= 1'b1;
            end
            // Update pixels which has strb
            else if (update_strb & new_pixel) begin
              if (strb_value[i][j]) begin
                matrix_output[i][j] <= (compare_out & compare_out_tmp);
              end
            end
            else if (new_pixel) begin
              if (strb_value[i][j]) begin
                matrix_output[i][j] <= compare_out_tmp;
              end
            end
          end
        end
      end
    end
  endgenerate


endmodule