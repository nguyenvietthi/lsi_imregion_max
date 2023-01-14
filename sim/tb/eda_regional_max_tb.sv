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

  logic [PIXEL_WIDTH - 1:0]                     img_memory [0:M - 1] [0:N - 1];
  logic [0:M - 1] [0:N - 1][PIXEL_WIDTH - 1:0]  img_memory_cp;
  logic  [M - 1:0][N - 1:0]                     output_image ;
  logic  [M - 1:0][N - 1:0]                     output_image_model ;
  logic                                         done_reg;

  always #10 clk = ~clk;

  always_ff @(posedge clk or negedge reset_n) begin : proc_done_reg
    if(~reset_n) begin
      done_reg <= 0;
    end else begin
      done_reg <= done;
    end
  end


  eda_regional_max eda_regional_max_inst (
    .clk           (clk          ),
    .pixel_in      (pixel_in     ),
    .reset_n       (reset_n      ),
    .start         (start        ),
    .wr_addr       (wr_addr      ),
    .write_en      (write_en     ),
    .done          (done         ),
    .matrix_output (matrix_output) 
  );

 regional_max_model regional_max_model(
  .clk         (clk           ) ,
  .reset_n     (reset_n       ) ,
  .start       (start         ) ,
  .img_memory  (img_memory_cp ) ,
  .output_image(output_image_model  ) 
);


 string str;
 string img_name;
  initial begin
    clk = 0;
    reset_n = 0;
    write_en = 0;
    start_check = 0;
    start = 0;

    @(negedge clk);
    reset_n = 1;

    for (int matrix_num = 0; matrix_num < 10002; matrix_num++) begin 
      $sformat(str, "%0d", matrix_num);
      // $display("%s",str);
      img_name = {"../tb/image_input_", str};      
      $display(" ================================================================== ");
      $display("%t IMAGE ", $time());
      $display("%s",img_name);
      $readmemh(img_name, img_memory);
      $display("img_memory: %p\n", img_memory);
      @(negedge clk);
      @(negedge clk);

      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < N; j++) begin 
          img_memory_cp[i][j] = img_memory[i][j];
        end
      end

      for (logic[I_WIDTH - 1:0] m = 0; m < M; m++) begin
        for (logic[J_WIDTH - 1:0] n = 0; n < N; n++) begin
          @(negedge clk) write_en = 0;
          @(negedge clk) begin 
            wr_addr = {m,n};
            pixel_in = img_memory[m][n];
            write_en = 1;
          end
        end
      end

      @(negedge clk) write_en = 0;
      $display("\nimg_memory after write pixels: %p\n", eda_regional_max_inst.eda_img_ram.img_memory);

      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      start = 1;
      @(negedge clk);
      start = 0;
      @(posedge done);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
    end

    repeat (300) begin 
      @(negedge clk);
    end

    $finish;
  end
  
  logic compare;
  always_comb begin
    compare = 0;
    if(done & (~done_reg)) begin
      $display(" ================================================================== ");
      $display(" IMAGE ");
      $display("%s",img_name);
      $display("%0t IMAGE:", $time());
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < N; j++) begin
            $write("%p ", img_memory[i][j]); 
        end
        $write("\n");
      end
      $display("%0t RESULT:", $time());
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < N; j++) begin
            $write("%p ", matrix_output[i][j]); 
        end
        $write("\n");
      end

      $display("-------------------------------------------------------");
      $display("%0t MODEL OUTPUT:", $time());
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < N; j++) begin
            $write("%p ", output_image_model[i][j]); 
            if (matrix_output[i][j] != output_image_model[i][j]) begin
              compare = 1;
            end
        end
        $write("\n");
      end
      $display("-------------------------------------------------------");

      if (compare) begin
        $display("%0t                   FAIL                             ", $time());
        $display("-------------------------------------------------------");
        $finish();
      end
      else begin 
        $display("%0t                   PASS                             ", $time());
        $display("-------------------------------------------------------");
      end
    end
  end

endmodule
