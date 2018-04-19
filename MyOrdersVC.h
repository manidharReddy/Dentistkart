//
//  MyOrdersVC.h
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 03/01/15.
//  Copyright (c) 2015 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrdersVC : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
 NSString*responseString;
    NSMutableArray*orderid_arr;
        NSMutableArray*orderstatus_arr;
        NSMutableArray*createddate_arr;
        NSMutableArray*orderqty_arr;
        NSMutableArray*ordergrandtotal_arr;
}

@property (retain, nonatomic) IBOutlet UITableView *myorderstblview;


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



@end
