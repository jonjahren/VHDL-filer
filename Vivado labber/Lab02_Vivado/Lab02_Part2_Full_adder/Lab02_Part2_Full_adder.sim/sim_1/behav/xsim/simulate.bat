@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Mon Feb 03 10:37:48 +0100 2020
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim Lab02_Part2_Full_Adder_TB_behav -key {Behavioral:sim_1:Functional:Lab02_Part2_Full_Adder_TB} -tclbatch Lab02_Part2_Full_Adder_TB.tcl -log simulate.log"
call xsim  Lab02_Part2_Full_Adder_TB_behav -key {Behavioral:sim_1:Functional:Lab02_Part2_Full_Adder_TB} -tclbatch Lab02_Part2_Full_Adder_TB.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
