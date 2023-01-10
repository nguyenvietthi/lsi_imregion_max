`include "eda_global_define.svh"

module eda_one_hot_to_bin #(
  parameter ONE_HOT_WIDTH = `CFG_N      ,
  parameter BIN_WIDTH     = `CFG_J_WIDTH 
)
(
  input        [ONE_HOT_WIDTH - 1:0] one_hot_code, // One-hot code
  output logic [BIN_WIDTH - 1:0]     bin_code      // Binary code
);

  always_comb begin
    bin_code = 0;
    for (int i = ONE_HOT_WIDTH - 1; i >= 0; i--) begin
      if (one_hot_code[i]) begin
        bin_code = i;
      end
    end
  end

endmodule