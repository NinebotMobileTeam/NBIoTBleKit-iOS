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
@property (nonatomic, assign) int power;

/// speed mode
@property (nonatomic, assign) NBSpeedMode speedMode;

/// current speed (km/h)
@property (nonatomic, assign) int speed;

/// total mileage (m)
@property (nonatomic, assign) int mileage;

/// available range (m)
@property (nonatomic, assign) int rangeAvailable;
@end

NS_ASSUME_NONNULL_END
