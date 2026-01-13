MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
TOP_DIR := $(realpath $(dir $(MAKEFILE_PATH)))

DEPENDENCIES_DIR := $(TOP_DIR)/dependencies


install_fastfusion: install_hwcomponents dependencies/fastfusion
	cd dependencies/fastfusion && \
	pip3 install .

dependencies/fastfusion:
	git clone git@github.com:Accelergy-Project/fastfusion.git $(DEPENDENCIES_DIR)/fastfusion

install_hwcomponents:
	pip3 install hwcomponents          && \
	pip3 install hwcomponents-adc      && \
	pip3 install hwcomponents-cacti    && \
	pip3 install hwcomponents-neurosim && \
	pip3 install hwcomponents-library