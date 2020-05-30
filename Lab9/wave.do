onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_slave/tb_enqueue_transaction
add wave -noupdate /tb_ahb_lite_slave/tb_transaction_write
add wave -noupdate /tb_ahb_lite_slave/tb_transaction_fake
add wave -noupdate /tb_ahb_lite_slave/tb_transaction_addr
add wave -noupdate /tb_ahb_lite_slave/tb_transaction_data
add wave -noupdate /tb_ahb_lite_slave/tb_transaction_error
add wave -noupdate /tb_ahb_lite_slave/tb_transaction_size
add wave -noupdate /tb_ahb_lite_slave/tb_enable_transactions
add wave -noupdate /tb_ahb_lite_slave/tb_current_transaction_num
add wave -noupdate /tb_ahb_lite_slave/tb_current_transaction_error
add wave -noupdate /tb_ahb_lite_slave/tb_model_reset
add wave -noupdate /tb_ahb_lite_slave/tb_test_case_num
add wave -noupdate /tb_ahb_lite_slave/tb_test_data
add wave -noupdate /tb_ahb_lite_slave/tb_mismatch
add wave -noupdate /tb_ahb_lite_slave/tb_check
add wave -noupdate /tb_ahb_lite_slave/tb_clk
add wave -noupdate /tb_ahb_lite_slave/tb_n_rst
add wave -noupdate /tb_ahb_lite_slave/tb_hsel
add wave -noupdate /tb_ahb_lite_slave/tb_htrans
add wave -noupdate /tb_ahb_lite_slave/tb_haddr
add wave -noupdate /tb_ahb_lite_slave/tb_hsize
add wave -noupdate /tb_ahb_lite_slave/tb_hwrite
add wave -noupdate /tb_ahb_lite_slave/tb_hwdata
add wave -noupdate /tb_ahb_lite_slave/tb_hrdata
add wave -noupdate /tb_ahb_lite_slave/tb_hresp
add wave -noupdate /tb_ahb_lite_slave/tb_fir_out
add wave -noupdate /tb_ahb_lite_slave/tb_modwait
add wave -noupdate /tb_ahb_lite_slave/tb_err
add wave -noupdate /tb_ahb_lite_slave/tb_coeff_num
add wave -noupdate /tb_ahb_lite_slave/tb_data_ready
add wave -noupdate /tb_ahb_lite_slave/tb_sample_data
add wave -noupdate /tb_ahb_lite_slave/tb_new_coeff_set
add wave -noupdate /tb_ahb_lite_slave/tb_fir_coefficient
add wave -noupdate /tb_ahb_lite_slave/tb_expected_data_ready
add wave -noupdate /tb_ahb_lite_slave/tb_expected_sample
add wave -noupdate /tb_ahb_lite_slave/tb_expected_new_coeff_set
add wave -noupdate /tb_ahb_lite_slave/tb_expected_coeff
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/clk
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/n_rst
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/coefficient_num
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/modwait
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/fir_out
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/err
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/hsel
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/haddr
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/hsize
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/htrans
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/hwrite
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/hwdata
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/sample_data
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/data_ready
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/new_coefficient_set
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/fir_coefficient
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/hrdata
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/hresp
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/state
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/next_state
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/Memory
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/next_Memory
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/next_data_ready
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/haddr_buff
add wave -noupdate -expand -group dut /tb_ahb_lite_slave/DUT/hsize_buff
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
