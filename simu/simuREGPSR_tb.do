vlib work

vcom -93 ../src/instruction_decoder.vhd
vcom -93 instruction_decoder_tb.vhd

vsim instruction_decoder_tb

view signals

add wave *

run -all