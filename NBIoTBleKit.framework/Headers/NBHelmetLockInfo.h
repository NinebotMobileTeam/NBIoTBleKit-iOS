//
//  NBHelmetLockInfo.h
//  NBIoTBleKit
//
//  Created by zyf on 2021/11/12.
//

#import <Foundation/Foundation.h>

@interface NBHelmetLockInfo : NSObject
/// current battery power (0-100)
@property (nonatomic, assign) NSInteger powerPercent;

/// current version
@property (nonatomic, strong) NSString * _Nullable firmwareVersion;

@end

