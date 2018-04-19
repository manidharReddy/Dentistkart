//
//  MyAccountEditVC.h
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 30/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAccountEditVC : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>{
    NSString*responseString;
    
    NSString*block_store_str;
    NSString*custmType_store_str;
    NSString*comment_store_str;
    NSString*type_store_str;
    int update_check,cidvalue_store;
    int updated;
    
    
    
}
@property (retain, nonatomic) IBOutlet UIButton *cartitemscount_btn;
@property (retain, nonatomic) IBOutlet UIView *leftmenu_underview;
@property (retain, nonatomic) IBOutlet UIView *show_user_not_log_view;
@property (retain, nonatomic) IBOutlet UILabel *dentistkartname_lbl;

@property (retain, nonatomic) IBOutlet UILabel *mobile_lbl;
@property (retain, nonatomic) IBOutlet UILabel *email_lbl;
@property (retain, nonatomic) IBOutlet UIButton *profile_icon;
@property (retain, nonatomic) IBOutlet UIView *tab_view;
@property (retain, nonatomic) IBOutlet UIView *modify_account_view;
@property (retain, nonatomic) IBOutlet UILabel *modify_account_bar_lbl;
@property (retain, nonatomic) IBOutlet UILabel *myprofile_lbl;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollsignup;

@property (retain, nonatomic) IBOutlet UIButton *modify_btn;
@property (retain, nonatomic) IBOutlet UIButton *cancel_btn;

@property (retain, nonatomic) IBOutlet UILabel *logged_usrname_show_lbl;


@property (retain, nonatomic) IBOutlet UIButton *drop_down_btn_pro;

/////////////////Drop Down///////////////////////////
@property (retain, nonatomic) IBOutlet UIView *drop_down_view;
@property (retain, nonatomic) IBOutlet UIButton *login_or_signup_btn;
@property (retain, nonatomic) IBOutlet UIButton *cancel_or_return_bnt;
@property (retain, nonatomic) IBOutlet UIButton *whishlist_btn;
@property (retain, nonatomic) IBOutlet UIButton *myorders_btn;
@property (retain, nonatomic) IBOutlet UIButton *profile_btn;
@property (retain, nonatomic) IBOutlet UIButton *myaddress_btn;
@property (retain, nonatomic) IBOutlet UIButton *policies_btn;
@property (retain, nonatomic) IBOutlet UIButton *cantactus_btn;
- (IBAction)login_signup_click:(id)sender;

- (IBAction)cancel_return_click:(id)sender;

- (IBAction)whishlist_click:(id)sender;
- (IBAction)myorders_click:(id)sender;

- (IBAction)profile_click:(id)sender;
- (IBAction)myaddress_click:(id)sender;
- (IBAction)policies_click:(id)sender;
- (IBAction)contactus_click:(id)sender;
- (IBAction)drop_down_click_user:(id)sender;

////////////////////////////////////////////////////

///////////////////////////////////////////////////

@property (retain, nonatomic) IBOutlet UILabel *promotions_lbl;

@property (retain, nonatomic) IBOutlet UILabel *products_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orders_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *cart_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *more_down_lbl;

////////////////////////////////////////////////////////

@property (retain, nonatomic) IBOutlet UITextField *firstname_txtfeild;
@property (retain, nonatomic) IBOutlet UITextField *lastname_txtfeild;
@property (retain, nonatomic) IBOutlet UITextField *password_txtfeild;
@property (retain, nonatomic) IBOutlet UITextField *mobile_txtfeild;

@property (retain, nonatomic) IBOutlet UITextField *street_txtfeild;
@property (retain, nonatomic) IBOutlet UITextField *pincode_txtfeild;


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

- (IBAction)searchBtnClick:(id)sender;

/////Drop down icon///////////////////////
@property (retain, nonatomic) IBOutlet UIImageView *logoutimgicon_imgview;
@property (retain, nonatomic) IBOutlet UIImageView *profile_dropdw_imgview;
@property (retain, nonatomic) IBOutlet UIImageView *usernme_imgicon_imgview;


@property (retain, nonatomic) IBOutlet UIButton *logout_btn;

- (IBAction)logoutUser:(id)sender;
-(void)logOut;
- (IBAction)closeusermenupop:(id)sender;

- (IBAction)cartPageClick:(id)sender;

- (IBAction)products_btn_click:(id)sender;

- (IBAction)cart_btn_click:(id)sender;

- (IBAction)dissmisKeyboard:(id)sender;

@end
