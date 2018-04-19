//
//  ContactUsVC.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 27/02/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactUsVC : UIViewController

/////////////////////////Local Connections//////////////////
@property (retain, nonatomic) IBOutlet UILabel *contactus_lbl;
@property (retain, nonatomic) IBOutlet UILabel *address_lbl;

@property (retain, nonatomic) IBOutlet UITextView *address_txtview;


@property (retain, nonatomic) IBOutlet UILabel *phone_lbl;
@property (retain, nonatomic) IBOutlet UITextView *phone_txtview;

@property (retain, nonatomic) IBOutlet UILabel *email_lbl;
@property (retain, nonatomic) IBOutlet UILabel *email_txt_lbl;

///////////////////////////////////Menu Items///////////////////////////


@property (retain, nonatomic) IBOutlet UIButton *cartitemscount_btn;
@property (retain, nonatomic) IBOutlet UIView *leftmenu_underview;
@property (retain, nonatomic) IBOutlet UIView *show_user_not_log_view;
@property (retain, nonatomic) IBOutlet UILabel *dentistkartname_lbl;



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

- (IBAction)searchBtnClick:(id)sender;



////////////////////////////////ContactUs////////////////////////////////
@property (retain, nonatomic) IBOutlet UITextField *fullname_txtfeild;
@property (retain, nonatomic) IBOutlet UITextField *email_txtfeild;
@property (retain, nonatomic) IBOutlet UITextField *subject_txtfeild;
@property (retain, nonatomic) IBOutlet UITextView *contactus_txtview;
@property (retain, nonatomic) IBOutlet UIButton *sendmsg_btn;
//@property (retain, nonatomic) IBOutlet UILabel *contactus_lbl;
@property (retain, nonatomic) IBOutlet UILabel *contact_lbl;





- (IBAction)sendmsgClick:(id)sender;


////////////////////////////////////////////////

@end
