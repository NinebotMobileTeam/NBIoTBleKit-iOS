//
//  NBIoTBleRNModule.m
//  NBIoTKitReactNativeDemo
//
//  Created by yun.ao on 2022/4/21.
//

#import "NBIoTBleRNModule.h"

@interface NBIoTBleRNModule () <NBIoTBleDelegate>
@property(nonatomic, strong) NBIoTBle *iotController;

// unlock
@property(nonatomic, copy) RCTPromiseResolveBlock unlockResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock unlockReject;

// lock
@property(nonatomic, copy) RCTPromiseResolveBlock lockResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock lockReject;

// iot info
@property(nonatomic, copy) RCTPromiseResolveBlock iotInfoResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock iotInfoReject;

// bike info

@property(nonatomic, copy) RCTPromiseResolveBlock vehicleInfoResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock vehicleInfoReject;

@property(nonatomic, copy) RCTPromiseResolveBlock batteryCoverResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock batteryCoverReject;

@property(nonatomic, copy) RCTPromiseResolveBlock saddleResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock saddleReject;

@property(nonatomic, copy) RCTPromiseResolveBlock tailboxResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock tailboxReject;
@end

@implementation NBIoTBleRNModule {
    bool hasListeners;
}
RCT_EXPORT_MODULE()
+ (BOOL)requiresMainQueueSetup {
    return YES;
}

- (NSArray<NSString *> *)supportedEvents {
    return @[
        @"connectionStateChange",
        @"connectDeviceOnError",
        @"bluetoothStateChanged"
    ];
}

- (void)startObserving {
    hasListeners = YES;
}

- (void)stopObserving {
    hasListeners = NO;
}

RCT_EXPORT_METHOD(connectDeviceByIMEI:(NSString *)imei macAddress: (NSString *)macaddress andDeviceKey:(NSString *)deviceKey) {
    NSLog(@"invoke from RN side: %@,%@,%@", imei, macaddress, deviceKey);
    [self.iotController connectDeviceByIMEI:imei macAddress:macaddress andDeviceKey:deviceKey];
}

RCT_EXPORT_METHOD(disconnect) {
    [self.iotController disconnect];
}

RCT_REMAP_METHOD(unlock, unlockWithResolver: (RCTPromiseResolveBlock)unlockResolve unlockRejecter: (RCTPromiseRejectBlock)unlockReject) {
    self.unlockResolve = unlockResolve;
    self.unlockReject = unlockReject;
    [self.iotController unlock];
}

RCT_REMAP_METHOD(lock, lockWithResolver: (RCTPromiseResolveBlock)lockResolve lockRejecter: (RCTPromiseRejectBlock)lockReject) {
    self.lockResolve = lockResolve;
    self.lockReject = lockReject;
    [self.iotController lock];
}

RCT_REMAP_METHOD(queryIoTInformation, queryIoTInfoWithResolver: (RCTPromiseResolveBlock)iotInfoResolve andRejecter: (RCTPromiseRejectBlock)iotInfoReject) {
    self.iotInfoResolve = iotInfoResolve;
    self.iotInfoReject = iotInfoReject;
    [self.iotController queryIoTInformation];
}

RCT_REMAP_METHOD(queryVehicleInformation, queryVehicleInfoWithResolver: (RCTPromiseResolveBlock)vehicleInfoResolve andRejecter: (RCTPromiseRejectBlock)vehicleInfoReject) {
    NSLog(@"%@", vehicleInfoReject);
    self.vehicleInfoResolve = vehicleInfoResolve;
    self.vehicleInfoReject = vehicleInfoReject;
    [self.iotController queryVehicleInformation];
}

RCT_REMAP_METHOD(openBatteryCover, openBatteryCoverWithResolver: (RCTPromiseResolveBlock)batteryCoverResolve andRejecter: (RCTPromiseRejectBlock)batteryCoverReject) {
    self.batteryCoverResolve = batteryCoverResolve;
    self.batteryCoverReject = batteryCoverReject;
    [self.iotController openBatteryCover];
}

RCT_REMAP_METHOD(openSaddle, openSaddleWithResolver: (RCTPromiseResolveBlock)saddleResolve andRejecter: (RCTPromiseRejectBlock)saddleReject) {
    self.saddleResolve = saddleResolve;
    self.saddleReject = saddleReject;
    [self.iotController openSaddle];
}

RCT_REMAP_METHOD(openTailBox, openTailboxWithResolver: (RCTPromiseResolveBlock)tailboxResolve andRejecter: (RCTPromiseRejectBlock)tailboxReject) {
    self.tailboxResolve = tailboxResolve;
    self.tailboxReject = tailboxReject;
    [self.iotController openTailBox];
}


# pragma mark - NBIoTBleDelegate
- (void)connectionStateChange:(ConnectionState)state {
    NSLog(@"connection state changed: %ld", state);
    if (!hasListeners) { return; }
    [self sendEventWithName:@"connectionStateChange" body: @(state)];
}

- (void)connectDeviceOnError:(NSError *)error {
    NSLog(@"connection on error: %@", error);
    if (!hasListeners) { return; }
    
    [self sendEventWithName:@"connectDeviceOnError" body:error];
}

/// bluetooth state
- (void)bluetoothStateChanged: (CBManagerState)state {
    if (!hasListeners) { return; }
    
    [self sendEventWithName:@"bluetoothStateChanged" body:@(state)];
}

/// lock result
/// @param isSuccess YES or NO
- (void)lockScooterResult: (BOOL)isSuccess withError: (NSError *_Nullable)error {
    if (isSuccess) {
        self.lockResolve([NSNumber numberWithBool:isSuccess]);
        return;
    }
    
    self.lockReject([NSString stringWithFormat:@"%ldd",error.code], error.description, error);
}

/// unlock result
/// @param isSuccess YES/NO
- (void)unlockScooterResult: (BOOL)isSuccess withError: (NSError *_Nullable)error {
    if (isSuccess) {
        self.unlockResolve([NSNumber numberWithBool:isSuccess]);
        return;
    }
    
    self.unlockReject([NSString stringWithFormat:@"%ldd",error.code], error.description, error);
}

/// query IoT information
/// @param iotInfo infomation model
/// @param error if error returned, the iotInfo will be nil.
- (void)queryIoTInfomationResult: (NBIoTInfo * _Nullable) iotInfo withError: (NSError *_Nullable)error {
    if (error) {
        self.iotInfoReject([NSString stringWithFormat:@"%ldd",error.code], error.description, error);
        return;
    }
    
    NSLog(@"%@", iotInfo);
    
    self.iotInfoResolve(@{
        @"voltage": [NSNumber numberWithInt:iotInfo.voltage],
        @"majorVersionNumber": [NSNumber numberWithInt:iotInfo.majorVersionNumber],
        @"minorVersionNumber": [NSNumber numberWithInt:iotInfo.minorVersionNumber],
        @"updateTimes": [NSNumber numberWithInt:iotInfo.updateTimes],
        @"isLocked": [NSNumber numberWithBool:iotInfo.isLocked]
    });
}

/// query scooter inforamtion finished
/// @param vehicleInfo vehicle information
/// @param error if error returned, the scooterInfo will be nil.
- (void)queryVehicleInformationResult: (NBVehicleInfo * _Nullable) vehicleInfo withError: (NSError *_Nullable)error {
    if (error) {
        self.vehicleInfoReject([NSString stringWithFormat:@"%ldd",error.code], error.description, error);
        return;
    }
    
    NSLog(@"%@", vehicleInfo);
    
    self.vehicleInfoResolve(@{
        @"powerPercent": [NSNumber numberWithInt:vehicleInfo.powerPercent],
        @"speedMode": @(vehicleInfo.speedMode),
        @"currentSpeed": @(vehicleInfo.currentSpeed),
        @"totalRange": @(vehicleInfo.totalRange),
        @"remainingRange": @(vehicleInfo.remainingRange)
    });
}


/// open battery cover result
/// @param isFinished YES/NO
- (void)openBatteryCoverResult: (BOOL)isFinished withError: (NSError *_Nullable)error {
    if (isFinished) {
        self.batteryCoverResolve([NSNumber numberWithBool:isFinished]);
        return;
    }
    
    self.batteryCoverReject([NSString stringWithFormat:@"%ldd",error.code], error.description, error);
}

/// open saddle result
/// @param isFinished YES/NO
- (void)openSaddleResult: (BOOL)isFinished withError: (NSError *_Nullable)error {
    if (isFinished) {
        self.saddleResolve([NSNumber numberWithBool:isFinished]);
        return;
    }
    
    self.saddleReject([NSString stringWithFormat:@"%ldd",error.code], error.description, error);
}


/// open tail box result
/// @param isFinished YES/NO
- (void)openTailboxResult: (BOOL)isFinished withError: (NSError *_Nullable)error {
    if (isFinished) {
        self.tailboxResolve([NSNumber numberWithBool:isFinished]);
        return;
    }
    
    self.tailboxReject([NSString stringWithFormat:@"%ldd",error.code], error.description, error);
}



- (NBIoTBle *)iotController {
    if (!_iotController) {
        _iotController = [[NBIoTBle alloc] init];
        _iotController.delegate = self;
    }
    return _iotController;
}

- (NSDictionary *)constantsToExport {
    return @{
        @"ConnectionStateDisconnected": @(ConnectionStateDisconnected),
        @"ConnectionStateConnected": @(ConnectionStateConnected),
        @"CBManagerStateUnknown": @(CBManagerStateUnknown),
        @"CBManagerStateResetting": @(CBManagerStateResetting),
        @"CBManagerStateUnsupported": @(CBManagerStateUnsupported),
        @"CBManagerStateUnauthorized": @(CBManagerStateUnauthorized),
        @"CBManagerStatePoweredOff": @(CBManagerStatePoweredOff),
        @"CBManagerStatePoweredOn": @(CBManagerStatePoweredOn)
    };
}
@end


@implementation RCTConvert(ConnectionState)

RCT_ENUM_CONVERTER(
                   ConnectionState,
                   (@{
                    @"ConnectionStateDisconnected" : @(ConnectionStateDisconnected),
                    @"ConnectionStateConnected" : @(ConnectionStateConnected)
                   }),
                   ConnectionStateDisconnected, integerValue
                   )

RCT_ENUM_CONVERTER(
                   CBManagerState,
                   (@{
                    @"CBManagerStateUnknown": @(CBManagerStateUnknown),
                    @"CBManagerStateResetting": @(CBManagerStateResetting),
                    @"CBManagerStateUnsupported": @(CBManagerStateUnsupported),
                    @"CBManagerStateUnauthorized": @(CBManagerStateUnauthorized),
                    @"CBManagerStatePoweredOff": @(CBManagerStatePoweredOff),
                    @"CBManagerStatePoweredOn": @(CBManagerStatePoweredOn)
                   }),
                   CBManagerStateUnknown,
                   integerValue
                   )
@end
