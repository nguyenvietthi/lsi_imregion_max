module eda_img_ram #(
  parameter M                = 16                             ,
  parameter N                = 16                             ,
  parameter PIXEL_WIDTH      = 8                              ,
  parameter WINDOW_WIDTH     = 9                              ,
  parameter ADDR_WIDTH       = $clog2(M*N)                    ,
  parameter NEIGH_ADDR_WIDTH = ADDR_WIDTH * (WINDOW_WIDTH - 1)
)(
  input                                     clk             ,
  input                                     reset_n         ,
  input                                     write_en        ,
  input  [ADDR_WIDTH - 1:0]                 wr_addr         ,
  input  [PIXEL_WIDTH- 1:0]                 pixel_in        ,
  input  [ADDR_WIDTH - 1:0]                 center_addr     ,
  output [PIXEL_WIDTH * WINDOW_WIDTH - 1:0] window_values   ,
  output [WINDOW_WIDTH - 1:0]               neigh_addr_valid,
  output [NEIGH_ADDR_WIDTH - 1:0]           neigh_addr       
);

  logic [PIXEL_WIDTH - 1:0] img_memory [ADDR_WIDTH - 1:0];

  //|----------|--------|-----------|
  //| upleft   |   up   | upright   |
  //|----------|--------|-----------|
  //| left     | center |   right   |
  //|----------|--------|-----------|
  //| downleft | down   | downright |
  //|----------|--------|-----------|

  logic upleft_addr   ;
  logic up_addr       ;
  logic upright_addr  ;
  logic left_addr     ;
  logic right_addr    ;
  logic downleft_addr ;
  logic down_addr     ;
  logic downright_addr;

  // Write pixel into memory
  always_ff @(posedge clk or negedge reset_n) begin
    if(write_en) begin 
      img_memory[wr_addr] <= pixel_in;
    end
  end

  // Generate neighborhood address of center address
  assign upleft_addr    = center_addr - M - 1;
  assign up_addr        = center_addr - M    ;
  assign upright_addr   = center_addr - M + 1; 
  assign left_addr      = center_addr - 1    ;
  assign right_addr     = center_addr     + 1;
  assign downleft_addr  = center_addr + M - 1; 
  assign down_addr      = center_addr + M    ;
  assign downright_addr = center_addr + M + 1;

  assign neigh_addr = {upleft_addr, up_addr, upright_addr, left_addr, right_addr, downleft_addr, down_addr, downright_addr};

  // Assign window values

  assign window_values = {img_memory[upleft_addr], img_memory[up_addr], img_memory[upright_addr],
                          img_memory[left_addr], img_memory[center_addr], img_memory[right_addr], 
                          img_memory[downleft_addr], img_memory[down_addr], img_memory[downright_addr]};



endmodule