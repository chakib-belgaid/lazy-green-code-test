#!/bin/bash




PKG0='/sys/devices/virtual/powercap/intel-rapl/intel-rapl:0/energy_uj'
# DRAM0='/sys/devices/virtual/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj'
# PKG1='/sys/devices/virtual/powercap/intel-rapl/intel-rapl:1/energy_uj'
# DRAM1='/sys/devices/virtual/powercap/intel-rapl/intel-rapl:1/intel-rapl:1:0/energy_uj'



beginT=` date +"%s%N"`
beginPKG0=` cat $PKG0`
# beginDRAM0=` cat $DRAM0`
# beginPKG1=` cat $PKG1`
# beginDRAM1=` cat $DRAM1`

python testsleep.py

endT=` date +"%s%N"`
endPKG0=` cat $PKG0`
# endDRAM0=` cat $DRAM0`
# endPKG1=` cat $PKG1`
# endDRAM1=` cat $DRAM1`

duration=$((($endT - $beginT)/1000000000))

pkg0=$((($endPKG0-$beginPKG0)))
# pkg1=$((($endPKG1-$beginPKG1)/1000))
# dram0=$((($endDRAM0-$beginDRAM0)/1000))
# dram1=$((($endDRAM1-$beginDRAM1)/1000))

# pkg=$(($pkg0+$pkg1))
# dram=$(($dram0+$dram1))

# echo 'duration (ms)'   $duration

echo '      duration sleep (s):'   $duration 
echo '      energy sleep (uJ):'        $pkg0
# echo dram       $dram


beginT=` date +"%s%N"`
beginPKG0=` cat $PKG0`
# beginDRAM0=` cat $DRAM0`
# beginPKG1=` cat $PKG1`
# beginDRAM1=` cat $DRAM1`

python test.py &
sleep $duration

endT=` date +"%s%N"`
endPKG0=` cat $PKG0`
# endDRAM0=` cat $DRAM0`
# endPKG1=` cat $PKG1`
# endDRAM1=` cat $DRAM1`

duration=$((($endT - $beginT)/1000000000))

pkg0=$((($endPKG0-$beginPKG0)))
# pkg1=$((($endPKG1-$beginPKG1)/1000))
# dram0=$((($endDRAM0-$beginDRAM0)/1000))
# dram1=$((($endDRAM1-$beginDRAM1)/1000))

# pkg=$(($pkg0+$pkg1))
# dram=$(($dram0+$dram1))

# echo 'duration (ms)'   $duration

echo '      duration  (s):'   $duration 
echo '      energy  (uJ):'        $pkg0
# echo dram       $dram

