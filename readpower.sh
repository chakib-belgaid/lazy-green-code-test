while true ; do  tail /tmp/powerapi-sensor-reporting/rapl | awk -F ','  '{ a =$6  ;b =$5 ; a =a * 2 ^ -32; print b "=" a }' ;sleep 1 ; done ;