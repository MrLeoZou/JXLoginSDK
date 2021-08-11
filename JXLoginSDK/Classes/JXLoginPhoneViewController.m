//
//  JXLoginPhoneViewController.m
//  JXLoginSDK
//
//  Created by roczp on 2021/8/9.
//

#import "JXLoginPhoneViewController.h"
#import "JXLoginService.h"
#import <JXBifrost/BifrostHeader.h>
#import <JXUserDataSDK/JXUserDataSDK.h>

static NSString * const kRouteProfilePage = @"//Profile/Profile_page";

@interface JXLoginPhoneViewController ()

@property (nonatomic, strong) NSDictionary *parameters;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFile;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextFile;
@property (weak, nonatomic) IBOutlet UIButton *goBtn;
- (IBAction)goBtnAction:(id)sender;

@end

@implementation JXLoginPhoneViewController

+ (void)load {
    [Bifrost bindURL:kRouteLoginPage toHandler:^id _Nullable(NSDictionary * _Nullable parameters) {
        JXLoginPhoneViewController *vc = [[JXLoginPhoneViewController alloc] init];
        vc.parameters = parameters;
        return vc;
    }];
}

- (void)loadView {
    self.view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil].firstObject;
}

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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"登陆成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertVC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertVC animated:YES completion:nil];
    });
}

- (void)storeUserData {
    JXUserLoginInfo *info = [[JXUserLoginInfo alloc] init];
    info.userID = self.phoneTextFile.text;
    info.userName = self.pwdTextFile.text;
    [[JXUserDataManager sharedInstance] storeLoginInfo:info];
}

@end
