#!/bin/sh

SOC=`cat /source/capacity`
RCC="$((`cat /source/charge_now`/1000))"
current_now="$((`cat /source/current_now`/1000))"
voltage_now="$((`cat /source/voltage_now`/1000))"
status=`cat /source/status`

#datetime=`date --rfc-3339=seconds`
#date=`date --iso-8601`

datetime=`date -Iseconds`
date=`date -Idate`

echo "$SOC, $RCC, $current_now, $voltage_now, $datetime, $status" >> /destination/battery-$date.csv
