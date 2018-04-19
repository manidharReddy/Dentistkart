//
//  ForgotPassVC.m
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 24/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import "ForgotPassVC.h"
//#import "ASIHTTPRequest.h"
//#import "ASIFormDataRequest.h"
//#import"JSON1.h"
#import "AppDelegate.h"
#import "ProductsViewController.h"
#import "MyOrdersVC.h"
@interface ForgotPassVC ()

@end

@implementation ForgotPassVC
//@synthesize tab_view,forgotpass_view,forgotpass_bar_lbl,forgot_pass_subttl_lbl,forgotpass_lbl,forgot_txtfeild,getpassword_btn,drop_down_view,login_or_signup_btn,cancel_or_return_bnt,whishlist_btn,myorders_btn,profile_btn,myaddress_btn,policies_btn,cantactus_btn,drop_down_btn_pro,promotions_lbl,products_down_lbl,orders_down_lbl,cart_down_lbl,more_down_lbl,cancel_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dentistkart_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/10];
    self.forgot_pass_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.forgottxtfeild.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.submit_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.dentist_mega_store_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    
    
    
    
}
-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    
    [_forgottxtfeild release];
    [_forgot_pass_lbl release];
    [_submit_btn release];
    [_dentistkart_lbl release];
    [_dentist_mega_store_lbl release];
        [super dealloc];
}

- (IBAction)forgotSubmit:(id)sender {
}
@end
