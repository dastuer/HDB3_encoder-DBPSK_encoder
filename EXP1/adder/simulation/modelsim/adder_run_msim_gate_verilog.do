transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {adder_min_1200mv_0c_fast.vo}

vlog -vlog01compat -work work +incdir+C:/Users/Dia\ o/Desktop/TestBench {C:/Users/Dia o/Desktop/TestBench/adder_test.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  adder_test

add wave *
view structure
view signals
run -all
