#!/bin/bash
# 检查叮咚买菜是否有可配送时段,有则通过Bark推送

# (*)请填充BarkId
barkId=""

while :; do

echo "正在检查是否有可用配送时段..."

# (*)请填充cURL命令,2选1填充,别忘记输出到tmp.json
# curl https://maicai.api.ddxq.mobi/order/getReserveTime > tmp.json
# curl https://maicai.api.ddxq.mobi/order/getMultiReserveTime > tmp.json
# API版本、地址不同的，则根据实际情况变更对应项目
curl --location --request POST 'https://maicai.api.ddxq.mobi/order/getMultiReserveTime' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--header 'ddmc-city-number: 填写对应的城市编号' \
--header 'ddmc-build-version: 2.81.4' \
--header 'ddmc-device-id: 填写设备ID' \
--header 'ddmc-station-id: 填写对应的站点ID' \
--header 'ddmc-channel: applet' \
--header 'ddmc-os-version: [object Undefined]' \
--header 'ddmc-app-client-id: 4' \
--header 'Cookie: 填写你的Cookie' \
--header 'ddmc-ip;' \
--header 'ddmc-longitude: 填写地址的经度' \
--header 'ddmc-latitude: 填写地址的纬度' \
--header 'ddmc-api-version: 9.49.1' \
--header 'ddmc-uid: 填写你的UID' \
--header 'Accept-Encoding: gzip,compress,br,deflate' \
--header 'User-Agent: 填写你的UA' \
--header 'Referer: 填写对应Refere' \
--data-urlencode 'uid=填写提交的UID' \
--data-urlencode 'longitude=填写经度' \
--data-urlencode 'latitude=填写纬度' \
--data-urlencode 'station_id=填写提交的站点ID' \
--data-urlencode 'city_number=填写对应的城市编号' \
--data-urlencode 'api_version=9.49.1' \
--data-urlencode 'app_version=2.81.4' \
--data-urlencode 'applet_source=' \
--data-urlencode 'channel=applet' \
--data-urlencode 'app_client_id=4' \
--data-urlencode 'sharer_uid=' \
--data-urlencode 's_id=填写对应的sid' \
--data-urlencode 'openid=填写对应的openid' \
--data-urlencode 'h5_source=' \
--data-urlencode 'device_token=填写设备token' \
--data-urlencode 'address_id=填写地址id' \
--data-urlencode 'group_config_id=' \
--data-urlencode 'products=填写提交的商品信息' \
--data-urlencode 'isBridge=false' \
--data-urlencode 'nars=填写对应项' \
--data-urlencode 'sesi=填写对应项' > tmp.json

responseCheckCount=`cat tmp.json | grep -c 'station_id'`

if [[ $responseCheckCount -ne 1 ]]; then
    cat tmp.json
    echo "😭 抱歉 请检查cURL命令是否能获取到正确的数据"
    exit 1
fi

# 根据API版本选择对应的availableCount
# api 9.49.0 及以上的用这个，默认启用
availableCount=`cat tmp.json | jq -r '.data[0]?.time[0].times[].disableType' | grep -c 0`

# api version: 9.24.3
# parse as getReserveTime
# availableCount=`cat tmp.json | jq -r '.data.time[0].times[].disableType' | grep -c 0`

if [[ $availableCount -gt 0 ]]; then
    echo "🎉 恭喜 发现可用的配送时段 请尽快下单!"
    curl "https://api.day.app/$barkId/叮咚买菜有可用配送时段请尽快下单/"
    exit 0
fi

echo "无可用配送时段 休眠15秒再试..."
sleep 15

done
