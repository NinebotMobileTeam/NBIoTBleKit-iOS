//
//  NBHelmetBle.h
//  NBIoTBleKit
//
//  Created by yun.ao on 2021/11/10.
//

#import <NBIoTBleKit/NBIoTBleKit.h>
#import "NBHelmetBleDeleagate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NBHelmetBle : NBBaseBleController
@property (nonatomic, weak) id<NBHelmetBleDeleagate> delegate;


/// connect helmet lock
/// @param macaddress macadress
/// @param deviceKey deviceKey
- (void)connectDeviceByMacaddress:(NSString *)macaddress andDeviceKey:(NSString *)deviceKey;

/// unlock helmet lock
- (void)unlock;

/// query lock status
- (void)queryLockStatus;

/// query lock information
- (void)queryLockInfo;

@end

NS_ASSUME_NONNULL_END
