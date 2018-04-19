//
//  MyAccountView.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 30/12/15.
//  Copyright © 2015 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAccountView : UIViewController{
    UIActivityIndicatorView *indicatorroll;
}
@property (retain, nonatomic) IBOutlet UIView *profilenamedis_view;


@property (retain, nonatomic) IBOutlet UIImageView *profile_imgview;

@property (retain, nonatomic) IBOutlet UIView *latestorderview;
@property (retain, nonatomic) IBOutlet UIView *myorders_view;

@property (retain, nonatomic) IBOutlet UILabel *qtyvalue_lbl;
@property (retain, nonatomic) IBOutlet UILabel *statusvalue_lbl;
@property (retain, nonatomic) IBOutlet UILabel *statustitle_lbl;
@property (retain, nonatomic) IBOutlet UILabel *datetitle_lbl;
@property (retain, nonatomic) IBOutlet UILabel *datevalue_lbl;
@property (retain, nonatomic) IBOutlet UILabel *qtytitle_lbl;
@property (retain, nonatomic) IBOutlet UILabel *ordertotal_lbl;
@property (retain, nonatomic) IBOutlet UILabel *ordertotalvalue_lbl;
@property (retain, nonatomic) IBOutlet UIButton *nextbtn;

@property (retain, nonatomic) IBOutlet UILabel *orderid_lbl;

@property (retain, nonatomic) IBOutlet UIView *scroll_underview;
@property (retain, nonatomic) IBOutlet UIView *myaddrview_view;
@property (retain, nonatomic) IBOutlet UIButton *viewmoreaddress_btn;
@property (retain, nonatomic) IBOutlet UILabel *myorders_lbl;
@property (retain, nonatomic) IBOutlet UIButton *viewallorders_btn;
@property (retain, nonatomic) IBOutlet UILabel *myaddress_btn;

@property (retain, nonatomic) IBOutlet UIButton *cartitemscount_btn;
/////////////////////////////////////side menu//////////////////////////
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

@property (retain, nonatomic) IBOutlet UITextView *addr_txtview;

@property (retain, nonatomic) IBOutlet UIButton *left_menu_brand_btn;
@property (retain, nonatomic) IBOutlet UIButton *left_menu_promotions_btn;
@property (retain, nonatomic) IBOutlet UIButton *left_menu_polices_btn;
@property (retain, nonatomic) IBOutlet UIButton *left_menu_contact_btn;
@property (retain, nonatomic) IBOutlet UIButton *left_menu_logout_btn;
@property (retain, nonatomic) IBOutlet UIButton *edit_btn;

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


//////////////////MyAccount connections///////////////////

@property (retain, nonatomic) IBOutlet UILabel *usernamemyacct;
@property (retain, nonatomic) IBOutlet UILabel *usremailmyacct;
@property (retain, nonatomic) IBOutlet UILabel *neworders_lbl;
@property (retain, nonatomic) IBOutlet UILabel *address_lbl;
@property (retain, nonatomic) IBOutlet UITextField *subscriber_txtbox;

- (IBAction)editProfileClick:(id)sender;
- (IBAction)viewallOrders_Click:(id)sender;
- (IBAction)viewMoreAddressClick:(id)sender;

- (IBAction)submitSubscribeClick:(id)sender;

- (IBAction)cartPageClick:(id)sender;
- (IBAction)searchBtnClick:(id)sender;
- (IBAction)arrowClick:(id)sender;

@end
