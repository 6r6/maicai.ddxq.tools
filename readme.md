## maicai.ddxq.tools

**Checker.sh**

| 描述  |
| ------------ |
| 每隔一段时间检查今天是否有可配送时段，有则推送到手机  |

**MacOS+iOS使用**

> 手机请安装[Bark](https://apps.apple.com/cn/app/bark-%E7%BB%99%E4%BD%A0%E7%9A%84%E6%89%8B%E6%9C%BA%E5%8F%91%E6%8E%A8%E9%80%81/id1403753865)推送工具

```bash
# 在MacOS终端运行如下命令
brew install curl
brew install jq
# 修改checker.sh内容,填充cURL和BarkID
bash checker.sh
```
---

**CentOS 服务器+iOS使用**
```shell
yum install screen
yum install jq
wget https://raw.githubusercontent.com/6r6/maicai.ddxq.tools/main/checker.sh
# 修改checker.sh内容，将抓包获得的项目、BarkID填充至对应位置
# BarkID在安装应用、注册设备后获得 示例：https://api.day.app/这里是BarkID/
# 挂载后台运行，避免会话关闭任务停止
screen -S shopping 
bash checker.sh
# 查看后台会话
screen -r shopping
```
