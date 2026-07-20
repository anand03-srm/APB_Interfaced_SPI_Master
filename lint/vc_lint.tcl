#Liberty files are needed for logical and physical netlist designs
set search_path "./"
set link_library " "

set_app_var enable_lint true

configure_lint_setup -goal lint_rtl

analyze -verbose -format verilog "../rtl/baud_rate.v"
analyze -verbose -format verilog "../rtl/shift_reg.v"
analyze -verbose -format verilog "../rtl/spi_apb_slave.v"
analyze -verbose -format verilog "../rtl/slave_select.v"
analyze -verbose -format verilog "../rtl/spi_top_block.v"

elaborate spi_top_block

check_lint

report_lint -verbose -file report_spi_project.txt

