//
//  CartVC.h
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 26/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartVC : UIViewController<UIAlertViewDelegate,UIScrollViewDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>{
     NSString*responseString;
   // NSMutableArray *cart_id_arr;
    NSMutableArray *product_id_arr;
    NSMutableArray *product_name_arr;
    NSMutableArray *product_imgurl_arr;
   // NSMutableString*grandtotal_str;
    NSMutableArray *quantity_arr;
   NSMutableArray *amount_arr;
   // NSMutableArray *total_arr;

   // UITextField*txtFieldQty;
   // NSString*tempQtyValue;
    NSMutableArray*special_view_price_arr;
    NSMutableArray*special_view_shiiping_rate_arr;
    NSMutableArray*sp_view_discount_arr;
    NSMutableArray*sp_view_total_arr;
     UIActivityIndicatorView *indicatorroll;
}

@property (retain, nonatomic) IBOutlet UIScrollView *cartscrollview;

@property (retain,nonatomic) NSString*tempQtyValue;
@property (retain, nonatomic) IBOutlet UILabel *promocode_status_lbl;
@property (retain, nonatomic) IBOutlet UIButton *apply_btn;
@property (retain, nonatomic) IBOutlet UITextField *promocode_txtfeild;

@property (retain, nonatomic) IBOutlet UIButton *gotohomepage_btn;
@property (retain, nonatomic) IBOutlet UILabel *emptycartsublbl_lbl;
@property (retain, nonatomic) IBOutlet UILabel *emptycart_lbl;
@property (retain, nonatomic) IBOutlet UIView *emptycart_view;
@property (retain, nonatomic) IBOutlet UILabel *shoppingcart_lbl;
//////////////Special Price View//////////////////////
@property (retain, nonatomic) IBOutlet UIView *special_price_view;
@property (retain, nonatomic) IBOutlet UILabel *normal_price_lbl;
@property (retain, nonatomic) IBOutlet UILabel *shipping_price_lbl;
@property (retain, nonatomic) IBOutlet UILabel *dicount_price;
@property (retain, nonatomic) IBOutlet UILabel *total_amount_lbl;
- (IBAction)closeSpecialViewClick:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *total_displayview;

//////////////////////////////////////////////////////

@property (retain, nonatomic) IBOutlet UIView *leftmenu_underview;
@property (retain, nonatomic) IBOutlet UIView *show_user_not_log_view;
@property (retain, nonatomic) IBOutlet UILabel *dentistkartname_lbl;

@property (retain, nonatomic) IBOutlet UILabel *prodname_lbl;
@property (retain, nonatomic) IBOutlet UILabel *quant_lbl;
@property (retain, nonatomic) IBOutlet UILabel *price_lbl;
@property (retain, nonatomic) IBOutlet UILabel *ruppes_lbl;


@property (retain, nonatomic) IBOutlet UILabel *total_lbl_dis;
@property (retain, nonatomic) IBOutlet UILabel *mycart_lbl;
@property (retain, nonatomic) IBOutlet UIButton *continue_shopping_btn;
@property (retain, nonatomic) IBOutlet UIButton *checkout_btn;
@property (retain, nonatomic) IBOutlet UILabel *cart_total;
@property (retain, nonatomic) IBOutlet UILabel *total_in_bracket;
@property (retain, nonatomic) IBOutlet UIView *tab_view;
@property (retain, nonatomic) IBOutlet UIView *cart_view;
@property (retain, nonatomic) IBOutlet UILabel *cart_bar_lbl;
@property (retain, nonatomic) IBOutlet UIScrollView *cart_scrollview;

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
- (IBAction)drop_down_click_user:(id)sender;

@property (retain, nonatomic) IBOutlet UITableView *carttableview;


////////////////////////////////////////////////////

/////Drop down icon///////////////////////
@property (retain, nonatomic) IBOutlet UIImageView *logoutimgicon_imgview;
@property (retain, nonatomic) IBOutlet UIImageView *profile_dropdw_imgview;
@property (retain, nonatomic) IBOutlet UIImageView *usernme_imgicon_imgview;


@property (retain, nonatomic) IBOutlet UIButton *logout_btn;

- (IBAction)logoutUser:(id)sender;
-(void)logOut;
- (IBAction)closeusermenupop:(id)sender;

//////////////////////////////////////////
-(void)cartCreateIfNotExist;
-(void)countOfCartItems;

///////////////////////////////////////////////////

@property (retain, nonatomic) IBOutlet UILabel *promotions_lbl;

@property (retain, nonatomic) IBOutlet UILabel *products_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orders_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *cart_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *more_down_lbl;

////////////////////////////////////////////////////////

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




- (IBAction)promotions_btn_click:(id)sender;
- (IBAction)products_btn_click:(id)sender;
- (IBAction)orders_btn_click:(id)sender;
- (IBAction)cart_btn_click:(id)sender;
- (IBAction)more_btn_click:(id)sender;
- (IBAction)goToHomePage:(id)sender;

-(void)readcartdb;

- (IBAction)continueShopping_Click:(id)sender;
- (IBAction)checkOut_click:(id)sender;

@end
