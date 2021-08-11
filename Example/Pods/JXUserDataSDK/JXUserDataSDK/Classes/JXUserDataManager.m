//
//  JXUserDataManager.m
//  JXUserDataSDK
//
//  Created by roczp on 2021/8/10.
//

#import "JXUserDataManager.h"

static NSString * const JXUserLoginInfoKey = @"JXUserLoginInfoKey";
static NSString * const JXCompanyInfoKey = @"JXCompanyInfoKey";

@interface JXUserDataManager ()

// TODO: demo随便存取，实际上不会用属性。
@property (nonatomic, strong) JXUserLoginInfo *userInfo;
@property (nonatomic, strong) JXUserCompanyInfo *company;

@end

@implementation JXUserDataManager

static JXUserDataManager *manager = nil;
+ (JXUserDataManager *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[JXUserDataManager alloc] init];
    });
    return manager;
}

- (void)storeLoginInfo:(JXUserLoginInfo *)info {
    // TODO: 存储逻辑，数据库，归档，document...
    //demo 随便存取
    self.userInfo = info;
}

- (void)storeCompanyInfo:(JXUserCompanyInfo *)info {
    // TODO: 存储逻辑，数据库，归档，document...
    //demo 随便存取
    self.company = info;
}

- (JXUserCompanyInfo *)companyInfo {
    // TODO: 存储逻辑，数据库，归档，document...
    //demo 随便存取
    return _company;
}

- (JXUserLoginInfo *)loginInfo {
    // TODO: 存储逻辑，数据库，归档，document...
    //demo 随便存取
    return _userInfo;
}

@end
