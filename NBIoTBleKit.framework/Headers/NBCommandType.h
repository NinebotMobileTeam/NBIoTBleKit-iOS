//
//  NBCommandType.h
//  NBIoTBleKit
//
//  Created by yun.ao on 2021/11/10.
//

#ifndef NBCommandType_h
#define NBCommandType_h

typedef NS_ENUM(NSUInteger, NBCommandType) {
    //开锁
    NBCommandTypeUnlock,
    //关锁
    NBCommandTypeLock,
    //IOT 信息
    NBCommandTypeIoTInfo,
    //车辆信息
    NBCommandTypeScooterInfo,
    
    //电池仓
    NBCommandTypeOmiBatteryCover,
    
    NBCommandTypeYiweiBatteryCover,
    
    //座桶
    NBCommandTypeSaddle,
    //尾箱
    NBCommandTypeTailBox,
    
    //头盔锁
    NBCommandTypeHelmetLock,
    
    // 启动数据传输
    NBCommandTypeStartDataTransfer,

    //头盔锁状态
    NBCommandTypeHelmetLockStatus,
};

#endif /* NBCommandType_h */
