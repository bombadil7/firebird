CC = ghdl
SRC = firebird.vhd firebird_tb.vhd
OBJ = work-obj93.cf
VCD = firebird.vcd
MOD = firebird_tb 

.PHONY : all check compile elaborate run show clean

all: compile 

check : $(SRC)
	$(CC) -s $(SRC)

compile : check 
	$(CC) -a $(SRC)

elaborate: compile 
	$(CC) -e $(MOD) 

run : elaborate 
	$(CC) -r $(MOD) --vcd=$(VCD)

show : run 
	gtkwave $(VCD)

clean :
	rm -f *~ *.cf *.vcd
