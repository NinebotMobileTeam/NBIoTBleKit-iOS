//
//  NBIoTBleKitDelegate.h
//  NBIoTBleKit
//
//  Created by yun.ao on 2021/7/5.
//

#import <CoreBluetooth/CoreBluetooth.h>

@class NBVehicleInfo, NBIoTInfo;

typedef NS_ENUM(NSInteger, ConnectionState) {
    /** 连接失败 **/
    ConnectionStateDisconnected = 0,
    /** 连接成功 **/
    ConnectionStateConnected = 1,
};


@protocol NBIoTBleDelegate <NSObject>

@optional
/// bluetooth state
- (void)bluetoothStateChanged: (CBManagerState)state;

/// occurred error when try to connect device
/// @param error NBError
- (void)connectDeviceOnError: (NSError *_Nullable)error;


/// connection status changed
/// @param state ConnectionState

- (void)connectionStateChange: (ConnectionState) state;


/// lock result
/// @param isSuccess YES or NO
- (void)lockScooterResult: (BOOL)isSuccess withError: (NSError *_Nullable)error;

/// unlock result
/// @param isSuccess YES/NO
- (void)unlockScooterResult: (BOOL)isSuccess withError: (NSError *_Nullable)error;

/// query IoT information
/// @param iotInfo infomation model
/// @param error if error returned, the iotInfo will be nil.
- (void)queryIoTInfomationResult: (NBIoTInfo * _Nullable) iotInfo withError: (NSError *_Nullable)error;

/// query scooter inforamtion finished
/// @param vehicleInfo vehicle information
/// @param error if error returned, the scooterInfo will be nil.
- (void)queryVehicleInformationResult: (NBVehicleInfo * _Nullable) vehicleInfo withError: (NSError *_Nullable)error;


/// open battery cover result
/// @param isFinished YES/NO
- (void)openBatteryCoverResult: (BOOL)isFinished withError: (NSError *_Nullable)error;

/// open saddle result
/// @param isFinished YES/NO
- (void)openSaddleResult: (BOOL)isFinished withError: (NSError *_Nullable)error;


/// open tail box result
/// @param isFinished YES/NO
- (void)openTailboxResult: (BOOL)isFinished withError: (NSError *_Nullable)error;

@end

