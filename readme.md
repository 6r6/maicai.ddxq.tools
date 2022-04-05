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