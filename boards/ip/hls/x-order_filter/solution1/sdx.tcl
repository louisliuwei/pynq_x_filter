# ==============================================================
# File generated on Mon Oct 07 01:59:24 +0800 2019
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../../fir_src/fir_test.cpp -cflags { -Wno-unknown-pragmas}
add_files -tb ../../fir_src/input.dat -cflags { -Wno-unknown-pragmas}
add_files -tb ../../fir_src/out.gold.dat -cflags { -Wno-unknown-pragmas}
add_files fir_src/x_order_fir.cpp
add_files fir_src/fir_coef.dat
set_part xc7z020clg400-1
create_clock -name default -period 10
config_dataflow -default_channel=fifo
config_dataflow -fifo_depth=0
config_dataflow -scalar_fifo_depth=0
config_dataflow -start_fifo_depth=0
config_dataflow -strict_mode=warning
