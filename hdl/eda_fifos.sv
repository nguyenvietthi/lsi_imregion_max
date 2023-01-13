`include "eda_global_define.svh"

module eda_fifos #(
  parameter M                = `CFG_M           ,
  parameter N                = `CFG_N           ,
  parameter PIXEL_WIDTH      = `CFG_PIXEL_WIDTH ,
  parameter WINDOW_WIDTH     = `CFG_WINDOW_WIDTH,
  parameter ADDR_WIDTH       = `CFG_ADDR_WIDTH  ,
  parameter I_WIDTH          = `CFG_I_WIDTH     ,
  parameter J_WIDTH          = `CFG_J_WIDTH     ,
  parameter FIFO_DEPTH       = `CFG_FIFO_DEPTH  ,
  parameter DATA_WIDTH       = `CFG_DATA_WIDTH   
)(
  input                                  clk             ,
  input                                  reset_n         ,
  input        [WINDOW_WIDTH - 2:0]      read_en         ,
  input        [WINDOW_WIDTH - 2:0]      push_positions  ,
  input        [ADDR_WIDTH - 1:0]        upleft_addr     ,
  input        [ADDR_WIDTH - 1:0]        up_addr         ,
  input        [ADDR_WIDTH - 1:0]        upright_addr    ,
  input        [ADDR_WIDTH - 1:0]        left_addr       ,
  input        [ADDR_WIDTH - 1:0]        right_addr      ,
  input        [ADDR_WIDTH - 1:0]        downleft_addr   ,
  input        [ADDR_WIDTH - 1:0]        down_addr       ,
  input        [ADDR_WIDTH - 1:0]        downright_addr  ,
  output       [WINDOW_WIDTH - 2:0]      fifo_empty      ,
  output       [ADDR_WIDTH - 1:0]        data_out         
);

//|----------|--------|-----------|
//| upleft/2 |   up/1 | upright/0 |
//|----------|--------|-----------|
//| left/4   | center |   right/3 |
//|----------|--------|-----------|
//|downleft/7| down/6 |downright/5|
//|----------|--------|-----------|

logic                    inv_clk;
logic                    upleft_read_en;
logic                    up_read_en;
logic                    upright_read_en;
logic                    left_read_en;
logic                    right_read_en;
logic                    downleft_read_en;
logic                    down_read_en;
logic                    downright_read_en;

logic                    upleft_empty;
logic                    up_empty;
logic                    upright_empty;
logic                    left_empty;
logic                    right_empty;
logic                    downleft_empty;
logic                    down_empty;
logic                    downright_empty;

logic                    upleft_push_position;
logic                    up_push_position;
logic                    upright_push_position;
logic                    left_push_position;
logic                    right_push_position;
logic                    downleft_push_position;
logic                    down_push_position;
logic                    downright_push_position;

logic [ADDR_WIDTH - 1:0] upleft_data_out;
logic [ADDR_WIDTH - 1:0] up_data_out;
logic [ADDR_WIDTH - 1:0] upright_data_out;
logic [ADDR_WIDTH - 1:0] left_data_out;
logic [ADDR_WIDTH - 1:0] right_data_out;
logic [ADDR_WIDTH - 1:0] downleft_data_out;
logic [ADDR_WIDTH - 1:0] down_data_out;
logic [ADDR_WIDTH - 1:0] downright_data_out;
logic [ADDR_WIDTH - 1:0] pre_data_out;

assign {upleft_read_en  , up_read_en  , upright_read_en  ,
        left_read_en    ,               right_read_en    ,
        downleft_read_en, down_read_en, downright_read_en } = read_en;

assign {upleft_push_position  , up_push_position  , upright_push_position  ,
        left_push_position    ,                     right_push_position    ,
        downleft_push_position, down_push_position, downright_push_position } = push_positions;

assign fifo_empty = {upleft_empty  , up_empty  , upright_empty  ,
                     left_empty    ,             right_empty    ,
                     downleft_empty, down_empty, downright_empty };

assign data_out = (!downright_empty) ? downright_data_out : 
                  (!down_empty     ) ? down_data_out      : 
                  (!downleft_empty ) ? downleft_data_out  :
                  (!right_empty    ) ? right_data_out     : 
                  (!left_empty     ) ? left_data_out      : 
                  (!upright_empty  ) ? upright_data_out   :
                  (!up_empty       ) ? up_data_out        : 
                  (!upleft_empty   ) ? upleft_data_out    : 
                                       pre_data_out        ;

always_comb begin : proc_pre_data_out
  pre_data_out = 0;
  if (downright_push_position) begin
    pre_data_out = downright_addr;
  end
  else if (down_push_position) begin
    pre_data_out = down_addr;
  end
  else if (downleft_push_position) begin
    pre_data_out = downleft_addr;
  end
  else if (right_push_position) begin
    pre_data_out = right_addr;
  end
  else if (left_push_position) begin
    pre_data_out = left_addr;
  end
  else if (upright_push_position) begin
    pre_data_out = upright_addr;
  end
  else if (up_push_position) begin
    pre_data_out = up_addr;
  end
  else if (upleft_push_position) begin
    pre_data_out = upleft_addr;
  end
end

assign inv_clk = (~clk);

sync_fifo #(
  .FIFO_DEPTH(FIFO_DEPTH                )    , // FIFO depth
  .DATA_WIDTH(DATA_WIDTH                )    , // Data width
  .ADDR_WIDTH($clog2(FIFO_DEPTH)        )      // Address width
) sync_fifo_upleft (
  .i_clk             (inv_clk                                  ), // Clock signal
  .i_rst_n           (reset_n                                  ), // Source domain asynchronous reset (active low)
  .i_valid_s         (upleft_push_position                     ), // Request write data into FIFO
  .i_almostfull_lvl  ($clog2(FIFO_DEPTH)'(FIFO_DEPTH-2)        ), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (upleft_addr                              ), // Push data in FIFO
  .i_ready_m         (upleft_read_en                           ), // Request read data from FIFO
  .i_almostempty_lvl ($clog2(FIFO_DEPTH)'('b10)                ), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (                                         ), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (                                         ), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (                                         ), // FIFO full flag
  .o_valid_m         (                                         ), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (                                         ), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (upleft_empty                             ), // FIFO empty flag
  .o_dataout         (upleft_data_out                          )  // Pop data from FIFO
);

sync_fifo #(
  .FIFO_DEPTH(FIFO_DEPTH                )    , // FIFO depth
  .DATA_WIDTH(DATA_WIDTH                )    , // Data width
  .ADDR_WIDTH($clog2(FIFO_DEPTH)        )      // Address width
) sync_fifo_up (
  .i_clk             (inv_clk                                  ), // Clock signal
  .i_rst_n           (reset_n                                  ), // Source domain asynchronous reset (active low)
  .i_valid_s         (up_push_position                         ), // Request write data into FIFO
  .i_almostfull_lvl  ($clog2(FIFO_DEPTH)'(FIFO_DEPTH-2)        ), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (up_addr                                  ), // Push data in FIFO
  .i_ready_m         (up_read_en                               ), // Request read data from FIFO
  .i_almostempty_lvl ($clog2(FIFO_DEPTH)'('b10)                ), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (                                         ), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (                                         ), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (                                         ), // FIFO full flag
  .o_valid_m         (                                         ), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (                                         ), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (up_empty                                 ), // FIFO empty flag
  .o_dataout         (up_data_out                              )  // Pop data from FIFO
);

sync_fifo #(
  .FIFO_DEPTH(FIFO_DEPTH                )    , // FIFO depth
  .DATA_WIDTH(DATA_WIDTH                )    , // Data width
  .ADDR_WIDTH($clog2(FIFO_DEPTH)        )      // Address width
) sync_fifo_upright (
  .i_clk             (inv_clk                                  ), // Clock signal
  .i_rst_n           (reset_n                                  ), // Source domain asynchronous reset (active low)
  .i_valid_s         (upright_push_position                    ), // Request write data into FIFO
  .i_almostfull_lvl  ($clog2(FIFO_DEPTH)'(FIFO_DEPTH-2)        ), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (upright_addr                             ), // Push data in FIFO
  .i_ready_m         (upright_read_en                          ), // Request read data from FIFO
  .i_almostempty_lvl ($clog2(FIFO_DEPTH)'('b10)                ), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (                                         ), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (                                         ), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (                                         ), // FIFO full flag
  .o_valid_m         (                                         ), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (                                         ), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (upright_empty                            ), // FIFO empty flag
  .o_dataout         (upright_data_out                         )  // Pop data from FIFO
);

sync_fifo #(
  .FIFO_DEPTH(FIFO_DEPTH                )    , // FIFO depth
  .DATA_WIDTH(DATA_WIDTH                )    , // Data width
  .ADDR_WIDTH($clog2(FIFO_DEPTH)        )      // Address width
) sync_fifo_left (
  .i_clk             (inv_clk                                  ), // Clock signal
  .i_rst_n           (reset_n                                  ), // Source domain asynchronous reset (active low)
  .i_valid_s         (left_push_position                       ), // Request write data into FIFO
  .i_almostfull_lvl  ($clog2(FIFO_DEPTH)'(FIFO_DEPTH-2)        ), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (left_addr                                ), // Push data in FIFO
  .i_ready_m         (left_read_en                             ), // Request read data from FIFO
  .i_almostempty_lvl ($clog2(FIFO_DEPTH)'('b10)                ), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (                                         ), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (                                         ), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (                                         ), // FIFO full flag
  .o_valid_m         (                                         ), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (                                         ), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (left_empty                               ), // FIFO empty flag
  .o_dataout         (left_data_out                            )  // Pop data from FIFO
);

sync_fifo #(
  .FIFO_DEPTH(FIFO_DEPTH                )    , // FIFO depth
  .DATA_WIDTH(DATA_WIDTH                )    , // Data width
  .ADDR_WIDTH($clog2(FIFO_DEPTH)        )      // Address width
) sync_fifo_right (
  .i_clk             (inv_clk                                  ), // Clock signal
  .i_rst_n           (reset_n                                  ), // Source domain asynchronous reset (active low)
  .i_valid_s         (right_push_position                      ), // Request write data into FIFO
  .i_almostfull_lvl  ($clog2(FIFO_DEPTH)'(FIFO_DEPTH-2)        ), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (right_addr                               ), // Push data in FIFO
  .i_ready_m         (right_read_en                            ), // Request read data from FIFO
  .i_almostempty_lvl ($clog2(FIFO_DEPTH)'('b10)                ), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (                                         ), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (                                         ), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (                                         ), // FIFO full flag
  .o_valid_m         (                                         ), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (                                         ), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (right_empty                              ), // FIFO empty flag
  .o_dataout         (right_data_out                           )  // Pop data from FIFO
);


sync_fifo #(
  .FIFO_DEPTH(FIFO_DEPTH                )    , // FIFO depth
  .DATA_WIDTH(DATA_WIDTH                )    , // Data width
  .ADDR_WIDTH($clog2(FIFO_DEPTH)        )      // Address width
) sync_fifo_downleft (
  .i_clk             (inv_clk                                  ), // Clock signal
  .i_rst_n           (reset_n                                  ), // Source domain asynchronous reset (active low)
  .i_valid_s         (downleft_push_position                   ), // Request write data into FIFO
  .i_almostfull_lvl  ($clog2(FIFO_DEPTH)'(FIFO_DEPTH-2)        ), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (downleft_addr                            ), // Push data in FIFO
  .i_ready_m         (downleft_read_en                         ), // Request read data from FIFO
  .i_almostempty_lvl ($clog2(FIFO_DEPTH)'('b10)                ), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (                                         ), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (                                         ), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (                                         ), // FIFO full flag
  .o_valid_m         (                                         ), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (                                         ), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (downleft_empty                           ), // FIFO empty flag
  .o_dataout         (downleft_data_out                        )  // Pop data from FIFO
);


sync_fifo #(
  .FIFO_DEPTH(FIFO_DEPTH                )    , // FIFO depth
  .DATA_WIDTH(DATA_WIDTH                )    , // Data width
  .ADDR_WIDTH($clog2(FIFO_DEPTH)        )      // Address width
) sync_fifo_down (
  .i_clk             (inv_clk                                  ), // Clock signal
  .i_rst_n           (reset_n                                  ), // Source domain asynchronous reset (active low)
  .i_valid_s         (down_push_position                       ), // Request write data into FIFO
  .i_almostfull_lvl  ($clog2(FIFO_DEPTH)'(FIFO_DEPTH-2)        ), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (down_addr                                ), // Push data in FIFO
  .i_ready_m         (down_read_en                             ), // Request read data from FIFO
  .i_almostempty_lvl ($clog2(FIFO_DEPTH)'('b10)                ), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (                                         ), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (                                         ), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (                                         ), // FIFO full flag
  .o_valid_m         (                                         ), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (                                         ), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (down_empty                               ), // FIFO empty flag
  .o_dataout         (down_data_out                            )  // Pop data from FIFO
);


sync_fifo #(
  .FIFO_DEPTH(FIFO_DEPTH                )    , // FIFO depth
  .DATA_WIDTH(DATA_WIDTH                )    , // Data width
  .ADDR_WIDTH($clog2(FIFO_DEPTH)        )      // Address width
) sync_fifo_downright (
  .i_clk             (inv_clk                                  ), // Clock signal
  .i_rst_n           (reset_n                                  ), // Source domain asynchronous reset (active low)
  .i_valid_s         (downright_push_position                  ), // Request write data into FIFO
  .i_almostfull_lvl  ($clog2(FIFO_DEPTH)'(FIFO_DEPTH-2)        ), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (downright_addr                           ), // Push data in FIFO
  .i_ready_m         (downright_read_en                        ), // Request read data from FIFO
  .i_almostempty_lvl ($clog2(FIFO_DEPTH)'('b10)                ), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (                                         ), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (                                         ), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (                                         ), // FIFO full flag
  .o_valid_m         (                                         ), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (                                         ), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (downright_empty                          ), // FIFO empty flag
  .o_dataout         (downright_data_out                       )  // Pop data from FIFO
);


endmodule : eda_fifos