# 🌐 Workplane VPN 配置说明

> **独立运行配置** | 更新日期：2026-01-23

---

## A. 接入点说明

| 项目 | 参数 |
|------|------|
| **运营商** | 中国电信 |
| **最大带宽** | 1000 Mbps |
| **最大并发** | 500 用户/设备 |
| **公网 IP** | 116.228.181.19 |

---

## B. 关键参数

### VPN 连接（支持：IKEv2 / SSTP / L2TP IPSec）

| 参数 | 值 |
|------|------|
| **Server** | `u6r.189ca.cn` |
| **Username** | `Player ID`（全部小写） |
| **Password** | `Passcode`（默认：`Hello189`） |

#### L2TP 额外参数

| 参数 | 值 |
|------|------|
| **L2TP/IPsec Secret（PSK）** | `ca17` |

#### iOS / macOS IKEv2 额外参数

| 参数 | 值 |
|------|------|
| **远程 ID（Remote ID）** | `ca17j8r.l89lab.net` |


---

## C. 推荐协议

| 平台 | 推荐协议 | 备注 |
|------|----------|------|
| **Windows** | IKEv2 / SSTP / L2TP | 优先 IKEv2 |
| **macOS** | IKEv2 / L2TP | — |
| **iOS** | IKEv2 | — |
| **Android** | IKEv2 | 需安装 StrongSwan |
| **TeamsBox** | SSTP / L2TP / IKEv2 | 仅当 SSTP/L2TP 无法工作时选 IKEv2 |



## D. 接入后效果

> 拨号接入后的带宽、并发、出口方向由 **TeamsACS** 资费设定决定。

### 当前支持资费

| 编号 | 地区 | 国家/地区 |
|:----:|:----:|----------|
| 2001 | JP | 日本 |
| 2002 | JP | 日本 |
| 2005 | US | 美国 |
| 2006 | US | 美国 |
| 2013 | HK | 中国香港 |
| 2014 | HK | 中国香港 |