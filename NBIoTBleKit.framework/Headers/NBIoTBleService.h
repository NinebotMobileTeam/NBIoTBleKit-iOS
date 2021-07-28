//
//  NBIoTBleService.h
//  NBIoTBleKit
//
//  Created by yun.ao on 2021/7/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^NBRegisterBlock)(BOOL isSuccess, NSError *_Nullable error);

@interface NBIoTBleService : NSObject
+ (instancetype)shared;

@property (nonatomic, assign) BOOL isDebugEnabled;


/// Registe sdk, should be called first
/// You can get platformCode and secret key from Dashboard
/// @param operatorCode patform code
/// @param secret secret key
/// @param completionHanlder called when the rigiste is finished.
- (void)startWithOperatorCode: (NSString *)operatorCode andSecret: (NSString *)secret completionHanlder: (NBRegisterBlock)completionHanlder;

/// enable the debug mode, when it's enbled, SDK will print the log
/// @param isEnabled YES/NO default is NO
- (void)enbleDebugMode: (BOOL)isEnabled;
@end

NS_ASSUME_NONNULL_END
