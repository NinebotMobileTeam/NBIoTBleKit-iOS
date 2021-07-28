//
//  NBIoTBle.h
//  NBIoTBle
//
//  Created by zyf on 2020/7/9.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "NBIoTBleDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NBIoTBle : NSObject
@property (nonatomic, weak) id<NBIoTBleDelegate> delegate;

/// try to connect bluetooth equipment
/// @param imei imei
/// @param macaddress mac address
/// @param deviceKey device key
- (void)connectDeviceByIMEI:(NSString *)imei macAddress: (NSString *)macaddress andDeviceKey:(NSString *)deviceKey;

- (void)disconnect;

- (void)unlock;

- (void)lock;

/// query IoT information
- (void)queryIoTInformation;

/// query scooter/moped information
- (void)queryVehicleInformation;

/// open battery cover
- (void)openBatteryCover;

/// open saddle
- (void)openSaddle;

/// open tail box
- (void)openTailBox;
@end

NS_ASSUME_NONNULL_END
