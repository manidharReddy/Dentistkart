//
//  PaymentConfirmVC.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 18/02/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentConfirmVC : UIViewController
@property (retain, nonatomic) IBOutlet UIButton *cartitemscount_btn;
@property (retain, nonatomic) IBOutlet UIView *leftmenu_underview;
@property (retain, nonatomic) IBOutlet UIView *show_user_not_log_view;
@property (retain, nonatomic) IBOutlet UILabel *dentistkartname_lbl;

///////////////////////////////Side menu ////////////////////////////

@property (retain, nonatomic) IBOutlet UIView *leftmenulist_view;
@property (retain, nonatomic) IBOutlet UIButton *left_menu_profile_img;
@property (retain, nonatomic) IBOutlet UILabel *left_menu_profile_name;
@property (retain, nonatomic) IBOutlet UILabel *left_menu_profile_email_lbl;

@property (retain, nonatomic) IBOutlet UIButton *left_menu_home_btn;

@property (retain, nonatomic) IBOutlet UIButton *left_menu_category_btn;


@property (retain, nonatomic) IBOutlet UIButton *left_menu_brand_btn;
@property (retain, nonatomic) IBOutlet UIButton *left_menu_promotions_btn;
@property (retain, nonatomic) IBOutlet UIButton *left_menu_polices_btn;
@property (retain, nonatomic) IBOutlet UIButton *left_menu_contact_btn;
@property (retain, nonatomic) IBOutlet UIButton *left_menu_logout_btn;
-(void)confirmPaymentResult:(NSDictionary*)paymentresult :(int)ordernumber;
@property (retain, nonatomic) IBOutlet UIButton *drop_down_btn_pro;
////////////////////////////////////////////////////////

/////////////////////////Left Menu Buttons Action//////////////////
- (IBAction)leftMenuHomeClick:(id)sender;
- (IBAction)leftMenuCategoryClick:(id)sender;
- (IBAction)leftMenuBrandsClick:(id)sender;
- (IBAction)leftMenuPromotionClick:(id)sender;
- (IBAction)leftMenuPolicesClick:(id)sender;
- (IBAction)leftMenuContactusClick:(id)sender;
- (IBAction)leftMenuLogoutClick:(id)sender;

//////////////////////////////////////////////////////////////////
- (IBAction)cartPageClick:(id)sender;


////////////////////Payment ConfirmVC Objects//////////////////////
@property (retain, nonatomic) IBOutlet UIImageView *successicon;
@property (retain, nonatomic) IBOutlet UILabel *paymentcomplete_lbl;
@property (retain, nonatomic) IBOutlet UITextView *payment_txtview;
@property (retain, nonatomic) IBOutlet UILabel *ordernumber_lbl;
@property (retain, nonatomic) IBOutlet UIButton *ordernumber_show;

@property (retain, nonatomic) IBOutlet UIImageView *thankyou_icon;
@property (retain, nonatomic) IBOutlet UIButton *gotohome_btn;
- (IBAction)gobuttonclick:(id)sender;

///////////////////////////End/////////////////////////////////////
@end
