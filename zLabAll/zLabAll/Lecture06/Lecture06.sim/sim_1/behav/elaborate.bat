@echo off
set xv_path=C:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 79d23ea85ea24998a1dfb31783ca261c -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Mode_M_Counter_tb_behav xil_defaultlib.Mode_M_Counter_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
