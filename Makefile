all: cleandata plot1 plot2

cleandata:
	head -n 1 data/household_power_consumption.txt > data/household_cleandata.txt
	grep "^[12]\/2\/2007" data/household_power_consumption.txt >> data/household_cleandata.txt

plot1:
	R --no-save < plot1.R

plot2:
	LC_ALL=C R --no-save < plot2.R
