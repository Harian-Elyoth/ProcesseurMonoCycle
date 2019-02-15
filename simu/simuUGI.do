vlib work
com -93 ../src/UGI.vhd
vcom -93 UGI_tb.vhd
vsim -novopt UGI_tb(BENCH)
view signals
add wave *
#lancer la sim
run -all