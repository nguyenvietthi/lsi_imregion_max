`timescale 1ns/1ps
module eda_regional_max_tb ();
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
  logic [PIXEL_WIDTH - 1:0] img_memory [I_WIDTH - 1:0] [J_WIDTH - 1:0];

  initial begin
    $readmemh("../tb/image_input", img_memory);
    $display("img_memory: %p\n", img_memory);
  end

  always #10 clk = ~clk;


endmodule