`include "eda_global_define.svh"

module eda_controller #(
  // synopsys template
  parameter PIXEL_WIDTH  = `CFG_PIXEL_WIDTH,
  parameter WINDOW_WIDTH = `CFG_WINDOW_WIDTH,
  parameter ADDR_WIDTH   = `CFG_ADDR_WIDTH,
  parameter I_WIDTH      = `CFG_I_WIDTH,
  parameter J_WIDTH      = `CFG_J_WIDTH
)
( 
  // Port Declarations
  input   wire                        clk,              // Clock signal
  input   wire                        reset_n,          // Asynchronous reset, active LOW
  input   wire                        start,            // Start
  input   wire                        iterated_all,     // Check if all pixels have been iterated
  input   wire    [WINDOW_WIDTH-2:0]  fifo_empty,       // FIFO empty
  input   wire    [WINDOW_WIDTH-2:0]  push_positions,   // Positions need to push to FIFO
  input   wire    [ADDR_WIDTH-1:0]    data_out,         // Data out from FIFO
  input   wire    [I_WIDTH - 1:0]     next_row,         // Next row
  input   wire    [J_WIDTH - 1:0]     next_col,         // Next column
  output  reg                         new_pixel,        // Iterate new pixel
  output  wire    [WINDOW_WIDTH-2:0]  read_en,          // Read FIOFO enable
  output  reg                         clear,            // Clear all RAMs
  output  reg     [ADDR_WIDTH-1:0]    center_addr,      // Center address
  output  reg     [ADDR_WIDTH-1:0]    pre_center_addr, 
  output  reg                         update_strb,      // Clear strobe
  output  reg                         done              // Done for an image
);


// Internal Declarations


// Module Declarations
wire check_next;  // Check when can jump to {next_row, next_col}
reg update_addr;  // Update address
reg extend_addr;  
wire [WINDOW_WIDTH-2:0] rev_fifo_empty;  
wire [WINDOW_WIDTH-2:0] rev_read_en;  

// State encoding
parameter 
          ST_IDLE   = 3'd0,
          ST_START  = 3'd1,
          ST_NEXT   = 3'd2,
          ST_DONE   = 3'd3,
          ST_EXTEND = 3'd4;

reg [2:0] current_state, next_state;

//-----------------------------------------------------------------
// Next State Block for machine csm
//-----------------------------------------------------------------
always @(
  check_next, 
  current_state, 
  iterated_all, 
  start
)
begin : next_state_block_proc
  if (iterated_all) begin
    next_state = ST_DONE;
  end
  else begin
    case (current_state) 
      ST_IDLE: begin
        if (start)
          next_state = ST_START;
        else
          next_state = ST_IDLE;
      end
      ST_START: begin
        if (check_next)
          next_state = ST_NEXT;
        else
          next_state = ST_EXTEND;
      end
      ST_NEXT: begin
        if (!check_next)
          next_state = ST_EXTEND;
        else
          next_state = ST_START;
      end
      ST_DONE: begin
        if (start)
          next_state = ST_START;
        else
          next_state = ST_DONE;
      end
      ST_EXTEND: begin
        if (check_next)
          next_state = ST_NEXT;
        else
          next_state = ST_START;
      end
      default: 
        next_state = ST_IDLE;
    endcase
  end
end // Next State Block

//-----------------------------------------------------------------
// Output Block for machine csm
//-----------------------------------------------------------------
always @(
  check_next, 
  current_state, 
  done, 
  iterated_all
)
begin : output_block_proc
  // Default Assignment
  new_pixel = 0;
  clear = 0;
  update_strb = 0;
  done = 0;
  // Default Assignment To Internals
  update_addr = 0;
  extend_addr = 0;

  // Interrupts
  if (iterated_all) 
    clear = 1;
  else begin

    // Combined Actions
    case (current_state) 
      ST_START: begin
        if (check_next) begin
          new_pixel = (!done);
          update_addr = 1;
          update_strb = 1;
        end
        else begin
          new_pixel = (!done);
          extend_addr = 1;
        end
      end
      ST_NEXT: begin
        new_pixel = (!done);
        update_addr = 1;
        update_strb = 1;
        if (!check_next) begin
          extend_addr = 1;
          new_pixel = (!done);
          update_strb = 0;
          update_addr = 0;
        end
      end
      ST_DONE: begin
        done = 1;
        clear = 0;
      end
      ST_EXTEND: begin
        new_pixel = (!done);
        extend_addr = 1;
        if (check_next) begin
          extend_addr = 0;
          new_pixel = (!done);
          update_strb = 1;
          update_addr = 1;
        end
      end
    endcase
  end
end // Output Block

//-----------------------------------------------------------------
// Clocked Block for machine csm
//-----------------------------------------------------------------
always @(
  posedge clk, 
  negedge reset_n
) 
begin : clocked_block_proc
  if (!reset_n) begin
    current_state <= ST_IDLE;
  end
  else 
  begin
    current_state <= next_state;
  end
end // Clocked Block

// Concurrent Statements
// pre_center_addr
always @(*) begin : proc_pre_center_addr
  pre_center_addr = 0;
  if (extend_addr) begin
    pre_center_addr = data_out;
  end
  else if (update_addr) begin
    pre_center_addr = {next_row, next_col};
  end
end

// center_addr
always @(posedge clk or negedge reset_n) begin : proc_center_addr
  if(~reset_n) begin
    center_addr <= 0;
  end else begin
    center_addr <= pre_center_addr;
  end
end

// rev_fifo_empty
genvar i;
generate
  for (i = 0; i < WINDOW_WIDTH - 1; i = i + 1) begin
    assign rev_fifo_empty[i] = fifo_empty[WINDOW_WIDTH-2-i];
  end
endgenerate

// rev_read_en
assign rev_read_en = ((rev_fifo_empty + 1) & (~rev_fifo_empty));

// read_en
generate
  for (i = 0; i < WINDOW_WIDTH - 1; i = i + 1) begin
    assign read_en[i] = rev_read_en[WINDOW_WIDTH-2-i];
  end
endgenerate

// check_next
assign check_next = ((push_positions == 0) & (fifo_empty == {(WINDOW_WIDTH-1){1'b1}}));
endmodule // eda_controller
