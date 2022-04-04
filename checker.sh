#!/bin/bash
# 检查叮咚买菜是否有可配送时段,有则通过Bark推送

while :; do

echo "正在检查是否有可用配送时段..."

# replace your curl command here
# curl https://maicai.api.ddxq.mobi/order/getMultiReserveTime > tmp.json

availableCount=`cat tmp.json | jq -r '.data[0].time[0].times[].disableType' | grep -c 0`
if [[ $availableCount -gt 0 ]]; then
    echo "🎉恭喜 发现可用的配送时段 请尽快下单!"
    curl "https://api.day.app/qL9u3RtF5VYvgppcAkE7Xo/叮咚买菜有可用配送时段请尽快下单/"
    exit 0
fi

echo "无可用配送时段 休眠10秒再试..."
sleep 10

done