@echo off
set xv_path=C:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xsim d_ff_rst_en_circuit_tb_behav -key {Behavioral:sim_1:Functional:d_ff_rst_en_circuit_tb} -tclbatch d_ff_rst_en_circuit_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
