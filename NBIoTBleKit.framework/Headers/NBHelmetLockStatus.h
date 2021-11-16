//
//  NBHelmetLockStatus.h
//  NBIoTBleKit
//
//  Created by zyf on 2021/11/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NBHelmetLockStatus : NSObject
/// voltage
@property (nonatomic, assign) NSInteger voltage;

/// locked status
@property (nonatomic, assign) BOOL isLocked;

@end

NS_ASSUME_NONNULL_END
