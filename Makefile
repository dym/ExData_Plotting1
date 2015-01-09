cleandata:
	head -n 1 data/household_power_consumption.txt > data/household_cleandata.txt
	grep "^[12]\/2\/2007" data/household_power_consumption.txt >> data/household_cleandata.txt

all:
	cleandata
