//
//  NBConnectionState.h
//  NBIoTBleKit
//
//  Created by yun.ao on 2021/11/10.
//

#ifndef NBConnectionState_h
#define NBConnectionState_h

typedef NS_ENUM(NSInteger, ConnectionState) {
    /** 连接失败 **/
    ConnectionStateDisconnected = 0,
    /** 连接成功 **/
    ConnectionStateConnected = 1,
};

#endif /* NBConnectionState_h */
