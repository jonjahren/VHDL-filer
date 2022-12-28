@echo off
set xv_path=C:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 36ad086f32a745b680318e4d1e720661 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Lab01_part2_tb_behav xil_defaultlib.Lab01_part2_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
