current_dir := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

all: compile

include $(current_dir)/compile.mk
include $(current_dir)/sim.mk
include $(current_dir)/clean.mk
include $(current_dir)/help.mk

