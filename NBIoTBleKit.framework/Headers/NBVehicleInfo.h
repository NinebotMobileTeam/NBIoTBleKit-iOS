//
//  NBScooterInfo.h
//  NBIoTBleKit
//
//  Created by yun.ao on 2021/7/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, NBSpeedMode) {
    NBSpeedModeLowSpeed = 1,
    NBSpeedModeMediumSpeed = 2,
    NBSpeedModeHighSpeed = 3,
};

@interface NBVehicleInfo : NSObject

/// current battery power (0-100)
@property (nonatomic, assign) int power DEPRECATED_MSG_ATTRIBUTE("use `powerPercent` instead");

/// current battery power (0-100)
@property (nonatomic, assign) int powerPercent;

/// speed mode
@property (nonatomic, assign) NBSpeedMode speedMode;

/// current speed (km/h)
@property (nonatomic, assign) int speed DEPRECATED_MSG_ATTRIBUTE("use `currentSpeed` instead");

/// current speed (km/h)
@property (nonatomic, assign) int currentSpeed;

/// total mileage (10m)
@property (nonatomic, assign) int mileage DEPRECATED_MSG_ATTRIBUTE("use `totalRange` instead");

/// total mileage (10m)
@property (nonatomic, assign) int totalRange;

/// available range (10m)
@property (nonatomic, assign) int rangeAvailable DEPRECATED_MSG_ATTRIBUTE("use `remainingRange` instead");

/// available range (10m)
@property (nonatomic, assign) int remainingRange;
@end

NS_ASSUME_NONNULL_END
