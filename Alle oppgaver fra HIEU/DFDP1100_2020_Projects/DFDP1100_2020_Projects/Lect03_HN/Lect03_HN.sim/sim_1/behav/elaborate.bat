@echo off
set xv_path=C:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto dd4b77c4c71441ac8993094f5300233c -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Test_Data_Conversion_behav xil_defaultlib.Test_Data_Conversion -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
