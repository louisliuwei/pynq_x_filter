############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project x-order_filter
set_top x_order_fir
add_files fir_src/fir_coef.dat
add_files fir_src/x_order_fir.cpp
add_files -tb fir_src/out.gold.dat -cflags "-Wno-unknown-pragmas"
add_files -tb fir_src/input.dat -cflags "-Wno-unknown-pragmas"
add_files -tb fir_src/fir_test.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 10 -name default
config_dataflow -default_channel fifo -fifo_depth 0 -scalar_fifo_depth 0 -start_fifo_depth 0 -strict_mode warning
#source "./fir_filter/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
