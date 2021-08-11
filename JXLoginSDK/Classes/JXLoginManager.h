//
//  JXLoginManager.h
//  JXLoginSDK
//
//  Created by roczp on 2021/8/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXLoginManager : NSObject

- (void)getLoginInfo:(void(^_Nullable)(NSError * _Nullable error, id _Nullable data))completion;

@end

NS_ASSUME_NONNULL_END
