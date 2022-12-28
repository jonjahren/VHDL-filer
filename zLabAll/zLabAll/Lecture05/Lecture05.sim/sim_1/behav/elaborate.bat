@echo off
set xv_path=C:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 439d41413e6a4fe5bb97ead0b608a0bb -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot d_ff_rst_en_circuit_tb_behav xil_defaultlib.d_ff_rst_en_circuit_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
