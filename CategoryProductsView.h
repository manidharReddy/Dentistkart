//
//  CategoryProductsView.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 19/10/15.
//  Copyright © 2015 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MNMBottomPullToRefreshManager.h"
#import "CartVC.h"
@interface CategoryProductsView : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate/*,MNMBottomPullToRefreshManagerClient*/>{
    NSMutableArray*product_id_arr;
    NSMutableArray*product_name_arr;
    NSMutableArray*product_desc_arr;
    NSMutableArray*product_short_arr;
    NSMutableArray*product_price_arr;
    NSMutableArray*product_image_arr;
    NSMutableArray*tempproduct_id_arr;
    NSMutableArray*product_available_arr;
    NSMutableArray*product_special_price_arr;
    
    //MNMBottomPullToRefreshManager *pullToRefreshManager_;
        CartVC*cvc;
    
    int countRow,endofrow,scrolloff,scrollon;
     int reloads_ ;
}
@property (retain, nonatomic) IBOutlet UIView *loaderview_display;


@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityindicatorroll;


@property (retain, nonatomic) IBOutlet UIButton *cartitemscount_btn;
@property (retain, nonatomic) IBOutlet UIView *leftmenu_underview;
@property (retain, nonatomic) IBOutlet UILabel *dentistkartname_lbl;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UIView *show_user_not_log_view;

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
