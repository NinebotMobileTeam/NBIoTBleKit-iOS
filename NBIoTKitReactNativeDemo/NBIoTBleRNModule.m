//
//  NBIoTBleRNModule.m
//  NBIoTKitReactNativeDemo
//
//  Created by yun.ao on 2022/4/21.
//

#import "NBIoTBleRNModule.h"

@interface NBIoTBleRNModule () <NBIoTBleDelegate>
@property(nonatomic, strong) NBIoTBle *iotController;
@end

@implementation NBIoTBleRNModule
RCT_EXPORT_MODULE()

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

- (NSArray<NSString *> *)supportedEvents {
    return @[
        @"connectionStateChange"
    ];
}

RCT_EXPORT_METHOD(connectDeviceByIMEI:(NSString *)imei macAddress: (NSString *)macaddress andDeviceKey:(NSString *)deviceKey) {
    NSLog(@"收到来自RN调用: %@,%@,%@", imei, macaddress, deviceKey);
    [self.iotController connectDeviceByIMEI:imei macAddress:macaddress andDeviceKey:deviceKey];
}

RCT_EXPORT_METHOD(disconnect) {
    [self.iotController disconnect];
}

RCT_EXPORT_METHOD(rnUnlock) {
    [self.iotController unlock];
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

- (void)connectionStateChange:(ConnectionState)state {
    [self sendEventWithName:@"connectionStateChange" body: [NSNumber numberWithInt:state]];
}


- (NBIoTBle *)iotController {
    if (!_iotController) {
        _iotController = [[NBIoTBle alloc] init];
        _iotController.delegate = self;
    }
    return _iotController;
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
@end
