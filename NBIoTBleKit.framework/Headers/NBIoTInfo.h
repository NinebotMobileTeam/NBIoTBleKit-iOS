//
//  NBIoTInfo.h
//  NBIoTBleKit
//
//  Created by yun.ao on 2021/7/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, NBIotPowerStatus) {
    NBIotPowerStatusOn,
    NBIotPowerStatusOff,
};

typedef NS_ENUM(NSUInteger, NBLockStatus) {
    NSLockStatusLocked,
    NSLockStatusUnlocked,
};

@interface NBIoTInfo : NSObject


/// voltage
@property (nonatomic, assign) int voltage;

/// voltage H (mV)
@property (nonatomic, assign) int voltageH;

/// voltage L (mV)
@property (nonatomic, assign) int voltageL;


/// Equipment power status
@property (nonatomic, assign) NBIotPowerStatus powerStatus;

/// main IoT firmware version number
@property (nonatomic, assign) int mainVersion;

/// second IoT firmware version number
@property (nonatomic, assign) int secondVersion;

/// version modified times
@property (nonatomic, assign) int modifiedTimes;

/// Equipment power status
@property (nonatomic, assign) NBLockStatus isLock;


@end

NS_ASSUME_NONNULL_END
