# 小游戏proto
## internal.proto 内部协议相关proto
### 各种内部协议定义
- 比如 InternalReq 等
### gateway内部rpc接口
    const (
        IntranetCommandIdUpdateUserState = "intra_updatestate"
        IntranetCommandIdGetUserState    = "intra_getstate"
        IntranetCommandIdGetUserConnInfo = "intra_getconninfo"
    )
### match内部rpc接口
    const (
        IntranetCommandIdReportRoomState      = "intra_reportroomstate"
        IntranetCommandIdReportAvailNums      = "intra_reportavailnums"
        IntranetCommandIdReportScore          = "intra_reportscore"
        IntranetCommandIdReportAbnormal       = "intra_reportabnormal"
        IntranetCommandIdReportAbnormalNotify = "intra_reportabnormalnotify"
        IntranetCommandIdReportRoomLock       = "intra_reportroomlock"
    )
## service.proto 内部rpc相关
- Route 管理服务对外提供接口
  - Register 服务注册
  - HeartBeat 心跳上报
- Gateway
  - GatewayHandle 处理上述 IntranetCommandId
  - PushClient 给客户端发Push
- GatewayMonitor
  - Update 接收Broadcast
  - Reload 自身重启
- Match
  - BindMatch 绑定匹配服
  - GetInGameState 获取状态
  - Disconnect 断开
  - MatchHandle 处理上述 IntranetCommandId
- MatchMonitor
  - Update 接收Broadcast
- Relay
  - RelayHandle 处理 RqRelay
    - relay对外接口通过gateway转发
    - 此外relay还提供udp or websocket连接进行帧同步
- RelayMonitor 
  - Update 接收Broadcast
## export.proto 直接和客户端交互的proto
### 对外基础协议
- RequestHeader/ResponseHeader
- PbRequest/PbResponse 
- PushHeader
- PbPush
### gateway 对外接口
    const (
        RqConnectorBindCommandId            = "bind"         //绑定
        RqConnectorHeartBeatCommandId       = "heartbeat"    //心跳
        RqConnectorGetUserStatesCommandId   = "userstates"   //用户状态
        RqConnectorUpdateUserStateCommandId = "updatestate"  //更新用户状态
    )
### match对外接口
    const (
        RqMatchCreateGroupCommandId         = "creategroup"  //创建队伍
        RqMatchJoinGroupCommandId           = "joingroup"    //加入队伍
        RqMatchExitGroupCommandId           = "exitgroup"    //退出队伍
        RqMatchStartMatchCommandId          = "startmatch"   //开始匹配
        RqMatchCancelMatchCommandId         = "cancelmatch"  //取消匹配
        RqMatchExitGameCommandId            = "exitgame"     //退出游戏
        RqMatchUploadScoreCommandId         = "uploadscore"  //结束游戏
        RqMatchSendGiftCommandId            = "sendgift"     //送礼物
        RqMatchInviteFriendCommandId        = "invitefriend" //邀请好友
        RqMatchHandleInviteCommandId        = "handleinvite" //处理邀请
        RqMatchKickCommandId                = "kickuser"     //踢人
    )
### relay对外接口
    const (
        RqRelayUdpSyncTimeCommandId     = "synctime"        //同步时间
        RqRelayUdpActionCommandId       = "action"          //上报帧数据
        RqRelayBindCommandId            = "bindrelay"       //relay绑定
        RqRelayCommandCommandId         = "command"         //
        RqRelayHistoryFrameCommandId    = "historyframe"    //
        RqRelaySignalCommandId          = "signal"          //
        RqRelayExitGameCommandId        = "exitrelaygame"   //
        RqRelaySnapshotCommandId        = "snapshot"        //
        RqRelayReportRoomStateCommandId = "reportroomstate" //
        RqRelayChecksumCommandId        = "checksum"        //
        RqRelayReportScoreCommandId     = "reportscore"     //
    )
### 客户端Push
    const (
    PushCommendIdSyncGroupInfo    = "groupinfo"   //同步房间信息
    PushCommendIdSyncGroupState   = "groupstate"  //同步房间状态
    PushCommendIdMatchSuc         = "matchsuc"    //匹配成功
    PushCommendIdGetScore         = "getscore"    //结算成功获取成绩
    PushCommendIdInviteFriend     = "invitereq"   //邀请好友
    PushCommendIdHandleInvite     = "invitersp"   //邀请好友的回复
    PushCommendIdStartGame        = "pustart"     //开始游戏
    PushCommendIdSignal           = "signal"      //signal
    PushCommendIdGameEnd          = "gameend"     //游戏结束
    PushCommendIdChecksumAbnormal = "checksumerr" //checksum异常
    PushCommendIdKicked           = "kicked"      //被踢了
    PushCommendIdGameEndLike      = "gameendlike" //结算页点赞
    PushCommendIdPushAction       = "puaction"    //push 帧数据
    )

