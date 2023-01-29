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
|    ├───work       # Where to run simulation
│    └───script     # Scripts for simulation
└───syn             # Synthesis folder
    ├───report      # Report after synthesis
    ├───result      # Result after synthesis
    └───dc_scripts  # Scripts for synthesis
```
# How to simulate by Questasim/Modelsim
1. Go to directory sim/work
2. Open gen_random_matrix.py, config the parameters: m - height of image, n - width of image, pixel_width, file_num - number of testcase
3. Run the following commands
```sh
$ source ../qrun_bash
$ vlb;vlg;vsm
```
or simulate on GUI of Questasim/Modelsim
