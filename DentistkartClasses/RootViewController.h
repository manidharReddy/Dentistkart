//
//  RootViewController.h
//  iDate
//
//  Created by D M R on 07/08/12.
//  Copyright (c) 2012 iHubTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "MBProgressHUD.h"
#import <AudioToolbox/AudioServices.h>
#import <CoreLocation/CoreLocation.h>
//#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>
//#import "MNMBottomPullToRefreshManager.h"
//#import "SKPSMTPMessage.h"
//#import "NSData+Base64Additions.h"


@interface RootViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate>{
    
    NSString*str_usertyp;
    NSString*str_type;
    NSString*responseString;
    
    int registerfirstvalue,registersecondvalue;

    
}

@property (retain, nonatomic) IBOutlet UITextField *reenterpasswrd;

@property (retain, nonatomic) IBOutlet UILabel *already_login_lbl;

@property (retain, nonatomic) IBOutlet UIButton *login_here_lbl;
@property (retain, nonatomic) IBOutlet UILabel *dentalmegastore_lbl;

@property (retain, nonatomic) IBOutlet UILabel *dentistkart_lbl;

@property (retain, nonatomic) IBOutlet UIButton *cancel_btn;

@property (retain, nonatomic) IBOutlet UILabel *signup_lbl;

@property (retain, nonatomic) IBOutlet UIButton *register_btn;
@property (retain, nonatomic) IBOutlet UIImageView *pass_txtfeild_icon;
@property (retain, nonatomic) IBOutlet UIImageView *email_txtfeild_icon;

@property (retain, nonatomic) IBOutlet UIImageView *usrname_txtfeild_icon;
@property (retain, nonatomic) IBOutlet UILabel *signup_bar_lbl;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollsignup;
@property (retain, nonatomic) IBOutlet UIView *signup_view;
@property (retain, nonatomic) IBOutlet UIView *scroll_underview;
@property (retain, nonatomic) IBOutlet UITextField *username_txtfield;
@property (retain, nonatomic) IBOutlet UITextField *firstname_txtfield;

@property (retain, nonatomic) IBOutlet UITextField *email_txtfield;
@property (retain, nonatomic) IBOutlet UITextField *pass_txtfield;


- (IBAction)loginClick:(id)sender;





- (IBAction)cancel_btn_click:(id)sender;

////////////////////////////////////////////////////////

- (IBAction)signup:(id)sender;
- (IBAction)dissmisKeyboard:(id)sender;




@end
