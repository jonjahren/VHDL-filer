@echo off
set xv_path=C:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto d9259688fb764d97a6dc6685156c5f8a -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot mod_m_counter_new_tb_behav xil_defaultlib.mod_m_counter_new_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
