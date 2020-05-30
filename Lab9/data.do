onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/clk
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/coefficient_num
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/modwait
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/fir_out
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/err
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/hsel
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/haddr
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/hsize
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/htrans
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/hwrite
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/hwdata
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/sample_data
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/new_coefficient_set
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/fir_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/hrdata
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/hresp
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/state
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/next_state
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/Memory
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/next_Memory
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/next_data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/haddr_buff
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/AHB_LITE_SLAVE/hsize_buff
add wave -noupdate -expand -group COEFF /tb_ahb_lite_fir_filter/DUT/COEFF_LOADER/clk
add wave -noupdate -expand -group COEFF /tb_ahb_lite_fir_filter/DUT/COEFF_LOADER/n_reset
add wave -noupdate -expand -group COEFF /tb_ahb_lite_fir_filter/DUT/COEFF_LOADER/new_coefficient_set
add wave -noupdate -expand -group COEFF /tb_ahb_lite_fir_filter/DUT/COEFF_LOADER/modwait
add wave -noupdate -expand -group COEFF /tb_ahb_lite_fir_filter/DUT/COEFF_LOADER/load_coeff
add wave -noupdate -expand -group COEFF /tb_ahb_lite_fir_filter/DUT/COEFF_LOADER/coefficient_num
add wave -noupdate -expand -group COEFF /tb_ahb_lite_fir_filter/DUT/COEFF_LOADER/state
add wave -noupdate -expand -group COEFF /tb_ahb_lite_fir_filter/DUT/COEFF_LOADER/next_state
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/clk
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/n_rst
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/dr
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/lc
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/overflow
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/cnt_up
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/clear
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/modwait
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/op
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/src1
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/src2
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/dest
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/err
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/next_state
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/state
add wave -noupdate -expand -group Controll /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/next_modwait
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
