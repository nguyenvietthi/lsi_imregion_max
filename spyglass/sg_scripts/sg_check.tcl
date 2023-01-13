############### TOP Module Name ############################################
set TOP_MODULE  eda_regional_max
set PROJECT_DIR  /data5/workspace/thinv0/lsi_design/lsi_imregion_max/

############### Create New Project #########################################

new_project  ${TOP_MODULE} -force
save_project

############### Read Design ################################################
############### Set Include Directory ######################################
#set_option define SPYGLASS
remove_option incdir
set_option incdir $PROJECT_DIR/inc

source ./sg_scripts/read_design.tcl
set_option mthresh 32768



############### Read Design ################################################
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/dti_umc40_phy_lib/hdl/library_umc/dti_umc40ulp_lp4_comp.v
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/dti_umc40_phy_lib/hdl/library_umc/dti_umc40ulp_lp4_ref_jsn.v
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/dti_umc40_phy_lib/hdl/library_umc/dti_umc40ulp_lp4_testpad.v
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/dti_umc40_phy_lib/hdl/dti_umc40ulp_lp4r1_dq8_jm.v
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/dti_umc40_phy_lib/hdl/dti_umc40ulp_lp4_ctl10s1ckr1_jm.v
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/dti_umc40_phy_lib/hdl/dti_umc40ulp_lp4_ctl19s2ckr1_jm.v

#read_file -type verilog  $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/hdl/mxtk_clkinv2.v
#read_file -type verilog  $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/hdl/mxtk_scanmux.v
#read_file -type verilog  $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/hdl/mxtk_rst_and.v
#read_file -type gateslib $PROJECT_DIR/syn/lib_files/dti_umc40ulp_lp4r1_dq8_jm_worstn40c_pvt18.lib
#read_file -type gateslib $PROJECT_DIR/syn/lib_files/dti_umc40ulp_lp4_ctl10s1ckr1_jm_worstn40c_pvt18.lib
#read_file -type gateslib $PROJECT_DIR/syn/lib_files/dti_umc40ulp_lp4_comp_worstn40c_pvt18.lib
#read_file -type gateslib $PROJECT_DIR/syn/lib_files/dti_umc40ulp_lp4_testpad_worstn40c_pvt18.lib

# if release
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/hdl/library_umc/dti_umc40ulp_lp4_comp.v
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/hdl/library_umc/dti_umc40ulp_lp4_ref_jsn.v
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/hdl/library_umc/dti_umc40ulp_lp4_testpad.v
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/hdl/dti_umc40ulp_lp4r1_dq8_jm.v
#read_file -type verilog $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/hdl/dti_umc40ulp_lp4_ctl19s2ckr1_jm.v

#set_option stop dti_umc40ulp_lp4_comp
#set_option stop dti_umc40ulp_lp4_ref_jsn
#set_option stop dti_umc40ulp_lp4_testpad
#set_option stop dti_umc40ulp_lp4r1_dq8_jm
#set_option stop dti_umc40ulp_lp4_ctl10s1ckr1_jm

#read_file -type verilog $PROJECT_DIR/libs/dti_mem/hdl/dti_2pr_tm40ulvt_328x64_2ww1x_hc.v
#set_option stop dti_2pr_tm40ulvt_328x64_2ww1x_hc
#read_file -type gateslib $PROJECT_DIR/syn/lib_files/dti_2pr_tm40ulvt_328x64_2ww1x_hc_worstn40c.lib
#set_option stop dti_2pr_tm40ulvt_328x64_2ww1x_hc

#read_file -type gateslib $PROJECT_DIR/syn/lib_files/dti_2pr_tm40ulvt_328x72_2ww1x_hc_worstn40c.lib
#set_option stop dti_2pr_tm40ulvt_328x72_2ww1x_hc

#read_file -type verilog $PROJECT_DIR/libs/dti_mem/hdl/dti_2pr_tm40ulvt_328x72_2ww1x_hc.v
#set_option stop dti_2pr_tm40ulvt_328x72_2ww1x_hc

#read_file -type verilog $PROJECT_DIR/obf/vcs_verilog/port_bridge.v
#set_option stop stop	port_bridge

############### Read Constraints ###########################################
#read_file -type sgdc ./waiver/tconstraints.sgdc

############### Read Waivers ###############################################
#read_file -type waiver  ./waiver/dynamo_accept.swl
#read_file -type waiver  ./waiver/dynamo_warning.swl
#read_file -type waiver  ./waiver/dynamo_MatchWidthOnArithExpr.swl
#read_file -type waiver  ./waiver/dynamo_RelOpSize.swl

#read_file -type awl  ./waiver/${TOP_MODULE}.awl

############### Set Top Module #############################################
set_option top $TOP_MODULE

############### Set Option ###############################################
set_option enableSV yes
set_option define_cell_sim_depth 15
set_option allow_module_override yes
set_option auto_save yes

current_methodology $PROJECT_DIR/spyglass/Methodology/

#set_option incdir $PROJECT_DIR/libs/dti_umc40_phy_lpddr4/include
############### Set Black-Box ##############################################

############### Check Syntax During Read Design ############################
#set_goal_option -rules NonSynthRepeat-ML
current_goal Design_Read -top $TOP_MODULE
link_design -force

############### Check LINT #################################################
#current_goal lint/lint_rtl -top $TOP_MODULE
#run_goal
#current_goal lint/lint_turbo_rtl -top $TOP_MODULE
#run_goal
#current_goal lint/lint_functional_rtl -top $TOP_MODULE
#run_goal
#current_goal lint/lint_abstract -top $TOP_MODULE
#run_goal

###################customer's rule####################
#define_goal full_lint $PROJECT_DIR/spyglass/full_lint.spq
#current_goal full_lint -top $TOP_MODULE
#run_goal

define_goal new_full_lint new_full_lint.spq
current_goal new_full_lint -top $TOP_MODULE
run_goal

#define_goal full_lint_beh_models full_lint_beh_models.spq
#current_goal full_lint_beh_models -top $TOP_MODULE
#run_goal
##
#define_goal empty empty.spq
#current_goal empty -top $TOP_MODULE
#run_goal
##
#define_goal partial_lint partial_lint.spq
#current_goal partial_lint -top $TOP_MODULE
#run_goal


################ Check CDC ##################################################
#current_goal cdc/cdc_setup_check -top $TOP_MODULE
#run_goal
#current_goal cdc/clock_reset_integrity -top $TOP_MODULE
#run_goal
#current_goal cdc/cdc_verify_struct -top $TOP_MODULE
#run_goal
#current_goal cdc/cdc_verify -top $TOP_MODULE
#run_goal
#current_goal cdc/cdc_abstract -top $TOP_MODULE
#run_goal

############### Finish #####################################################
#write_aggregate_report html
save_project
exit
