@echo off
set xv_path=F:\\softwarehub\\vivado\\Vivado\\2017.1\\bin
call %xv_path%/xelab  -wto 73bdf68ab9584d669c248fe4360407ef -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Topest_tb_behav xil_defaultlib.Topest_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
