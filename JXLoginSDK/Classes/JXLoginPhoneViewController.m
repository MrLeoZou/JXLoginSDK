//
//  JXLoginPhoneViewController.m
//  JXLoginSDK
//
//  Created by roczp on 2021/8/9.
//

#import "JXLoginPhoneViewController.h"
#import <JXBifrost/BifrostHeader.h>
#import <JXUserDataSDK/JXUserDataSDK.h>

static NSString * const kRouteProfilePage = @"//Profile/Profile_page";

@interface JXLoginPhoneViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTextFile;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextFile;
@property (weak, nonatomic) IBOutlet UIButton *goBtn;
- (IBAction)goBtnAction:(id)sender;

@end

@implementation JXLoginPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.goBtn.layer.cornerRadius = 5;
    self.goBtn.layer.masksToBounds = YES;
}

- (IBAction)goBtnAction:(id)sender {
    if (self.phoneTextFile.text.length <= 0 || self.pwdTextFile.text.length <= 0) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"请输入正确账号/密码" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertVC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertVC animated:YES completion:nil];
        return;
    }
    //登录逻辑
    
    //成功后用户数据下层
    [self storeUserData];
    
    //进入个人页
    [Bifrost handleURL:kRouteProfilePage];
}

- (void)storeUserData {
    JXUserLoginInfo *info = [[JXUserLoginInfo alloc] init];
    info.userID = self.phoneTextFile.text;
    info.userName = self.pwdTextFile.text;
    [[JXUserDataManager sharedInstance] storeLoginInfo:info];
}

@end
