clean:
	rm *.cf
	rm *.vcd


build:
ifdef file
	@echo 'Building file: $(file)'
	ghdl -a '$(file).vhdl'
	ghdl -a '$(file)_tb.vhdl'
	ghdl -e '$(file)_tb'
	ghdl -r '$(file)_tb' --vcd='out_$(file).vcd'
else
	@echo 'Syntax Error: Pls provide file with file='
endif

run:
ifdef file
	@echo 'Building file: $(file)'
	ghdl -a '$(file).vhdl'
	ghdl -a '$(file)_tb.vhdl'
	ghdl -e '$(file)_tb'
	ghdl -r '$(file)_tb' --vcd='out_$(file).vcd'
	gtkwave 'out_$(file).vcd'
else
	@echo 'Syntax Error: Pls provide file with file='
endif