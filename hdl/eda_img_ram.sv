`include "eda_global_define.svh"

module eda_img_ram #(
  parameter M                = `CFG_M                         ,
  parameter N                = `CFG_N                         ,
  parameter PIXEL_WIDTH      = `CFG_PIXEL_WIDTH               ,
  parameter WINDOW_WIDTH     = `CFG_WINDOW_WIDTH              ,
  parameter ADDR_WIDTH       = `CFG_ADDR_WIDTH                ,
  parameter I_WIDTH          = `CFG_I_WIDTH                   ,
  parameter J_WIDTH          = `CFG_J_WIDTH                    
)(
  input                                           clk             ,
  input                                           reset_n         ,
  input                                           write_en        ,
  input        [ADDR_WIDTH - 1:0]                 wr_addr         ,
  input        [PIXEL_WIDTH- 1:0]                 pixel_in        ,
  input        [ADDR_WIDTH - 1:0]                 center_addr     , //{i, j}
  output logic [PIXEL_WIDTH * WINDOW_WIDTH - 1:0] window_values   ,
  output logic [WINDOW_WIDTH - 2:0]               neigh_addr_valid,
  output       [ADDR_WIDTH - 1:0]                 upleft_addr     ,
  output       [ADDR_WIDTH - 1:0]                 up_addr         ,
  output       [ADDR_WIDTH - 1:0]                 upright_addr    ,
  output       [ADDR_WIDTH - 1:0]                 left_addr       ,
  output       [ADDR_WIDTH - 1:0]                 right_addr      ,
  output       [ADDR_WIDTH - 1:0]                 downleft_addr   ,
  output       [ADDR_WIDTH - 1:0]                 down_addr       ,
  output       [ADDR_WIDTH - 1:0]                 downright_addr   
);

  logic [M - 1:0][N - 1:0][PIXEL_WIDTH - 1:0] img_memory;

  //|----------|--------|-----------|
  //| upleft   |   up   | upright   |
  //|----------|--------|-----------|
  //| left     | center |   right   |
  //|----------|--------|-----------|
  //| downleft | down   | downright |
  //|----------|--------|-----------|


  // Write pixel into memory
  logic [I_WIDTH - 1:0] i_pixel;
  logic [J_WIDTH - 1:0] j_pixel;

  assign i_pixel = wr_addr[ADDR_WIDTH - 1:J_WIDTH];
  assign j_pixel = wr_addr[J_WIDTH - 1:0]         ;

  always_ff @(posedge clk or negedge reset_n) begin
    if(write_en) begin 
      img_memory[i_pixel][j_pixel] <= pixel_in;
    end
  end

  // Generate neighborhood address of center address
  logic [I_WIDTH - 1:0] i_center;
  logic [J_WIDTH - 1:0] j_center;

  logic [I_WIDTH - 1:0] i_center_minus;
  logic [I_WIDTH - 1:0] i_center_plus ;
  logic [J_WIDTH - 1:0] j_center_plus ;
  logic [J_WIDTH - 1:0] j_center_minus;

  assign i_center = center_addr[ADDR_WIDTH - 1:J_WIDTH];
  assign j_center = center_addr[J_WIDTH - 1:0]         ;

  assign i_center_minus = i_center - 1;
  assign i_center_plus  = i_center + 1;
  assign j_center_plus  = j_center + 1;
  assign j_center_minus = j_center - 1;

  assign upleft_addr    = {i_center_minus, j_center_minus};
  assign up_addr        = {i_center_minus, j_center      };
  assign upright_addr   = {i_center_minus, j_center_plus };
  assign left_addr      = {i_center      , j_center_minus};
  assign right_addr     = {i_center      , j_center_plus };
  assign downleft_addr  = {i_center_plus , j_center_minus};
  assign down_addr      = {i_center_plus , j_center      };
  assign downright_addr = {i_center_plus , j_center_plus };

  // assign neigh_addr = {upleft_addr, up_addr, upright_addr, left_addr, right_addr, downleft_addr, down_addr, downright_addr};

  // Generate neighborhood address valid
  always_comb begin
    if(i_center == 0) begin 
      if(j_center == 0) begin 
        neigh_addr_valid = 8'b00001011;
      end else if(j_center == N - 1) begin 
        neigh_addr_valid = 8'b00010110;
      end else begin 
        neigh_addr_valid = 8'b00011111;
      end
    end else if(i_center == M - 1) begin 
      if(j_center == 0) begin 
        neigh_addr_valid = 8'b01101000;
      end else if(j_center == N - 1) begin 
        neigh_addr_valid = 8'b11010000;
      end else begin 
        neigh_addr_valid = 8'b11111000;
      end
    end else if(j_center == 0) begin 
      neigh_addr_valid = 8'b01101011;
    end else if(j_center == N - 1) begin 
      neigh_addr_valid = 8'b11010110;
    end else begin 
      neigh_addr_valid = 8'b11111111;
    end
  end

  // Assign window values
  logic  [PIXEL_WIDTH * WINDOW_WIDTH - 1:0] window_values_real;
  logic  [WINDOW_WIDTH :0]                  addr_valid        ;

  assign addr_valid = {neigh_addr_valid[7:4], 1'b1, neigh_addr_valid[3:0]};
  assign window_values_real = {img_memory[i_center_minus][j_center_minus], img_memory[i_center_minus][j_center    ], img_memory[i_center_minus][j_center_plus], 
                               img_memory[i_center      ][j_center_minus], img_memory[i_center      ][j_center    ], img_memory[i_center      ][j_center_plus], 
                               img_memory[i_center_plus ][j_center_minus], img_memory[i_center_plus ][j_center    ], img_memory[i_center_plus ][j_center_plus]};
  generate
    for (genvar i = 0; i < WINDOW_WIDTH; i++) begin
      always_comb begin 
        if(addr_valid[i]) begin 
          window_values[i * PIXEL_WIDTH + 7 -: 8] = window_values_real[i * PIXEL_WIDTH + 7 -: 8];
        end else begin 
          window_values[i * PIXEL_WIDTH + 7 -: 8] = 0;
        end
      end
    end
  endgenerate
endmodule