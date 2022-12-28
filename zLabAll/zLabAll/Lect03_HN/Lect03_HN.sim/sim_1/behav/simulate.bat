@echo off
set xv_path=C:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xsim Test_Data_Conversion_behav -key {Behavioral:sim_1:Functional:Test_Data_Conversion} -tclbatch Test_Data_Conversion.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
