@echo off
set xv_path=C:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto af82f4d6cb6b4084b003fda451b2ffe9 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot mux_4_case_tb_behav xil_defaultlib.mux_4_case_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
