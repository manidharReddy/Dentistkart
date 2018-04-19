//
//  AppDelegate.h
//  iDate
//
//  Created by D M R on 07/08/12.
//  Copyright (c) 2012 iHubTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
//#import "GooglePlusSampleSignInViewController.h"

sqlite3	*database;
#import "RootViewController.h"
#import "ProductsViewController.h"
#import "StartingVC.h"



int addcartcheckint;
int global_product_id;
NSString*global_clicked_more;
//NSMutableArray*global_productid_arr;
NSString*global_page_id;
NSString*global_acess_token;
NSString*global_user_logedin_status;
NSString *logged_username;
NSString *logged_user_id;
NSString*logged_name_str;
NSString*logged_user_pass;
UIButton *tappedButton_addcart_btn;
UIButton *tappedButton_addorder_btn;
NSMutableArray *product_id_arr;
NSString*global_order_id_str;
NSString*global_checklogout;
NSString*forgotpassback;
NSString*aftersignupsrname;
NSString*aftersignupsrpass;
NSString*global_email_store;
NSString*login_pass_str;
NSString*cartid_check,*notlogged_str;
NSString*customer_type_str;
int cartcountvalue;
NSString*countvalue;
NSString*cartcountcheck;
NSString*child_catid_str;
NSString*quantity_str;
NSString*cartpageopen_str;
NSString*global_cart_total;
NSString*global_grandprice_str;
int cartcountItems,orderid_intvalue;
//double orderid_intvalue;
BOOL isBrands;
////////////////////////////////////////////Product Details///////////////////////////////////////
NSString*prodname_glb_str;
NSString*prodbrand_glb_str;
NSMutableArray*prodimages_glb_arr;
NSString*prodshort_glb_str;
NSString*prodprice_glb_str;
NSString*prodavailability_glb_str;
NSString*prodlongdesc_glb_str;
NSString*prodid_global_str;
/////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////Payment Confirmation/////////////////////////////////////////
NSString*payment_confirm_img_str;
NSString*payment_confirm_status_str;
NSString*payment_confirm_info_str;
NSString*payment_confirm_orderid_str;

/////////////////////////////////////////////////////////////////////////////////////////////
NSString*endoftheproducts;
NSString*pageIdentify_str;
int switchpage;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)IBOutlet UINavigationController *navController;

@property(strong,nonatomic)IBOutlet ProductsViewController *productviewcontroller;
@property(strong,nonatomic)IBOutlet StartingVC *starting_VC;

-(void)login_insert;


@end
