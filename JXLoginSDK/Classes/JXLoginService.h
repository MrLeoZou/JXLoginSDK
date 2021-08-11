//
//  JXLoginService.h
//  JXLoginSDK
//
//  Created by roczp on 2021/8/10.
//

#ifndef JXLoginService_h
#define JXLoginService_h

#pragma mark - Notifications

static NSNotificationName _Nonnull kNotificationLoginSuccess = @"kNotificationLoginSuccess";

#pragma mark - URL routers

static NSString * _Nonnull const kRouteLoginPage = @"//Login/Login_page";

#pragma mark - Model Protocols

@protocol JXLoginInfoProtocol <NSObject>

- (NSString *_Nullable)account;

@end

#pragma mark - Manager Protocol

@protocol JXLoginProtocol <NSObject>

- (void)getLoginInfo:(void(^_Nullable)(NSError * _Nullable error, id _Nullable data))completion;

@end

#endif /* JXLoginService_h */
