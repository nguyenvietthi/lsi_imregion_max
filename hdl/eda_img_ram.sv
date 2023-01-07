module eda_img_ram #(
  parameter M                = 16                             ,
  parameter N                = 16                             ,
  parameter PIXEL_WIDTH      = 8                              ,
  parameter WINDOW_WIDTH     = 9                              ,
  parameter ADDR_WIDTH       = $clog2(M*N)                    ,
  parameter I_WIDTH          = $clog2(M)                      ,
  parameter J_WIDTH          = $clog2(M)                      
)(
  input                                           clk             ,
  input                                           reset_n         ,
  input                                           write_en        ,
  input        [ADDR_WIDTH - 1:0]                 wr_addr         ,
  input        [PIXEL_WIDTH- 1:0]                 pixel_in        ,
  input        [ADDR_WIDTH - 1:0]                 center_addr     , //{i, j}
  output       [PIXEL_WIDTH * WINDOW_WIDTH - 1:0] window_values   ,
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

  logic [PIXEL_WIDTH - 1:0] img_memory [I_WIDTH - 1:0] [J_WIDTH - 1:0];

  //|----------|--------|-----------|
  //| upleft   |   up   | upright   |
  //|----------|--------|-----------|
  //| left     | center |   right   |
  //|----------|--------|-----------|
  //| downleft | down   | downright |
  //|----------|--------|-----------|


  // Write pixel into memory
  logic [I_WIDTH - 1] i_pixel;
  logic [J_WIDTH - 1] j_pixel;

  assign i_pixel = wr_addr[I_WIDTH - 1:J_WIDTH];
  assign j_pixel = wr_addr[J_WIDTH - 1:0]      ;

  always_ff @(posedge clk or negedge reset_n) begin
    if(write_en) begin 
      img_memory[i_pixel][j_pixel] <= pixel_in;
    end
  end

  // Generate neighborhood address of center address
  logic [I_WIDTH - 1] i_center;
  logic [J_WIDTH - 1] j_center;

  assign i_center = center_addr[I_WIDTH - 1:J_WIDTH];
  assign j_center = center_addr[J_WIDTH - 1:0]      ;

  assign upleft_addr    = {i_center - 1, j_center - 1};
  assign up_addr        = {i_center - 1, j_center    };
  assign upright_addr   = {i_center - 1, j_center + 1};
  assign left_addr      = {i_center    , j_center - 1};
  assign right_addr     = {i_center    , j_center + 1};
  assign downleft_addr  = {i_center + 1, j_center - 1};
  assign down_addr      = {i_center + 1, j_center    };
  assign downright_addr = {i_center + 1, j_center + 1};

  // assign neigh_addr = {upleft_addr, up_addr, upright_addr, left_addr, right_addr, downleft_addr, down_addr, downright_addr};

  // Assign window values
  assign window_values = {img_memory[i_center - 1][j_center - 1], img_memory[i_center - 1][j_center    ], img_memory[i_center - 1][j_center + 1], 
                          img_memory[i_center    ][j_center - 1], img_memory[i_center    ][j_center ], img_memory[i_center    ][j_center + 1], 
                          img_memory[i_center + 1][j_center - 1], img_memory[i_center + 1][j_center    ], img_memory[i_center + 1][j_center + 1]}

  // Generate neighborhood address valid
  always_comb begin
    if(i_center == 0) begin 
      if(j_center == 0) begin 
        neigh_addr_valid = 8'b00001011;
      end else if(j_center == M - 1) begin 
        neigh_addr_valid = 8'b00010110;
      end else begin 
        neigh_addr_valid = 8'b00011111;
      end
    end else if(i_center == N - 1) begin 
      if(j_center == 0) begin 
        neigh_addr_valid = 8'b01101000;
      end else if(j_center == M - 1) begin 
        neigh_addr_valid = 8'b11010000;
      end else begin 
        neigh_addr_valid = 8'b11111000;
      end
    end else if(j_center == 0) begin 
      neigh_addr_valid = 8'b01101011;
    end else if(j_center == M - 1) begin 
      neigh_addr_valid = 8'b11010110;
    end else begin 
      neigh_addr_valid = 8'b11111111;
    end
  end

endmodule