# Vivado Simulator Makefile based flow
# Copyright Norbertas Kremeris 2021
# www.itsembedded.com


TB_TOP := simple_in_n_out_tb


COMP_OPTS  = --incr
COMP_OPTS += --relax 

SRC_DIR = src/

SRC_SOURCES_VERILOG = $(shell ls $(SRC_DIR)*.v)
SRC_SOURCES_SYS_VERILOG = $(shell ls $(SRC_DIR)*.sv)
SRC_SOURCES_VHDL = $(shell ls $(SRC_DIR)*.vhdl)



#==== Default target - running simulation without drawing waveforms ====#
.PHONY : simulate
simulate : $(TB_TOP)_snapshot.wdb

.PHONY : elaborate
elaborate : .elab.timestamp

.PHONY : compile
compile :  .comp_v.timestamp


#==== WAVEFORM DRAWING ====#
.PHONY : waves
waves : $(TB_TOP)_snapshot.wdb
	@echo
	@echo "### OPENING WAVES ###"
	xsim --gui $(TB_TOP)_snapshot.wdb


# Simulation snapshot
$(TB_TOP)_snapshot.wdb : .elab.timestamp
	@echo
	@echo "### RUNNING SIMULATION ###"
	xsim $(TB_TOP)_snapshot -tclbatch sim/xsim_cfg.tcl

# Elaborating
.elab.timestamp : .comp_v.timestamp
	@echo
	@echo "### ELABORATING ###"
	xelab -debug all -top $(TB_TOP) -snapshot $(TB_TOP)_snapshot
	touch .elab.timestamp

# Compiling verilog
.comp_v.timestamp : $(SRC_SOURCES_VERILOG)
	@echo $(SRC_SOURCES_VERILOG)
	@echo "### COMPILING VERILOG ###"
	xvlog $(COMP_OPTS) $(SRC_SOURCES_VERILOG)
	touch .comp_v.timestamp

.PHONY : clean
clean :
	rm -rf *.jou *.log *.pb *.wdb xsim.dir
	rm -rf .*.timestamp .Xil

#==== Subtractor type marker generation ===#
# .sub_$(SUB).timestamp :
# 	@rm -rf .sub_*.timestamp
# 	@touch .sub_$(SUB).timestamp