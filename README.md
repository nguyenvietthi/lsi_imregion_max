# lsi_imregion_max
26th LSI Design Contests

# Directory layout
```bash
.
├───doc             # Design specs
├───hdl             # HDL code
├───inc             # Include file which declares all constants
├───libs
│   └───sync_fifo   # Synchronous FIFO code
|───sim             # Simulation files
│    ├───tb         # Top testbench
│    ├───libs       # Model which is used to check outputs of design
│    └───script     # Scripts for simulation
└───syn             # Synthesis folder
    ├───report      # Report after synthesis
    ├───result      # Result after synthesis
    └───dc_scripts  # Scripts for synthesis
```
# How to simulate by Questasim/Modelsim
1. Go to directory sim/tb
2. Open gen_random_matrix.py, config the parameters: m - height of image, n - width of image, pixel_width, file_num - number of testcases
3. Run the following commands
```sh
$ python3 gen_random_matrix.py
$ source ../qrun_bash
$ vlb;vlg;vsm
```
or simulate on GUI of Questasim/Modelsim

# How to view results by Questasim/Modelsim
1. After simulating as above section, standing at directory sim/tb and run the following commands
```sh
$ vsim -view vsim.wlf -do wave.do
```
2. File vsim.log at directory sim/tb is the result that used to be compared to model's result
