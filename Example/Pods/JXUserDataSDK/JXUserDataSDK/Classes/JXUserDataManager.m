//
//  JXUserDataManager.m
//  JXUserDataSDK
//
//  Created by roczp on 2021/8/10.
//

#import "JXUserDataManager.h"

static NSString * const JXUserLoginInfoKey = @"JXUserLoginInfoKey";
static NSString * const JXCompanyInfoKey = @"JXCompanyInfoKey";

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
    [[NSUserDefaults standardUserDefaults] setObject:info forKey:JXUserLoginInfoKey];
}

- (void)storeCompanyInfo:(JXUserCompanyInfo *)info {
    // TODO: 存储逻辑，数据库，归档，document...
    //demo 随便存取
    [[NSUserDefaults standardUserDefaults] setObject:info forKey:JXCompanyInfoKey];
}

- (JXUserCompanyInfo *)companyInfo {
    // TODO: 存储逻辑，数据库，归档，document...
    //demo 随便存取
    return [[NSUserDefaults standardUserDefaults] objectForKey:JXCompanyInfoKey];
}

- (JXUserLoginInfo *)loginInfo {
    // TODO: 存储逻辑，数据库，归档，document...
    //demo 随便存取
    return [[NSUserDefaults standardUserDefaults] objectForKey:JXUserLoginInfoKey];
}

@end
