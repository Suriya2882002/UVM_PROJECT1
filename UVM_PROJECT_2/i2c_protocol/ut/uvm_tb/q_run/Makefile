VLOG=/tool/mentor/questa-10.7c/questasim/bin/vlog
VSIM=/tool/mentor/questa-10.7c/questasim/bin/vsim
VCOVER=/tool/mentor/questa-10.7c/questasim/bin/vcover
VOPT=/tool/mentor/questa-10.7c/questasim/bin/vopt


#TEST = ../src/test/i2c_test.sv

QUESTA_SIM_PATH  = '/tool/mentor/questa-10.7c/questasim/bin'

compile:
	$(VLOG) +incdir+../src/master_agt_top +incdir+../src/slave_agt_top +incdir+../src/env +incdir+../src/test ../src/test/i2c_pkg.sv ../src/top.sv -l compile.log
RUN:

	$(VSIM) top "+UVM_TESTNAME=i2c_test" +UVM_VERBOSITY=UVM_HIGH -do "log -r /*" -do "run -all" -c

RUN_WAVE: RUN
	$(VSIM) waveform.wlf

