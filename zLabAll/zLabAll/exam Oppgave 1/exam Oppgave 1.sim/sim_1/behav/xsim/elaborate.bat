@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Tue May 05 10:26:09 +0200 2020
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 78ecd24441de4318a8afcb3e9971fdcc --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Greater_Than_behav xil_defaultlib.Greater_Than -log elaborate.log"
call xelab  -wto 78ecd24441de4318a8afcb3e9971fdcc --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Greater_Than_behav xil_defaultlib.Greater_Than -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
