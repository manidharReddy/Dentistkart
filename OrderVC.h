//
//  OrderVC.h
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 28/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderVC : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    NSString*responseString;
    NSMutableArray*tax_store_arr;
    NSMutableArray*ammount_store_arr;
    NSMutableArray*product_id_arr;
    NSMutableArray*product_name_arr;
    NSMutableArray*product_img_arr;
    NSMutableArray*product_sku_arr;
    NSMutableArray*product_qty_arr;
    NSMutableArray*product_status_arr;
}
@property (retain, nonatomic) IBOutlet UITableView *ordertabelview;


@property (retain, nonatomic) IBOutlet UIView *topvieworderhistory_view;
@property (retain, nonatomic) IBOutlet UIView *bottomvieworderhistory_view;



@property (retain, nonatomic) IBOutlet UILabel *orderhistory_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orderidtitle_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orderidvalue_lbl;

@property (retain, nonatomic) IBOutlet UILabel *orderdate_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orderdatevalue_lbl;

@property (retain, nonatomic) IBOutlet UIScrollView *orderitems_scroll;
@property (retain, nonatomic) IBOutlet UILabel *total_order_amt_title_lbl;
@property (retain, nonatomic) IBOutlet UILabel *total_title_lbl;
@property (retain, nonatomic) IBOutlet UILabel *total_value_lbl;
@property (retain, nonatomic) IBOutlet UILabel *shipping_charges_title_lbl;
@property (retain, nonatomic) IBOutlet UILabel *shipping_amt_value_lbl;
@property (retain, nonatomic) IBOutlet UILabel *grand_total_title_lbl;
@property (retain, nonatomic) IBOutlet UILabel *grand_total_value_lbl;


@property (retain, nonatomic) IBOutlet UIScrollView *scrollview_orders;

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









/*
@property (retain, nonatomic) IBOutlet UIButton *cancel_btn_click;

@property (retain, nonatomic) IBOutlet UILabel *order_total;
@property (retain, nonatomic) IBOutlet UILabel *order_bar_lbl;
@property (retain, nonatomic) IBOutlet UIView *order_view;
@property (retain, nonatomic) IBOutlet UILabel *myorder_lbl;
@property (retain, nonatomic) IBOutlet UIScrollView *order_scrollview;
@property (retain, nonatomic) IBOutlet UILabel *total_lbl_dis;

@property (retain, nonatomic) IBOutlet UILabel *subtotal_lbl;

@property (retain, nonatomic) IBOutlet UILabel *tax_lbl;
@property (retain, nonatomic) IBOutlet UILabel *subtotal_lbl_show;
@property (retain, nonatomic) IBOutlet UILabel *tax_lbl_show;

@property (retain, nonatomic) IBOutlet UIView *tab_view;
@property (retain, nonatomic) IBOutlet UIButton *drop_down_btn_pro;

/////////////////Drop Down///////////////////////////
@property (retain, nonatomic) IBOutlet UIView *drop_down_view;
@property (retain, nonatomic) IBOutlet UIButton *login_or_signup_btn;
@property (retain, nonatomic) IBOutlet UIButton *profile_btn;
- (IBAction)login_signup_click:(id)sender;
- (IBAction)profile_click:(id)sender;
- (IBAction)drop_down_click_user:(id)sender;

/////Drop down icon///////////////////////
@property (retain, nonatomic) IBOutlet UIImageView *logoutimgicon_imgview;
@property (retain, nonatomic) IBOutlet UIImageView *profile_dropdw_imgview;
@property (retain, nonatomic) IBOutlet UIImageView *usernme_imgicon_imgview;

@property (retain, nonatomic) IBOutlet UILabel *logged_usrname_show_lbl;

@property (retain, nonatomic) IBOutlet UIButton *logout_btn;

- (IBAction)logoutUser:(id)sender;
-(void)logOut;

//////////////////////////////////////////



///////////////////////////////////////////////////

@property (retain, nonatomic) IBOutlet UILabel *promotions_lbl;

@property (retain, nonatomic) IBOutlet UILabel *products_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orders_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *cart_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *more_down_lbl;

////////////////////////////////////////////////////////
- (IBAction)cancelbtnclick:(id)sender;

- (IBAction)closeusermenupop:(id)sender;

- (IBAction)promotions_btn_click:(id)sender;
- (IBAction)products_btn_click:(id)sender;
- (IBAction)orders_btn_click:(id)sender;
- (IBAction)cart_btn_click:(id)sender;
- (IBAction)more_btn_click:(id)sender;
*/

@end
