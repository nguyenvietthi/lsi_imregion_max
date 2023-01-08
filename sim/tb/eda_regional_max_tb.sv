`timescale 1ns/1ps
module eda_regional_max_tb ();
  parameter M                = 6                             ;
  parameter N                = 6                             ;
  parameter PIXEL_WIDTH      = 8                             ;
  parameter WINDOW_WIDTH     = 9                             ;
  parameter ADDR_WIDTH       = $clog2(M*N)                   ;
  parameter I_WIDTH          = $clog2(M)                     ;
  parameter J_WIDTH          = $clog2(M)                     ;

  logic                                           clk        ;
  logic                                           reset_n    ;
  logic                                           write_en   ;
  logic        [ADDR_WIDTH - 1:0]                 wr_addr    ;
  logic        [PIXEL_WIDTH- 1:0]                 pixel_in   ;
  logic        [ADDR_WIDTH - 1:0]                 center_addr;
  logic                                           new_pixel  ;
  logic                                           clear      ;

  eda_regional_max eda_regional_max_inst (
    .clk        (clk        ),
    .reset_n    (reset_n    ),
    .write_en   (write_en   ),
    .wr_addr    (wr_addr    ),
    .pixel_in   (pixel_in   ),
    .center_addr(center_addr),
    .new_pixel  (new_pixel  ),
    .clear      (clear      )
  );
  logic [PIXEL_WIDTH - 1:0] img_memory [0:M - 1] [0:N - 1];

  initial begin
    $readmemh("../tb/image_input", img_memory);
    $display("img_memory: %p\n", img_memory);
  end

  always #10 clk = ~clk;

  initial begin
    clk = 0;
    reset_n = 0;
    write_en = 0;
    @(negedge clk) reset_n = 1;

    for (logic[I_WIDTH - 1:0] i = 0; i < M; i++) begin
      for (logic[J_WIDTH - 1:0] j = 0; j < N; j++) begin
        @(negedge clk) write_en = 0;
        @(negedge clk) begin 
          wr_addr = {i,j};
          pixel_in = img_memory[i][j];
          write_en = 1;
        end
      end
    end

    @(negedge clk) center_addr = 0;
    repeat (30) begin 
      @(negedge clk);
    end
    $finish;
  end


endmodule