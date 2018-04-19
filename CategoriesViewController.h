//
//  CategoriesViewController.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 14/10/15.
//  Copyright © 2015 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "RRNCollapsableSectionTableViewController.h"

@interface CategoriesViewController : RRNCollapsableTableViewController<UITableViewDelegate,UITableViewDataSource>{
    
   
    
    NSMutableArray*category_id_arr;
    NSMutableArray*parent_id_arr;
    NSMutableArray*category_name_arr;
    NSMutableDictionary*category_child_dict;
    NSMutableDictionary *child_name_dict;
    NSMutableArray*child_cat_id_arr;
    NSMutableDictionary*catid_child_dict;

    int indexval;
    
    NSMutableArray*temparrstore;
}

@property (retain, nonatomic) IBOutlet UILabel *category_lbl;

@property (retain, nonatomic) IBOutlet UIButton *cartitemscount_btn;
@property (retain, nonatomic) IBOutlet UIView *leftmenu_underview;
@property (retain, nonatomic) IBOutlet UIView *show_user_not_log_view;
@property (retain, nonatomic) IBOutlet UILabel *dentistkartname_lbl;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)selectClicked:(id)sender;

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
