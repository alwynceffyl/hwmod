ifndef COMP_MK
COMP_MK=1
SHELL=/bin/bash

################################################################################
#                          QESTA/MODELSIM                                      #
################################################################################

VCOM_ARGS= -O0 -check_synthesis -2008 -work work -suppress 1236

compile: compile_log

compile_log: $(VHDL_FILES)
	rm -f compile_log
	vlib work | tee compile_log
	for i in $(VHDL_FILES); do \
		vcom $(VCOM_ARGS) $$i | tee -a compile_log;\
	done;
	@echo "--------------------------------------------------------------"
	@echo "--              Error and Warning Summary                   --"
	@echo "--------------------------------------------------------------"
	@cat compile_log | grep 'Warning\|Error'
	@if [ $$(grep "** Error" compile_log | wc -l) != 0 ]; then \
		rm -f compile_log; \
		echo "Compilation UNSUCCESSFUL"; \
		false;\
	fi

.PHONY: compile

################################################################################
#                             GHDL                                             #
################################################################################

GHDL_STD=--std=08
GHDL_WORK_ARG=--work=work
GHDL_IMPORT_ARGS=$(GHDL_WORK_ARG)
GHDL_ELAB_ORDER_ARGS=$(GHDL_STD) $(GHDL_WORK_ARG)
GHDL_COMP_ARGS=$(GHDL_STD) $(GHDL_WORK_ARG) --ieee=synopsys -frelaxed -Wno-shared

GHDL_IMPORT=ghdl -i $(GHDL_IMPORT_ARGS)
GHDL_ELAB_ORDER=ghdl --elab-order $(GHDL_ELAB_ORDER_ARGS)
GHDL_ANALYSE=ghdl -a $(GHDL_COMP_ARGS)
GHDL_LIB_ANALYSE=ghdl -a --std=93 --work=work --ieee=synopsys -fexplicit

QUARTUS_BIN=$(shell which quartus)
QUARTUS_BIN_DIR=$(shell dirname $(QUARTUS_BIN))
QUARTUS_LIB_DIR=$(QUARTUS_BIN_DIR)/../eda/sim_lib

GHDL_BIN=$(shell which ghdl)
GHDL_BIN_DIR=$(shell dirname $(GHDL_BIN))
GHDL_DIR=$(shell dirname $(GHDL_BIN_DIR))
GHDL_LIB_VENDORS_SCRIPT_DIR=$(GHDL_DIR)/lib/ghdl/vendors

GHDL_VENDOR_LIB_DIR=vendor_libs

# cyclone lib compilation gets stuck with vhdl2008
ifndef GHDL_USE_ALTERA_LIB
GHDL_USE_ALTERA_LIB=0
GCOMP_ALTERA_LIB_ARGS=--cyclone
else
GCOMP_ALTERA_LIB_ARGS=--vhdl2008
endif

gcompile: gcompile_log

# Important:
# 'set -o pipefail' is required to make the pipe operator "relay" the return
# code of the first command

ghdl_import_log: $(VHDL_FILES)
	@rm -f ghdl_import_log
	$(GHDL_IMPORT) $(VHDL_FILES) | tee ghdl_import_log;

glibs:
	@mkdir -p $(GHDL_VENDOR_LIB_DIR)
	@$(GHDL_LIB_VENDORS_SCRIPT_DIR)/compile-intel.sh --altera $(GCOMP_ALTERA_LIB_ARGS) --source $(QUARTUS_LIB_DIR) --output $(GHDL_VENDOR_LIB_DIR) > /dev/null 2>&1

gcompile_log: $(VHDL_FILES)
#ifneq ($(TB),)
#		$(eval ORDERED_VHDL_FILES=$(shell $(GHDL_ELAB_ORDER) $(TB)))
#else
#		$(eval ORDERED_VHDL_FILES=$(VHDL_FILES))
#endif
	@echo $(VHDL_FILES);
	@rm -f gcompile_log
	@set -o pipefail;\
	for i in $(VHDL_FILES); do \
		echo "compiling $$i"; \
		if [ -f "$$i" ] && [ $${i: -4} = ".vho" ]; then\
			if [ ! -d "$(GHDL_VENDOR_LIB_DIR)" ]; then\
				make glibs;\
			fi;\
			$(GHDL_LIB_ANALYSE) -P$(GHDL_VENDOR_LIB_DIR) $$i | tee gcompile_log;\
		elif [ $(GHDL_USE_ALTERA_LIB) -eq 1 ]; then\
			if [ ! -d "$(GHDL_VENDOR_LIB_DIR)" ]; then\
				make glibs;\
			fi;\
			$(GHDL_ANALYSE) -P$(GHDL_VENDOR_LIB_DIR) $$i | tee gcompile_log;\
		else\
			$(GHDL_ANALYSE) $$i | tee gcompile_log;\
		fi;\
		if [ $$? != 0 ]; then\
			echo "Compilation UNSUCCESSFUL" | tee gcompile_log;\
			rm gcompile_log;\
			false; \
		fi;\
	done;

.PHONY: gcompile

################################################################################
#                             HELP TEXT                                        #
################################################################################

current_dir := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))
include $(current_dir)/common.mk

COMP_HELP += $(HELP_SEP_LINE)
COMP_HELP += "Provides targets for compilation. Requires ${VAR_COL}VHDL_FILES${NO_COL} to be set\n"
COMP_HELP += '***\n'
COMP_HELP += "${TARGET_COL}compile${NO_COL}:${HELP_SPACE}Compile design given by ${VAR_COL}VHDL_FILES${NO_COL} using Modelsim\n"
COMP_HELP += "${HELP_SPACE}Note that the order of ${VAR_COL}VHDL_FILES${NO_COL} gives the compilation order!\n"
COMP_HELP += "${TARGET_COL}gcompile${NO_COL}:${HELP_SPACE}Compile design given by ${VAR_COL}VHDL_FILES${NO_COL} using GHDL\n"
COMP_HELP += "${HELP_SPACE}GNote that the order of ${VAR_COL}VHDL_FILES${NO_COL} gives the compilation order!\n"
COMP_HELP += '***\n'
COMP_HELP += "${VAR_COL}VHDL_FILES${NO_COL}${HELP_SPACE}Design and testbench files required for the simulation.\n"
COMP_HELP += "${HELP_SPACE}Note that the order of ${VAR_COL}VHDL_FILES${NO_COL} gives the compilation order!\n"
COMP_HELP += "${VAR_COL}GHDL_USE_ALTERA_LIB${NO_COL}${HELP_SPACE}Compile Altera IP libraries together with design.\n"

HELP_TEXT += $(COMP_HELP)

endif
