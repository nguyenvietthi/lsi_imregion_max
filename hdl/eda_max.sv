module eda_max #(
  parameter PIXEL_WIDTH = 8
)(
  input        [PIXEL_WIDTH - 1:0] a  , 
  input        [PIXEL_WIDTH - 1:0] b  , 
  output logic [PIXEL_WIDTH - 1:0] out
);

  always_comb begin
    if (a > b)
      out = a;
    else
      out = b;
  end
endmodule