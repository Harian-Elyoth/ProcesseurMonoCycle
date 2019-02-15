vlib work

vcom -93 Decodeur_Instructions.vhd
vcom -93 Decodeur_Instructions_tb.vhd

vsim Decodeur_Instructions_tb

view signals
add wave UUT/instr_courante
add wave -radix hexadecimal instruction
add wave -radix decimal psrout
add wave -radix hexadecimal offset
add wave -radix hexadecimal imm8
add wave -radix hexadecimal ra
add wave -radix hexadecimal rb
add wave -radix hexadecimal rw
add wave -radix hexadecimal op
add wave -radix binary NPCSEL
add wave -radix binary PSREN
add wave -radix binary WE
add wave -radix binary REGSEL
add wave -radix binary UALSRC
add wave -radix binary WRSRC
add wave -radix binary MEMWR
add wave ok

run -all