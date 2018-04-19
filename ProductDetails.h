//
//  ProductDetails.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 21/10/15.
//  Copyright © 2015 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartVC.h"
@interface ProductDetails : UIViewController<UIScrollViewDelegate>{
    UIImageView*imgview;
    CartVC*cvc;
    NSString*url_path_share_str;
    NSString*product_available_str;
}
@property (retain, nonatomic) IBOutlet UILabel *spprice_lbl;

@property (retain, nonatomic) IBOutlet UILabel *avialable_lbl;

@property (retain, nonatomic) IBOutlet UILabel *productdec_lbl;
@property (retain, nonatomic) IBOutlet UIButton *cartitemscount_btn;
@property (retain, nonatomic) IBOutlet UIView *leftmenu_underview;
@property (retain, nonatomic) IBOutlet UIView *show_user_not_log_view;
@property (retain, nonatomic) IBOutlet UILabel *dentistkartname_lbl;

@property (retain, nonatomic) IBOutlet UILabel *product_name_lbl;
@property (retain, nonatomic) IBOutlet UILabel *product_brand_name_lbl;
@property (retain, nonatomic) IBOutlet UIImageView *product_big_imageview;
@property (retain, nonatomic) IBOutlet UIScrollView *scroll_addsmallimg;
@property (retain, nonatomic) IBOutlet UITextView *short_desc_txtview;
@property (retain, nonatomic) IBOutlet UILabel *price_lbl;
@property (retain, nonatomic) IBOutlet UILabel *availability_lbl;
@property (retain, nonatomic) IBOutlet UIButton *share_btn;
@property (retain, nonatomic) IBOutlet UIButton *addtocart_btn;
@property (retain, nonatomic) IBOutlet UIButton *buy_btn;
@property (retain, nonatomic) IBOutlet UITextView *prodct_long_desc_txtview;
- (IBAction)shareClick:(id)sender;
- (IBAction)addtocartClick:(id)sender;
- (IBAction)buyClick:(id)sender;
@property (retain, nonatomic) IBOutlet UIScrollView *mainscrollview;
@property (retain, nonatomic) IBOutlet UIView *display_view;
@property (retain, nonatomic) IBOutlet UIView *subimg_view;

@property (retain, nonatomic) IBOutlet UIView *subviewinimg;


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

@end
