#! /bin/bash 
filename="exp2"
docker run --net=host --privileged --name powerapi-$filename --rm  -d            -v /sys:/sys -v /var/lib/docker/containers:/var/lib/docker/containers:ro            -v /tmp/powerapi-sensor-reporting/$filename:/reporting/   powerapi/hwpc-sensor:latest            -n machine           -s rapl -e RAPL_ENERGY_PKG            -r csv -U /reporting/

for attempt in {1..10}
    do 
    for process in  {1..10} 
        do 
        for level in {1..12}
            do 
            python  worker.py $process $level &  
            pid_workers=`echo $!` 
            echo -------------------------------------- >>$filename.logs
            echo workers,$process,$level,$attempt >> $filename.logs
            date +%s >> $filename.logs
            sleep 5 
            date +%s >> $filename.logs
            perf stat -a -r 1     -e "power/energy-pkg/"     -e     "power/energy-cores/" -e "power/energy-gpu/" python     graph-coloration.py 2>>$filename.logs 
            date +%s >> $filename.logs
            sleep 3 
            pkill -P $pid_workers

        done
    done 
done
docker stop powerapi-$filename

exit 0 
ps -au | egrep worker | awk  -F ' '  '{print $2}' |xargs -I@ sudo kill -9 @ ;

docker run --net=host --privileged --name powerapi-sensor -d            -v /sys:/sys -v /var/lib/docker/containers:/var/lib/docker/containers:ro            -v /tmp/powerapi-sensor-reporting/$filename:/reporting/   powerapi/hwpc-sensor:latest            -n machine           -c rapl -e RAPL_ENERGY_PKG            -r csv -U /reporting/