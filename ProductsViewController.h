//
//  ProductsViewController.h
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 18/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartVC.h"
@interface ProductsViewController : UIViewController<NSURLConnectionDelegate,UITextFieldDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate>{

    /////////////////// Latest Product Info Temp Store////////////////
    NSMutableArray *latestproductids_arr;
    NSMutableArray*latest_product_name_arr;
    NSMutableArray*latest_product_imgarr;
    NSMutableArray*latest_product_price_arr;
    NSMutableArray*latest_product_short_desc_arr;
    NSMutableArray*latest_product_long_desc_arr;
    NSMutableArray*latest_product_special_price_arr;
    ///////////////////////////////////////////////////////////
    
    
    /////////////////// Recent Product Info Temp Store////////////////
    NSMutableArray*recentlybrought_productsids;
    NSMutableArray*recently_product_imgarr;
    NSMutableArray*recently_product_name_arr;
    NSMutableArray*recently_product_price_arr;
    NSMutableArray*recently_product_short_desc_arr;
    NSMutableArray*recently_product_long_desc_arr;
    NSMutableArray*recently_product_special_price_arr;
    ///////////////////////////////////////////////////////////
    
   /////////////////Slider Images //////////////////////
    NSMutableArray*sliderimgIds_arr;
    ////////////////////////////////////////////////////
    
    NSString*responseString;
    

     NSMutableArray *product_imgurl_arr;
     NSMutableArray *product_name_arr;
     NSMutableArray *product_price_arr;
     NSMutableArray *product_shopcost_arr;
     NSMutableArray *product_usercost_arr;

    
    NSString *lastname_str;
    NSString *firstname_str;
    NSString *password_str;
    NSString *user_id_str;
    NSMutableArray*sliders_img_arr;
   // NSString *logged_username;
    NSString*logged_password;
    int checkaddcart;
    int loggedOrNot;
    int onCall,countscrollimgs,scrollimgonce,countimages;
    int reloads_latest_int,reloads_recent_int,valuelatestindex,valuerecentindex;
    int seletedqtynum,cartcheckone,cartchecktwo,scrollonoff;
    ////////////////////cart class//////////////////////
    CartVC*cvc;
    NSTimer *timer;

}
@property (retain, nonatomic) IBOutlet UIButton *more_latest_btn;
@property (retain, nonatomic) IBOutlet UIButton *more_recent_btn;

@property (retain, nonatomic) IBOutlet UILabel *latest_products_lbl;

@property (retain, nonatomic) IBOutlet UILabel *recently_brought_lbl;

@property (retain, nonatomic) IBOutlet UIButton *closemenu_btn;

- (IBAction)closeMenuOutSide:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *dentistkart_lbl;
@property (retain, nonatomic) IBOutlet UILabel *dentalmegastore_lbl;

@property (retain, nonatomic) IBOutlet UIScrollView *mainscrollview;

@property (retain, nonatomic) IBOutlet UIView *topBarDentistkartView;


@property (retain, nonatomic) IBOutlet UIButton *cartitemscount_btn;

@property (retain, nonatomic) IBOutlet UIButton *logout_btn;
@property (retain, nonatomic) IBOutlet UILabel *dentistkartname_lbl;

- (IBAction)logoutCall:(id)sender;

@property (retain, nonatomic) IBOutlet UIView *newarrivalsview;

@property (retain, nonatomic) IBOutlet UIView *featuredview;
@property (retain, nonatomic) IBOutlet UIView *leftmenu_underview;


@property (retain, nonatomic) IBOutlet UIView *show_user_not_log_view;

@property (retain, nonatomic) IBOutlet UIScrollView *newarrivalsscroll;
@property (retain, nonatomic) IBOutlet UIScrollView *featuredscroll;

@property (retain, nonatomic) IBOutlet UIPageControl *pageController;
@property (retain, nonatomic) IBOutlet UIScrollView *sliderscroll;


@property (retain, nonatomic) IBOutlet UILabel *logged_usrname_show_lbl;
@property (retain, nonatomic) IBOutlet UIButton *cancel_btn;

@property (retain, nonatomic) IBOutlet UILabel *login_lbl;
@property (retain, nonatomic) IBOutlet UILabel *login_subtitle;

//@property (retain, nonatomic) IBOutlet UITableView *products_tblview;
@property (retain, nonatomic) IBOutlet UIView *login_check_view;
@property (retain, nonatomic) IBOutlet UILabel *products_bar_lbl;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollproduct;
@property (retain, nonatomic) IBOutlet UIView *scroll_underview;
@property (retain, nonatomic) IBOutlet UIView *tab_view;

/////////login view///////////////////////////
@property (retain, nonatomic) IBOutlet UIButton *signup_link_btn;
@property (retain, nonatomic) IBOutlet UIButton *login_btn;
@property (retain, nonatomic) IBOutlet UITextField *emailid_txtfield;
@property (retain, nonatomic) IBOutlet UIButton *show_pass_btn;
@property (retain, nonatomic) IBOutlet UITextField *pass_txtfield;
@property (retain, nonatomic) IBOutlet UIButton *forgot_btn_link;

//@property (retain, nonatomic) IBOutlet UIButton *logout_btn;

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


/////Drop down icon///////////////////////
@property (retain, nonatomic) IBOutlet UIImageView *logoutimgicon_imgview;
@property (retain, nonatomic) IBOutlet UIImageView *profile_dropdw_imgview;
@property (retain, nonatomic) IBOutlet UIImageView *usernme_imgicon_imgview;

//////////////////////////////////////////
///////////////////////////////////////////////////

@property (retain, nonatomic) IBOutlet UILabel *promotions_lbl;

@property (retain, nonatomic) IBOutlet UILabel *products_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orders_down_lbl;
///////////////////////////////Side menu ////////////////////////////
@property (retain, nonatomic) IBOutlet UIImageView *left_menu_profile_image;

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

- (IBAction)login_signup_click:(id)sender;



- (IBAction)drop_down_click_user:(id)sender;

////////////////////////////////////////////////////
- (IBAction)forgot_pass_click:(id)sender;
- (IBAction)signup_link_click:(id)sender;
- (IBAction)login_btn_click:(id)sender;
- (IBAction)show_pass_btn_click:(id)sender;
- (IBAction)close_login_view:(id)sender;

- (IBAction)logoutUser:(id)sender;


//////////////////////////////////////////////
- (IBAction)promotions_btn_click:(id)sender;
- (IBAction)products_btn_click:(id)sender;
- (IBAction)orders_btn_click:(id)sender;
/////////////////////////Left Menu Buttons Action//////////////////
- (IBAction)leftMenuHomeClick:(id)sender;
- (IBAction)leftMenuCategoryClick:(id)sender;
- (IBAction)leftMenuBrandsClick:(id)sender;
- (IBAction)leftMenuPromotionClick:(id)sender;
- (IBAction)leftMenuPolicesClick:(id)sender;
- (IBAction)leftMenuContactusClick:(id)sender;
- (IBAction)leftMenuLogoutClick:(id)sender;

//////////////////////////////////////////////////////////////////
- (IBAction)searchClick:(id)sender;

- (IBAction)cartPageClick:(id)sender;

//-(void)login_call;
-(void)dismissKeyboardPopup;
-(void)readlogin;
-(void)logOut;
-(void)show_popup_login;

-(void)aftersignupcall;
- (IBAction)clickedMoreNewArrival:(id)sender;
- (IBAction)clickedMoreFeatured:(id)sender;

- (IBAction)searchBtnClick:(id)sender;


@end
