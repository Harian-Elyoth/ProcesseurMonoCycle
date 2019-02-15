vlib work
vcom -93 ../src/UT2.vhd
vcom -93 UT2_tb.vhd
vsim -novopt UT2_tb(BENCH)
view signals
add wave*