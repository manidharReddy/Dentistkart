//
//  MyAddressVC.h
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 06/01/15.
//  Copyright (c) 2015 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBHud/MBProgressHUD.h"
@interface MyAddressVC : UIViewController</*UIPickerViewDataSource,UIPickerViewDelegate,*/UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>{
    NSString*responseString;
    NSString*type_store_str;
    NSString*postal_store_str;
    NSString*street_store_str;
    NSString*block_store_str;
    NSString*comment_store_str;
     NSMutableArray*types_list_arr;
    NSString*global_type;
    NSString*type_select_str;
    NSString*address_id_store;
    NSString*delivery_address_id_str;
    NSString*deflt_ship_str;
    NSString*deflt_bill_str;
    NSString*default_bill_str;
    
    IBOutlet UIView*typespicker;
    IBOutlet UIPickerView *types_picker;
    NSMutableArray*address_id_arr;
    NSMutableArray*firstname_arr;
    NSMutableArray*lastname_arr;
    NSMutableArray*street_arr;
    NSMutableArray*street_two_arr;
    NSMutableArray*city_arr;
    NSMutableArray*postalcode_arr;
    NSMutableArray*telephone_arr;
    NSMutableArray*countrycode_arr;
    NSString*tmpaddressid;
    NSString*firstlastname;
    int selectedAddrIndex,selectedindexaddr;
    int checkaddressvalue,select,updatecheck;
    NSString*paytelephonenum;
    NSString*defaultshippaddr_temp,*defaultbilladdr_temp;
    //MBProgressHUD *hud;
}
@property (retain, nonatomic) IBOutlet UITableView *myaddrstableview;


//@property (retain,nonatomic) NSString*postalcode_tempstr;
@property (retain, nonatomic) IBOutlet UILabel *grandtotal_value_lbl;


@property (retain, nonatomic) IBOutlet UILabel *grandtotal_title_lbl;

@property (retain, nonatomic) IBOutlet UIButton *close_cancel_btn;
@property (retain, nonatomic) IBOutlet UILabel *default_bill_addr_lbl;
@property (retain, nonatomic) IBOutlet UILabel *default_ship_addr_lbl;
@property (retain, nonatomic) IBOutlet UIButton *cancel_btn;

@property (retain, nonatomic) IBOutlet UIView *total_display_view;

@property (retain, nonatomic) IBOutlet UILabel *checkout_lbl;

@property (retain, nonatomic) IBOutlet UILabel *shippingprice_lbl;
@property (retain, nonatomic) IBOutlet UILabel *grand_total_lbl;


@property (retain, nonatomic) IBOutlet UIButton *proceedToPayBtn;
@property (retain, nonatomic) IBOutlet UILabel *pleaseselect_lbl;


@property (retain, nonatomic) IBOutlet UITextView *addresstextView;


@property (retain, nonatomic) IBOutlet UIButton *cartitemscount_btn;
@property (retain, nonatomic) IBOutlet UIView *leftmenu_underview;
@property (retain, nonatomic) IBOutlet UIView *show_user_not_log_view;
@property (retain, nonatomic) IBOutlet UILabel *dentistkartname_lbl;

@property (retain, nonatomic) IBOutlet UIScrollView *address_list_scrollview;
////////////////////////////////Add New Address////////////////////////
@property (retain, nonatomic) IBOutlet UITextField *firstname_txtfld;
@property (retain, nonatomic) IBOutlet UITextField *lastname_txtfld;
@property (retain, nonatomic) IBOutlet UITextField *streetone_txtfld;
@property (retain, nonatomic) IBOutlet UITextField *streettwo_txtfld;
@property (retain, nonatomic) IBOutlet UITextField *city_txtfld;
@property (retain, nonatomic) IBOutlet UITextField *country_txtfld;
@property (retain, nonatomic) IBOutlet UITextField *postalcode_txtfld;
@property (retain, nonatomic) IBOutlet UITextField *telephone_txtfld;
@property (retain, nonatomic) IBOutlet UIButton *checkShipping_btn;
@property (retain, nonatomic) IBOutlet UIButton *checkBilling_btn;
- (IBAction)clickCheckBoxShip:(id)sender;
- (IBAction)clickCheckBoxBill:(id)sender;
- (IBAction)valuechangedPostalcode:(id)sender;


//////////////////////////////////////////////////////////////

@property (retain, nonatomic) IBOutlet UIView *address_innerview;

@property (retain, nonatomic) IBOutlet UIScrollView *address_scrollview;

@property (retain, nonatomic) IBOutlet UIView *guestSignupview;
//@property (retain, nonatomic) IBOutlet UIView *deliveryaddressView;
@property (retain, nonatomic) IBOutlet UITextField *firstname_txt;
@property (retain, nonatomic) IBOutlet UITextField *lastname_txt;
@property (retain, nonatomic) IBOutlet UITextField *email_txt;

@property (retain, nonatomic) IBOutlet UIView *address_check_view;
@property (retain, nonatomic) IBOutlet UIView *tab_view;
@property (retain, nonatomic) IBOutlet UIView *myaddress_view;
@property (retain, nonatomic) IBOutlet UILabel *myaddress_bar_lbl;
@property (retain, nonatomic) IBOutlet UILabel *myaddress_lbl;
@property (retain, nonatomic) IBOutlet UILabel *address_show_lbl;
@property (retain, nonatomic) IBOutlet UIButton *modify_address_btn;
@property (retain, nonatomic) IBOutlet UIButton *newaddress_btn;
@property (retain, nonatomic) IBOutlet UITextField *pincode_txtfeild;
@property (retain, nonatomic) IBOutlet UITextField *street_txtfeild;
@property (retain, nonatomic) IBOutlet UITextField *block_txtfeild;
@property (retain, nonatomic) IBOutlet UILabel *title_lbl_fr_popup;
@property (retain, nonatomic) IBOutlet UITextField *mobile_txtfeild;

@property (retain, nonatomic) IBOutlet UIButton *place_order_btn;
@property (retain, nonatomic) IBOutlet UIButton *ok_btn;
@property (retain, nonatomic) IBOutlet UITextView *comments_textview;

@property (retain, nonatomic) IBOutlet UILabel *logged_usrname_show_lbl;
@property (retain, nonatomic) IBOutlet UIButton *drop_down_btn_pro;

/////////////////Drop Down///////////////////////////
@property (retain, nonatomic) IBOutlet UIView *drop_down_view;
@property (retain, nonatomic) IBOutlet UIButton *login_or_signup_btn;
@property (retain, nonatomic) IBOutlet UIButton *profile_btn;
- (IBAction)login_signup_click:(id)sender;
- (IBAction)drop_down_click_user:(id)sender;
///////////////////////////////////////////////////
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



/////Drop down icon///////////////////////
@property (retain, nonatomic) IBOutlet UIImageView *logoutimgicon_imgview;
@property (retain, nonatomic) IBOutlet UIImageView *profile_dropdw_imgview;
@property (retain, nonatomic) IBOutlet UIImageView *usernme_imgicon_imgview;


@property (retain, nonatomic) IBOutlet UIButton *logout_btn;

- (IBAction)logoutUser:(id)sender;
-(void)logOut;

//////////////////////////////////////////
@property (retain, nonatomic) IBOutlet UIButton *cancel_guest_btn;

@property (retain, nonatomic) IBOutlet UILabel *guestname_lbl;
@property (retain, nonatomic) IBOutlet UIButton *submit_btn;
//@property (retain, nonatomic) IBOutlet UIButton *cancel_btn;


///////////////////////////////////////////////////

@property (retain, nonatomic) IBOutlet UILabel *promotions_lbl;

@property (retain, nonatomic) IBOutlet UILabel *products_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orders_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *cart_down_lbl;
@property (retain, nonatomic) IBOutlet UILabel *more_down_lbl;

////////////////////////////////////////////////////////
/////////////////////////////////////////////Confirm Your Order//////////////////////////////////
@property (retain, nonatomic) IBOutlet UIView *confirmorderview;
@property (retain, nonatomic) IBOutlet UILabel *confirmyourorder_lbl;
@property (retain, nonatomic) IBOutlet UIView *order_subview;
@property (retain, nonatomic) IBOutlet UIView *gradtotal_view_bottom;
@property (retain, nonatomic) IBOutlet UIScrollView *reviewproducts_scrollview;
@property (retain, nonatomic) IBOutlet UILabel *totalprice_title_lbl;
@property (retain, nonatomic) IBOutlet UILabel *qty_title_lbl;
@property (retain, nonatomic) IBOutlet UILabel *shipping_title_lbl;
@property (retain, nonatomic) IBOutlet UILabel *coupon_title_lbl;
//@property (retain, nonatomic) IBOutlet UILabel *grandtotal_title_lbl;
@property (retain, nonatomic) IBOutlet UILabel *totalprice_lbl;
@property (retain, nonatomic) IBOutlet UILabel *qty_lbl;
@property (retain, nonatomic) IBOutlet UILabel *shipping_lbl;
@property (retain, nonatomic) IBOutlet UILabel *coupon_lbl;
//@property (retain, nonatomic) IBOutlet UILabel *grand_total_lbl;
@property (retain, nonatomic) IBOutlet UILabel *grandtotalprice_lbl;
@property (retain, nonatomic) IBOutlet UIButton *paynow_btn;
@property (retain, nonatomic) IBOutlet UILabel *grandtotalbottom_lbl;
- (IBAction)paynowClick:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *grandtotalprice_btn;

////////////////////////////end///////////////////////


- (IBAction)promotions_btn_click:(id)sender;
- (IBAction)products_btn_click:(id)sender;
- (IBAction)orders_btn_click:(id)sender;
- (IBAction)cart_btn_click:(id)sender;
- (IBAction)more_btn_click:(id)sender;



- (IBAction)guestSingupbtn_click:(id)sender;

- (IBAction)searchBtnClick:(id)sender;



- (IBAction)closeusermenupop:(id)sender;


@property (retain, nonatomic) IBOutlet UIButton *tyes_btn;
- (IBAction)ok_click:(id)sender;
- (IBAction)close_click:(id)sender;

- (IBAction)modifyAddress_Click:(id)sender;
- (IBAction)dissmisKeyboard:(id)sender;
- (IBAction)newAddress_Click:(id)sender;
- (IBAction)placeOrder_Click:(id)sender;
- (IBAction)clickPickerDone:(id)sender;
- (IBAction)clickPickerCancel:(id)sender;
//- (IBAction)types_btn_click:(id)sender;

- (IBAction)cartPageClick:(id)sender;

/////////////////////////////////////////Delivery Address/////////////////////////////

@property (retain, nonatomic) IBOutlet UIView *deliveryaddressView;
- (IBAction)change_click:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *delivery_addr_disview;
@property (retain, nonatomic) IBOutlet UILabel *address_lbl;
@property (retain, nonatomic) IBOutlet UILabel *username_delivery_lbl;
@property (retain, nonatomic) IBOutlet UILabel *usr_delvry_ph_lbl;

@property (retain, nonatomic) IBOutlet UIView *total_amt_delivery_view;
- (IBAction)proceedtopay_click:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *totalcount_lbl;
@property (retain, nonatomic) IBOutlet UILabel *price_display_lbl;

////////////////////////////////end///////////////////////

@end
