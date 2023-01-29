# 26th LSI Design Contests - eda_regional_maxima
This is our submission for 26th LSI Contest. The goal is to design the hardware for the Regional Maxima algorithm. </br>
In this submission, we have proposed an innovative algorithm based on the original algorithm to improve the restrictions </br>
of the original algorithm mentioned in our document and design the hardware based on that proposed algorithm.

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
# How to run software simulation by python3 (new proposed algorithm)
1. Go to directory **software** at the terminal
2. Run the following commands at the terminal
```sh
$ python3 test.py
```
3. The results are located in **software/result**

# How to run hardware simulation by Questasim/Modelsim
1. Go to directory **sim/tb** at the terminal
2. Open gen_random_matrix.py, config the parameters: m - height of image, n - width of image, pixel_width, file_num - number of testcases
3. Run the following commands at the terminal
```sh
$ python3 gen_random_matrix.py
$ source ../script/qrun_bash
$ vlb;vlg;vsm
```
or simulate on GUI of Questasim/Modelsim

# How to view hardware simulation results by Questasim/Modelsim
1. After simulating as above section, standing at directory **sim/tb** and run the following command at the terminal
```sh
$ vsim -view vsim.wlf -do wave.do
```
2. File vsim.log at directory sim/tb is the result that used to be compared to model's result
