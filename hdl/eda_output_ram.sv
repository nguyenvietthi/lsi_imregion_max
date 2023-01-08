`include "eda_global_define.vh"

module eda_output_ram #(
  parameter M                = `CFG_M                            ,
  parameter N                = `CFG_N                            ,
  parameter PIXEL_WIDTH      = `CFG_PIXEL_WIDTH                  ,
  parameter WINDOW_WIDTH     = `CFG_WINDOW_WIDTH                 ,
  parameter ADDR_WIDTH       = `CFG_ADDR_WIDTH                   ,
  parameter I_WIDTH          = `CFG_I_WIDTH                      ,
  parameter J_WIDTH          = `CFG_J_WIDTH                      
)(
  input                   clk           ,    // Clock
  input                   reset_n       ,  // Asynchronous reset active low
  input                   clear         ,  // Asynchronous reset active low
  input                   update_output ,
  input                   compare_out   ,
  input        [M-1][N-1] strb_value    ,
  output logic [M-1][N-1] matrix_output 
);


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
          else if (!compare_out) begin
            if (strb_value[i][j]) begin
              matrix_output[i][j] <= 1'b0;
            end
          end
        end
      end
    end
  end
endgenerate


endmodule : eda_output_ram