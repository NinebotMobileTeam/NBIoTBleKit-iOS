//
//  NBBaseDeleagate.h
//  NBIoTBleKit
//
//  Created by yun.ao on 2021/11/9.
//


#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "NBConnectionState.h"



@protocol NBBaseDeleagate <NSObject>

@optional
/// bluetooth state
- (void)bluetoothStateChanged: (CBManagerState)state;

/// occurred error when try to connect device
/// @param error NBError
- (void)connectDeviceOnError: (NSError *_Nullable)error;


/// connection status changed
/// @param state ConnectionState
- (void)connectionStateChange: (ConnectionState) state;
@end

