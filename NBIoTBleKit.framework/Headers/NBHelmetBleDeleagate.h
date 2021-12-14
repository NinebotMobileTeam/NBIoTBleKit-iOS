//
//  NBHelmetBleDeleagate.h
//  NBIoTBleKit
//
//  Created by yun.ao on 2021/11/10.
//

#ifndef NBHelmetBleDeleagate_h
#define NBHelmetBleDeleagate_h

@class NBVehicleInfo, NBHelmetLockInfo,NBHelmetLockStatus;
@protocol NBHelmetBleDeleagate <NBBaseDeleagate>

@optional
/// unlock result
/// @param isSuccess YES/NO
- (void)unlockHelmetLockResult: (BOOL)isSuccess withError: (NSError *_Nullable)error;

/// query helmet lock information result
/// @param helmetLockInfo infomation model
/// @param error if error returned, the helmetLockInfo will be nil.
- (void)queryHelmetLockInfomationResult: (NBHelmetLockInfo * _Nullable)helmetLockInfo withError: (NSError *_Nullable)error;

/// query helmet lock status
/// @param helmetLockStatus lock status model
/// @param error  if error returned, the helmetLockStatus will be nil.
- (void)queryHelmetLockStatusResult:(NBHelmetLockStatus * _Nullable)helmetLockStatus withError: (NSError *_Nullable)error;

@end

#endif /* NBHelmetBleDeleagate_h */
