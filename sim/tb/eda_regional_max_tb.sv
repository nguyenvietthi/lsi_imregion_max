`timescale 1ns/1ps
`include "eda_global_define.svh"

module eda_regional_max_tb ();
  parameter M                = `CFG_M                           ;
  parameter N                = `CFG_N                           ;
  parameter PIXEL_WIDTH      = `CFG_PIXEL_WIDTH                 ;
  parameter WINDOW_WIDTH     = `CFG_WINDOW_WIDTH                ;
  parameter ADDR_WIDTH       = `CFG_ADDR_WIDTH                  ;
  parameter I_WIDTH          = `CFG_I_WIDTH                     ;
  parameter J_WIDTH          = `CFG_J_WIDTH                     ;

  logic                        clk          ; 
  logic    [PIXEL_WIDTH- 1:0]  pixel_in     ; 
  logic    [ADDR_WIDTH - 1:0]  rd_addr      ; 
  logic                        reset_n      ; 
  logic                        start        ; 
  logic    [ADDR_WIDTH - 1:0]  wr_addr      ; 
  logic                        write_en     ; 
  logic                        done         ; 
  logic    [M - 1:0][N - 1:0]  matrix_output;

  eda_regional_max eda_regional_max_inst (
    .clk           (clk          ),
    .pixel_in      (pixel_in     ),
    .rd_addr       (rd_addr      ),
    .reset_n       (reset_n      ),
    .start         (start        ),
    .wr_addr       (wr_addr      ),
    .write_en      (write_en     ),
    .done          (done         ),
    .matrix_output (matrix_output) 
  );

  logic [PIXEL_WIDTH - 1:0] img_memory [0:M - 1] [0:N - 1];
  logic [I_WIDTH - 1:0] i_center;
  logic [J_WIDTH - 1:0] j_center;
  int                   start_check;
  initial begin
    $readmemh("../tb/image_input", img_memory);
    $display("img_memory: %p\n", img_memory);
  end

  always #10 clk = ~clk;
  assign center_addr = {i_center, j_center};
  initial begin
    clk = 0;
    reset_n = 0;
    write_en = 0;
    start = 0;
    start_check = 0;

    @(negedge clk);
    reset_n = 1;

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

    @(negedge clk);
    @(negedge clk);
    $display("\nimg_memory after write pixels: %p\n", eda_regional_max_inst.eda_img_ram.img_memory);
    start_check = 1;

    @(negedge clk);
    start = 1;
    @(negedge clk);
    start = 0;

    @(negedge clk) begin 
      i_center = 3;
      j_center = 2;
    end

    repeat (300) begin 
      @(negedge clk);
    end
    $finish;
  end

  always_ff @(posedge clk) begin
    if (start_check == 1) begin
      $display("iterated_memory @ %4d ns", $realtime());
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < N; j++) begin
            $write("%p ", eda_regional_max_inst.eda_iterated_ram.iterated_memory[i][j]); 
        end
        $write("\n");
      end
    end
  end

  always_ff @(posedge clk) begin
    if (start_check == 1) begin
      $display("addr_arr @ %4d ns", $realtime());
      for (int i = M - 1; i >= 0; i--) begin
        $write("%b ", eda_regional_max_inst.eda_iterated_ram.addr_arr[i]); 
        $write("\n");
      end
    end
  end

endmodule