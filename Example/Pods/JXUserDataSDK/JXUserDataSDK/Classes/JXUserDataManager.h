//
//  JXUserDataManager.h
//  JXUserDataSDK
//
//  Created by roczp on 2021/8/10.
//

#import <Foundation/Foundation.h>
#import "JXUserDataSDK.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXUserDataManager : NSObject

+ (JXUserDataManager *)sharedInstance;
- (void)storeLoginInfo:(JXUserLoginInfo *)info;
- (void)storeCompanyInfo:(JXUserCompanyInfo *)info;
- (JXUserCompanyInfo *)companyInfo;
- (JXUserLoginInfo *)loginInfo;

@end

NS_ASSUME_NONNULL_END
