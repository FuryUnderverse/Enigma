#!/bin/bash

CONNECTIONS=$1
TIME=$2
RATE=$3
SIZE=$4

sleep 20
echo "-------------------- Check chain started or not-------------------- ---------"
curl http://0.0.0.0:26657
echo "-------------------- test cases starting-------------------------------------"
enigma-load-test master --expect-slaves 1 --bind localhost:26670 -c $CONNECTIONS -T $TIME -r $RATE -s $SIZE --broadcast-tx-method async --endpoints ws://0.0.0.0:26657/websocket &
enigma-load-test slave --master ws://localhost:26670 &

mkdir -p /root/logs
LOG_FILE_PATH=/root/logs/logs.txt
rm -rf $LOG_FILE_PATH
touch $LOG_FILE_PATH
while true
do
sleep 1
data=$(curl http://localhost:26670/metrics)
VAR_LENGTH=${#data}
if (( VAR_LENGTH > 100 )); then
     echo "$data" > "$LOG_FILE_PATH"
else
    echo "check latest logs in log file"
    break
fi

done

cat $LOG_FILE_PATH
echo "done"