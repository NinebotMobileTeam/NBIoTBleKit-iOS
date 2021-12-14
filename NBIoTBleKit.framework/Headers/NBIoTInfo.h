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

@interface NBIoTInfo : NSObject


/// voltage (mv)
@property (nonatomic, assign) int voltage;

/// voltage H (mV)
@property (nonatomic, assign) int voltageH DEPRECATED_MSG_ATTRIBUTE("use `voltage` instead");

/// voltage L (mV)
@property (nonatomic, assign) int voltageL DEPRECATED_MSG_ATTRIBUTE("use `voltage` instead");


/// Equipment power status
@property (nonatomic, assign) NBIotPowerStatus powerStatus DEPRECATED_MSG_ATTRIBUTE("This property no longer supported, it will be removed next version");

/// main IoT firmware version number
@property (nonatomic, assign) int mainVersion DEPRECATED_MSG_ATTRIBUTE("use `majorVersionNumber` instead");

/// main IoT firmware version number
@property (nonatomic, assign) int majorVersionNumber;

/// second IoT firmware version number
@property (nonatomic, assign) int secondVersion DEPRECATED_MSG_ATTRIBUTE("use `minorVersionNumber` instead");

/// second IoT firmware version number
@property (nonatomic, assign) int minorVersionNumber;

/// version modified times
@property (nonatomic, assign) int modifiedTimes DEPRECATED_MSG_ATTRIBUTE("use `updateTimes` instead");

/// version modified times
@property (nonatomic, assign) int updateTimes;

/// Equipment power status
@property (nonatomic, assign) BOOL isLocked;

@end

NS_ASSUME_NONNULL_END
