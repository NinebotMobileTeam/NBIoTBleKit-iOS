//
//  NBBaseBleController.h
//  NBIoTBleKit
//
//  Created by yun.ao on 2021/11/8.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "NBConnectionState.h"
#import "NBCommandType.h"


NS_ASSUME_NONNULL_BEGIN

@class NBCommandFactory;

@interface NBBaseBleController : NSObject {
    @package
        NBCommandFactory *commandFactory;
}

@property (nonatomic, strong) NSString *deviceKey; //蓝牙秘钥

@property (nonatomic, assign) BOOL isConnecting;
/// 蓝牙通信key
@property (nonatomic, assign) Byte com_key;

- (void)connectPeripheral: (CBPeripheral *)peripheral;

- (void)scanPeripherals;

- (void)disconnect;

- (void)sendCommand:(NSData *)data;

- (BOOL)checkAuthBy: (NBCommandType)type;

- (BOOL)isTargetDevices: (NSString *)imei macAddress: (NSString *)macAddress fromData: (NSDictionary *)dictionary;

- (BOOL)matchMacAddress: (NSString *)macAddress fromData: (NSDictionary *)dictionary;

- (BOOL)matchIMEI: (NSString *)imei fromData: (NSDictionary *)dictionary;

- (void)connectionStateChanged: (ConnectionState)state;

- (void)bluetoothStateChanged: (CBManagerState)state;

- (void)didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary<NSString *,id> *)advertisementData
                         RSSI:(NSNumber *)RSSI;

- (void)didRecieveResponse: (nonnull CBCharacteristic *)characteristic;

- (NSData *_Nullable)makeCommandBy: (NBCommandType)commandType;
@end

NS_ASSUME_NONNULL_END
