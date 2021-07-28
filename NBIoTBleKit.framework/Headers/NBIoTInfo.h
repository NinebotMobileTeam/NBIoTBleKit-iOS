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

@end

NS_ASSUME_NONNULL_END
