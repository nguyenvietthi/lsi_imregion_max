module eda_regional_max #(
  parameter M                = 6                             ,
  parameter N                = 6                             ,
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
  input        [ADDR_WIDTH - 1:0]                 center_addr     ,
  input                                           new_pixel       ,
  input                                           clear           
);
  
  logic [PIXEL_WIDTH * WINDOW_WIDTH - 1:0] window_values   ;
  logic [WINDOW_WIDTH - 2:0]               neigh_addr_valid;
  logic [ADDR_WIDTH - 1:0]                 upleft_addr     ;
  logic [ADDR_WIDTH - 1:0]                 up_addr         ;
  logic [ADDR_WIDTH - 1:0]                 upright_addr    ;
  logic [ADDR_WIDTH - 1:0]                 left_addr       ;
  logic [ADDR_WIDTH - 1:0]                 right_addr      ;
  logic [ADDR_WIDTH - 1:0]                 downleft_addr   ;
  logic [ADDR_WIDTH - 1:0]                 down_addr       ;
  logic [ADDR_WIDTH - 1:0]                 downright_addr  ;
  logic [WINDOW_WIDTH - 2:0]               iterated_idx    ;
  logic                                    compare_out     ;
  logic [WINDOW_WIDTH - 2:0]               equal_positions ;
  logic [WINDOW_WIDTH - 2:0]               push_positions  ;

  eda_img_ram #(
    .M            (M           ),
    .N            (N           ),
    .PIXEL_WIDTH  (PIXEL_WIDTH ),
    .WINDOW_WIDTH (WINDOW_WIDTH),
    .ADDR_WIDTH   (ADDR_WIDTH  ),
    .I_WIDTH      (I_WIDTH     ),
    .J_WIDTH      (J_WIDTH     )
  ) eda_img_ram_inst (
    .clk             (clk             ),
    .reset_n         (reset_n         ),
    .write_en        (write_en        ),
    .wr_addr         (wr_addr         ),
    .pixel_in        (pixel_in        ),
    .center_addr     (center_addr     ),
    .window_values   (window_values   ),
    .neigh_addr_valid(neigh_addr_valid),
    .upleft_addr     (upleft_addr     ),
    .up_addr         (up_addr         ),
    .upright_addr    (upright_addr    ),
    .left_addr       (left_addr       ),
    .right_addr      (right_addr      ),
    .downleft_addr   (downleft_addr   ),
    .down_addr       (down_addr       ),
    .downright_addr  (downright_addr  )
  );

  eda_compare #(
    .M           (M           ),
    .N           (N           ),
    .PIXEL_WIDTH (PIXEL_WIDTH ),
    .WINDOW_WIDTH(WINDOW_WIDTH),
    .ADDR_WIDTH  (ADDR_WIDTH  )
  ) eda_compare_inst (
    .clk             (clk             ),
    .reset_n         (reset_n         ),
    .new_pixel       (new_pixel       ),
    .window_values   (window_values   ),
    .neigh_addr_valid(neigh_addr_valid),
    .iterated_idx    (iterated_idx    ),
    .compare_out     (compare_out     ),
    .push_positions  (push_positions  )
  );

  eda_iterated_ram #(
    .M           (M           ),
    .N           (N           ),
    .WINDOW_WIDTH(WINDOW_WIDTH),
    .ADDR_WIDTH  (ADDR_WIDTH  ),
    .I_WIDTH     (I_WIDTH     ),
    .J_WIDTH     (J_WIDTH     )
  ) eda_iterated_ram_inst(
    .clk            (clk            ),
    .reset_n        (reset_n        ),
    .clear          (clear          ),
    .new_pixel      (new_pixel      ),
    .center_addr    (center_addr    ),
    .upleft_addr    (upleft_addr    ),
    .up_addr        (up_addr        ),
    .upright_addr   (upright_addr   ),
    .left_addr      (left_addr      ),
    .right_addr     (right_addr     ),
    .downleft_addr  (downleft_addr  ),
    .down_addr      (down_addr      ),
    .downright_addr (downright_addr ),
    .push_positions (push_positions ),
    .iterated_idx   (iterated_idx   )
  );
endmodule