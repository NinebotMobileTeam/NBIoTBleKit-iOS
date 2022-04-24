//
//  NBIoTBleRNModule.m
//  NBIoTKitReactNativeDemo
//
//  Created by yun.ao on 2022/4/21.
//

#import "NBIoTBleRNModule.h"

@interface NBIoTBleRNModule () <NBIoTBleDelegate>
@property(nonatomic, strong) NBIoTBle *iotController;
@property(nonatomic, copy) RCTPromiseResolveBlock unlockResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock unlockReject;
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
    NSLog(@"收到来自RN调用: %@,%@,%@", imei, macaddress, deviceKey);
    [self.iotController connectDeviceByIMEI:imei macAddress:macaddress andDeviceKey:deviceKey];
}

RCT_EXPORT_METHOD(disconnect) {
    [self.iotController disconnect];
}

RCT_REMAP_METHOD(unlock, unlockWithResolver: (RCTPromiseResolveBlock)unlockResolve unlockRejecter: (RCTPromiseRejectBlock)unlockReject) {
    [self.iotController unlock];
    
    self.unlockResolve = unlockResolve;
    self.unlockReject = unlockReject;
}

RCT_EXPORT_METHOD(lock) {
    [self.iotController lock];
}

RCT_EXPORT_METHOD(queryIoTInformation) {
    [self.iotController queryIoTInformation];
}

RCT_EXPORT_METHOD(queryVehicleInformation) {
    [self.iotController queryVehicleInformation];
}

RCT_EXPORT_METHOD(openBatteryCover) {
    [self.iotController openBatteryCover];
}

RCT_EXPORT_METHOD(openSaddle) {
    [self.iotController openSaddle];
}

RCT_EXPORT_METHOD(openTailBox) {
    [self.iotController openTailBox];
}


# pragma mark - NBIoTBleDelegate
- (void)connectionStateChange:(ConnectionState)state {
    if (!hasListeners) { return; }
    [self sendEventWithName:@"connectionStateChange" body: @(state)];
}

- (void)connectDeviceOnError:(NSError *)error {
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
    
}

/// query scooter inforamtion finished
/// @param vehicleInfo vehicle information
/// @param error if error returned, the scooterInfo will be nil.
- (void)queryVehicleInformationResult: (NBVehicleInfo * _Nullable) vehicleInfo withError: (NSError *_Nullable)error {
    
}


/// open battery cover result
/// @param isFinished YES/NO
- (void)openBatteryCoverResult: (BOOL)isFinished withError: (NSError *_Nullable)error {
    
}

/// open saddle result
/// @param isFinished YES/NO
- (void)openSaddleResult: (BOOL)isFinished withError: (NSError *_Nullable)error {
    
}


/// open tail box result
/// @param isFinished YES/NO
- (void)openTailboxResult: (BOOL)isFinished withError: (NSError *_Nullable)error {
    
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
