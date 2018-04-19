//
//  LoginViewController.h
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 23/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController{

}

@property (retain, nonatomic) IBOutlet UILabel *show_passwrd_lbl;

@property (retain, nonatomic) IBOutlet UILabel *dentistkart_lbl;
@property (retain, nonatomic) IBOutlet UILabel *dentalmegastore_lbl;

@property (retain, nonatomic) IBOutlet UILabel *login_lbl;
@property (retain, nonatomic) IBOutlet UILabel *login_subtitl_lbl;

@property (retain, nonatomic) IBOutlet UIView *login_view;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollslogin;
@property (retain, nonatomic) IBOutlet UIView *scroll_underview;
@property (retain, nonatomic) IBOutlet UILabel *login_bar_lbl;
@property (retain, nonatomic) IBOutlet UIButton *forgotpass_link_btn;
@property (retain, nonatomic) IBOutlet UIButton *signup_link_btn;
@property (retain, nonatomic) IBOutlet UIButton *login_btn;
@property (retain, nonatomic) IBOutlet UITextField *username_txtfield;
@property (retain, nonatomic) IBOutlet UIButton *show_pass_btn;
@property (retain, nonatomic) IBOutlet UITextField *pass_txtfield;
@property (retain, nonatomic) IBOutlet UIView *tab_view;
- (IBAction)forgot_pass_click:(id)sender;
- (IBAction)signup_link_click:(id)sender;
- (IBAction)login_btn_click:(id)sender;
- (IBAction)show_pass_btn_click:(id)sender;
- (IBAction)dissmisKeyboard:(id)sender;
-(void)profileView;

@end
