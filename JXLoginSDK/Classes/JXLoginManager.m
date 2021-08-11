//
//  JXLoginManager.m
//  JXLoginSDK
//
//  Created by roczp on 2021/8/9.
//

#import "JXLoginManager.h"
#import <JXBifrost/BifrostHeader.h>
#import "JXLoginService.h"

@interface JXLoginManager ()<BifrostModuleProtocol, JXLoginProtocol>

@end

@implementation JXLoginManager

+ (void)load {
    BFRegister(JXLoginProtocol);
}

static JXLoginManager *manager = nil;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[JXLoginManager alloc] init];
    });
    return manager;
}

- (void)setup {}

- (void)getLoginInfo:(void (^)(NSError * _Nullable, id _Nullable))completion {
    //TODO: 逻辑代码
}

@end
