@echo off
set xv_path=C:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto bf738bb84399481c8f79c553d248d468 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot one_bit_comparator_tb_behav xil_defaultlib.one_bit_comparator_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
