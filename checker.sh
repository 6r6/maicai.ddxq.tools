#!/bin/bash
# 检查叮咚买菜是否有可配送时段,有则通过Bark推送

# (*)请填充BarkId
barkId=""

while :; do

echo "正在检查是否有可用配送时段..."

# (*)请填充cURL命令,别忘记输出到tmp.json
# curl https://maicai.api.ddxq.mobi/order/getMultiReserveTime > tmp.json

responseCheckCount=`cat tmp.json | grep -c 'station_id'`

if [[ $responseCheckCount -ne 1 ]]; then
    echo "😭抱歉 请检查cURL命令是否能获取到正确的数据"
    exit 1
fi

# api version: 9.49.0
availableCount=`cat tmp.json | jq -r '.data[0]?.time[0].times[].disableType' | grep -c 0`

# api version: 9.24.3
availableCount=`cat tmp.json | jq -r '.data.time[0].times[].disableType' | grep -c 0`

if [[ $availableCount -gt 0 ]]; then
    echo "🎉恭喜 发现可用的配送时段 请尽快下单!"
    curl "https://api.day.app/$barkId/叮咚买菜有可用配送时段请尽快下单/"
    exit 0
fi

echo "无可用配送时段 休眠15秒再试..."
sleep 15

done