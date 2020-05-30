onerror {resume}
quietly virtual function -install /tb_fir_image -env /tb_fir_image { &{/tb_fir_image/tb_sample_r, /tb_fir_image/tb_sample_g, /tb_fir_image/tb_sample_b }} Input_Pixels
quietly virtual function -install /tb_fir_image -env /tb_fir_image { (concat_noflatten)&{/tb_fir_image/tb_sample_r, /tb_fir_image/tb_sample_g, /tb_fir_image/tb_sample_b }} Input_Pixel
quietly virtual signal -install /tb_fir_image { (concat_noflatten) (context /tb_fir_image )&{tb_fir_out_r , tb_fir_out_g , tb_fir_out_b }} Output_Pixel
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fir_image/r
add wave -noupdate /tb_fir_image/c
add wave -noupdate /tb_fir_image/tb_clk
add wave -noupdate /tb_fir_image/tb_n_reset
add wave -noupdate /tb_fir_image/tb_load_coeff
add wave -noupdate -radix hexadecimal /tb_fir_image/tb_coeff
add wave -noupdate /tb_fir_image/tb_data_ready
add wave -noupdate -radix unsigned /tb_fir_image/Input_Pixel
add wave -noupdate -group Modwaits /tb_fir_image/tb_modwait_r
add wave -noupdate -group Modwaits /tb_fir_image/tb_modwait_g
add wave -noupdate -group Modwaits /tb_fir_image/tb_modwait_b
add wave -noupdate -radix unsigned /tb_fir_image/Output_Pixel
add wave -noupdate -group {One K Samples} /tb_fir_image/tb_one_k_samples_r
add wave -noupdate -group {One K Samples} /tb_fir_image/tb_one_k_samples_g
add wave -noupdate -group {One K Samples} /tb_fir_image/tb_one_k_samples_b
add wave -noupdate -group Errors /tb_fir_image/tb_err_r
add wave -noupdate -group Errors /tb_fir_image/tb_err_g
add wave -noupdate -group Errors /tb_fir_image/tb_err_b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {110908270500 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 235
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
configure wave -timelineunits ns
update
WaveRestoreZoom {70175 us} {143675 us}
