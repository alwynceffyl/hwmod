ifndef SIM_MK
SIM_MK=1

################################################################################
#                          QESTA/MODELSIM                                      #
################################################################################

VSIM_ARGS= -nowlflock -msgmode both
SIM_TIME = -all
TIME_RESOLUTION = 1ps

ifdef WAVE_FILE
	WAVE_OPT_ARG += do $(WAVE_FILE);
endif

sim_gui: compile
	vsim -do "vsim $(TB) $(VSIM_ARGS) $(VSIM_USER_ARGS) -onfinish stop;$(WAVE_OPT_ARG)run $(SIM_TIME)"


sim: compile
	vsim -c -do "vsim $(TB) $(VSIM_ARGS) $(VSIM_USER_ARGS); run $(SIM_TIME);quit"


.PHONY: sim_gui
.PHONY: sim

################################################################################
#                             GHDL                                             #
################################################################################

ifdef GHDL_WAVE_OPT
	GHDL_WAVE_OPT_ARG += --read-wave-opt=$(GHDL_WAVE_OPT)
endif

ifdef GHDL_USE_ALTERA_LIB
GHDL_ALTERA_LIB_ARGS=--ieee=synopsys -P=vendor_libs
endif

gsim: gcompile
	ghdl elab-run --std=08 -frelaxed $(GHDL_ALTERA_LIB_ARGS) $(TB) $(GHDL_USER_ARGS)

gsim_gui: gcompile
	ghdl elab-run --std=08 -frelaxed $(GHDL_ALTERA_LIB_ARGS) $(TB) $(GHDL_USER_ARGS) $(GHDL_WAVE_OPT_ARG) --wave=$(TB).dump.ghw
	gtkwave $(TB).dump.ghw $(GTK_WAVE_FILE)


.PHONY: gsim gsim_gui

################################################################################
#                             HELP TEXT                                        #
################################################################################

current_dir := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))
include $(current_dir)/common.mk

SIM_HELP += $(HELP_SEP_LINE)
SIM_HELP += "Provides targets for simulation. Requires ${VAR_COL}TB${NO_COL} and ${VAR_COL}VHDL_FILES${NO_COL} to be set\n"
SIM_HELP += '***\n'
SIM_HELP += "${TARGET_COL}sim${NO_COL}:${HELP_SPACE}Runs testbench ${VAR_COL}TB${NO_COL} using Modelsim (without GUI)\n"
SIM_HELP += "${TARGET_COL}sim_gui${NO_COL}:${HELP_SPACE}Runs testbench ${VAR_COL}TB${NO_COL} using Modelsim (with GUI)\n"
SIM_HELP += "${HELP_SPACE}Optional: ${VAR_COL}WAVE_FILE${NO_COL}\n"
SIM_HELP += "${TARGET_COL}gsim${NO_COL}:${HELP_SPACE}Runs testbench ${VAR_COL}TB${NO_COL} using GHDL\n"
SIM_HELP += "${TARGET_COL}gsim_gui${NO_COL}:${HELP_SPACE}Runs testbench ${VAR_COL}TB${NO_COL} using GHDL as back- and GTKWave as frontend\n"
SIM_HELP += "${HELP_SPACE}Optional: ${VAR_COL}GHDL_WAVE_OPT${NO_COL}, ${VAR_COL}GTK_WAVE_FILE${NO_COL}\n"
SIM_HELP += '***\n'
SIM_HELP += "${VAR_COL}TB${NO_COL}${HELP_SPACE}Name of the testbench to be simulated\n"
SIM_HELP += "${VAR_COL}VHDL_FILES${NO_COL}${HELP_SPACE}Design and testbench files required for the simulation.\n"
SIM_HELP += "${HELP_SPACE}Note that the order of ${VAR_COL}VHDL_FILES${NO_COL} gives the compilation order!\n"
SIM_HELP += "${VAR_COL}WAVE_FILE${NO_COL}${HELP_SPACE}A .do file specifying the desired QuestaSim layout\n"
SIM_HELP += "${VAR_COL}GTK_WAVE_FILE${NO_COL}${HELP_SPACE}Define .gtkw wave layout file\n"
SIM_HELP += "${VAR_COL}GHDL_WAVE_OPT${NO_COL}${HELP_SPACE}GHDL wave option file specifying the signals captured during simulation\n"
SIM_HELP += "${VAR_COL}VSIM_USER_ARGS${NO_COL}${HELP_SPACE}Optional user arguments for Modelsim's vsim compiler (e.g. setting generics)\n"
#SIM_HELP += "${VAR_COL}SIM_TIME${NO_COL}${HELP_SPACE}Modelsim sim. time. -all runs until sim. is done, or time (.e.g. 10ns)\n"
SIM_HELP += "${VAR_COL}TIME_RESOLUTION${NO_COL}${HELP_SPACE}Time resolution used by Modelsim (default: 1ps)\n"
SIM_HELP += "${VAR_COL}GHDL_USER_ARGS${NO_COL}${HELP_SPACE}Optional user arguments for GHDL simulation (e.g. setting generics)\n"
SIM_HELP += "${VAR_COL}GHDL_USE_ALTERA_LIB${NO_COL}${HELP_SPACE}Use pre-compiled altera library in vendor_libs.\n"

HELP_TEXT += $(SIM_HELP)

endif

