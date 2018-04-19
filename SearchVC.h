//
//  SearchVC.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 11/01/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchVC : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>{

    NSMutableArray*product_id_arr;
    NSMutableArray*product_name_arr;
    NSMutableArray*product_desc_arr;
    NSMutableArray*product_short_arr;
    NSMutableArray*product_price_arr;
    NSMutableArray*product_image_arr;
    NSMutableArray*tempproduct_id_arr;
    NSMutableArray*product_available_arr;
    NSMutableArray*product_special_price_arr;

    NSMutableArray*temp_plist_arr;
    //NSString*path;

}
@property (retain, nonatomic) IBOutlet UIButton *clear_btn;
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


/////////////////////////SearchView//////////////////////////
@property (retain, nonatomic) IBOutlet UITextField *searchTxtBox;
@property (retain, nonatomic) IBOutlet UITableView *search_tblview;

///////////////////////////////////////////////////////////////////
- (IBAction)clearBtnClick:(id)sender;



@end
