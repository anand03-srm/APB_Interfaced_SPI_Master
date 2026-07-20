remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog ../rtl/baud_rate.v
analyze -format verilog ../rtl/shift_reg.v
analyze -format verilog ../rtl/spi_apb_slave.v
analyze -format verilog ../rtl/slave_select.v
analyze -format verilog ../rtl/spi_top_block.v

elaborate spi_top_block

link 

check_design

current_design  spi_top_block

compile_ultra

write_file -f verilog -hier -output spi_top_block_netlist.v


 

