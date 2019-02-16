vlib work

vcom -93 REG32.vhd
vcom -93 REG32_tb.vhd

vsim REG32_tb

view signals
add wave -radix binary clk
add wave -radix binary rst
add wave -radix binary we
add wave -radix binary n
add wave -radix decimal nout
add wave ok

run -all