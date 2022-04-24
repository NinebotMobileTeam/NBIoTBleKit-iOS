//
//  NBHelmetRNModule.m
//  NBIoTKitReactNativeDemo
//
//  Created by yun.ao on 2022/4/24.
//

#import "NBHelmetRNModule.h"

@interface NBHelmetRNModule () <NBHelmetBleDeleagate>
@property(nonatomic, strong) NBHelmetBle *iotController;

// unlock
@property(nonatomic, copy) RCTPromiseResolveBlock unlockResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock unlockReject;

// lock status
@property(nonatomic, copy) RCTPromiseResolveBlock lockStatusResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock lockStatusReject;

// lock info
@property(nonatomic, copy) RCTPromiseResolveBlock lockInfoResolve;
@property(nonatomic, copy) RCTPromiseRejectBlock lockInfoReject;

@end

@implementation NBHelmetRNModule{
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

RCT_EXPORT_METHOD(connectDeviceByMacAddress: (NSString *)macaddress andDeviceKey:(NSString *)deviceKey) {
    NSLog(@"invoke from RN side: %@,%@", macaddress, deviceKey);
    [self.iotController connectDeviceByMacaddress:macaddress andDeviceKey:deviceKey];
}

RCT_EXPORT_METHOD(disconnect) {
    [self.iotController disconnect];
}

RCT_REMAP_METHOD(unlock, unlockWithResolver: (RCTPromiseResolveBlock)unlockResolve unlockRejecter: (RCTPromiseRejectBlock)unlockReject) {
    self.unlockResolve = unlockResolve;
    self.unlockReject = unlockReject;
    [self.iotController unlock];
}

RCT_REMAP_METHOD(lock, lockStatusResolver: (RCTPromiseResolveBlock)lockStatusResolve lockRejecter: (RCTPromiseRejectBlock)lockStatusReject) {
    self.lockStatusResolve = lockStatusResolve;
    self.lockStatusReject = lockStatusReject;
    [self.iotController queryLockStatus];
}

RCT_REMAP_METHOD(queryIoTInformation, queryLockInfoWithResolver: (RCTPromiseResolveBlock)lockInfoResolve andRejecter: (RCTPromiseRejectBlock)lockInfoReject) {
    self.lockInfoResolve = lockInfoResolve;
    self.lockInfoReject = lockInfoReject;
    [self.iotController queryLockInfo];
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

/// unlock result
/// @param isSuccess YES/NO
- (void)unlockHelmetLockResult: (BOOL)isSuccess withError: (NSError *_Nullable)error {
    if (isSuccess) {
        self.unlockResolve([NSNumber numberWithBool:isSuccess]);
        return;
    }
    
    self.unlockReject([NSString stringWithFormat:@"%ldd",error.code], error.description, error);
}

/// query helmet lock information result
/// @param helmetLockInfo infomation model
/// @param error if error returned, the helmetLockInfo will be nil.
- (void)queryHelmetLockInfomationResult: (NBHelmetLockInfo * _Nullable)helmetLockInfo withError: (NSError *_Nullable)error {
    if (error) {
        self.lockInfoReject([NSString stringWithFormat:@"%ldd",error.code], error.description, error);
        return;
    }
    
    NSLog(@"%@", helmetLockInfo);
    
    self.lockInfoResolve(helmetLockInfo);
}

/// query helmet lock status
/// @param helmetLockStatus lock status model
/// @param error  if error returned, the helmetLockStatus will be nil.
- (void)queryHelmetLockStatusResult:(NBHelmetLockStatus * _Nullable)helmetLockStatus withError: (NSError *_Nullable)error {
    if (error) {
        self.lockStatusReject([NSString stringWithFormat:@"%ldd",error.code], error.description, error);
        return;
    }
    
    NSLog(@"%@", helmetLockStatus);
    
    self.lockStatusResolve(helmetLockStatus);
}

- (NBHelmetBle *)iotController {
    if (!_iotController) {
        _iotController = [[NBHelmetBle alloc] init];
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
