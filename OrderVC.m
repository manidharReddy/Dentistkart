//
//  OrderVC.m
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 28/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import "MyOrdersVC.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "ProductsViewController.h"

#import "CartVC.h"
#import "OrderVC.h"
#import "CategoriesViewController.h"
#import "LoginViewController.h"

#import "ProductDetails.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "MyAccountView.h"
#import "SearchVC.h"
#import "OrdersViewCell.h"

@interface OrderVC ()

@end

@implementation OrderVC
//@synthesize order_bar_lbl,order_view,myorder_lbl,order_scrollview,total_lbl_dis,order_total,subtotal_lbl,tax_lbl,subtotal_lbl_show,tax_lbl_show,drop_down_btn_pro,drop_down_view,login_or_signup_btn,profile_btn,logoutimgicon_imgview,profile_dropdw_imgview,usernme_imgicon_imgview,logout_btn,promotions_lbl,products_down_lbl,orders_down_lbl,cart_down_lbl,more_down_lbl,tab_view,logged_usrname_show_lbl,cancel_btn_click;

@synthesize left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro,left_menu_brand_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    leftmenulist_view.frame = CGRectMake(0, 50, ([self screenSize].width/2)+[self screenSize].width/3, [self screenSize].height-50);
    
    [self.view addSubview:leftmenulist_view];
    
    left_menu_profile_img.layer.cornerRadius=10;
    left_menu_profile_img.clipsToBounds=YES;
    
    leftmenulist_view.hidden=YES;
    
    if ([logged_name_str isEqualToString:@""]||[logged_name_str isEqualToString:@"(null)"]||logged_name_str==nil||logged_name_str==NULL) {
        left_menu_profile_name.hidden=YES;
        left_menu_profile_email_lbl.hidden=YES;
        [left_menu_logout_btn setTag:1];
        [left_menu_logout_btn setTitle:@"Login" forState:UIControlStateNormal];
        self.dentistkartname_lbl.adjustsFontSizeToFitWidth=YES;
        self.show_user_not_log_view.frame = CGRectMake(0, 0,([self screenSize].width/2)+[self screenSize].width/3 , self.leftmenu_underview.frame.size.height);
        [self.leftmenulist_view addSubview:self.show_user_not_log_view];
        
        
    }else{
        left_menu_profile_name.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        left_menu_profile_email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/23];
        
        left_menu_profile_name.text = logged_username;
        left_menu_profile_email_lbl.text = global_email_store;
        [left_menu_logout_btn setTag:2];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callMyAccountPage)];
        [self.leftmenu_underview addGestureRecognizer:tap];

    }
    //////////////////////////////////////////////////////////
    
    
    
    
    
    
    self.dentistkartname_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/12];
    
    left_menu_home_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_category_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_brand_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_promotions_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_polices_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_contact_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_logout_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    
    
    left_menu_home_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_home_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);
    
    left_menu_category_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_category_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);
    
    left_menu_brand_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_brand_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);
    
    left_menu_promotions_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_promotions_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);
    
    left_menu_polices_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_polices_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);
    
    left_menu_contact_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_contact_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);
    
    left_menu_logout_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_logout_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);
    
    if (cartcountvalue==0) {
        NSLog(@"cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=YES;
        //[self performSelector:@selector(getCartCountValue) withObject:nil afterDelay:0.1];
    }else{
        NSLog(@" else cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=NO;
        NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
        
    }
    /*
    if ([pageIdentify_str isEqualToString:@"MyAccountView"]) {
        pageIdentify_str=@"OrderVC";
    }
    */
    
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    
    self.orderhistory_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.orderidtitle_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.orderidvalue_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.orderdate_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    self.orderdatevalue_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    
    
    self.total_order_amt_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/40];
    
    self.total_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.shipping_charges_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    
    self.grand_total_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    
    self.grand_total_value_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.shipping_amt_value_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.total_value_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    
    
    product_id_arr = [[NSMutableArray alloc]init];
    product_name_arr = [[NSMutableArray alloc]init];
    product_img_arr = [[NSMutableArray alloc]init];
    product_sku_arr = [[NSMutableArray alloc]init];
    product_qty_arr = [[NSMutableArray alloc]init];
    product_status_arr = [[NSMutableArray alloc]init];
    /*
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:self.shipping_charges_title_lbl.text];
    
    
    // making text property to strike text- NSUnderlineStyleAttributeName
    [titleString addAttribute: NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range: NSMakeRange(0, [self screenSize].width)];
    
    [self.shipping_charges_title_lbl setAttributedText:titleString];
*/
    
    
    
   // self.topvieworderhistory_view.frame = CGRectMake(0, 50, [self screenSize].width,[self screenSize].height/4);
    //[self.view addSubview:self.topvieworderhistory_view];
   
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";
    
    [self performSelector:@selector(listOfItemsInSingleOrderService) withObject:nil afterDelay:0.0];
}


-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}


-(void)callMyAccountPage{
    MyAccountView*mmyacct = [[MyAccountView alloc]init];
    [self presentViewController:mmyacct animated:YES completion:nil];
}

-(void)listOfItemsInSingleOrderService{
    
    NSString *str_url;
    
    str_url = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/orders/history/order_products.php?customer_id=%@&increment_id=%d",logged_user_id,orderid_intvalue];
    
    NSLog(@"str_url:%@",str_url);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_url]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString orders:*%@*",returnString);
    
    NSError *jsonError;
    NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:kNilOptions
                                                           error:&jsonError];
    NSLog(@"dict:%@",dict);
    
    
    
    
    if (dict==NULL||dict==nil) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response from Server" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"cancel", nil];
        [alert show];
    }else{
        
        int status = [[dict objectForKey:@"statuscode"] intValue];
        NSLog(@"status code:%d",status);
        if (status==1) {
            
            int countRow=0;
            NSDictionary*resultdict  =  [dict objectForKey:@"createResult"];
           //NSDictionary*orderlistdict  =  [resultdict objectForKey:@"order_list"];
            
            for (NSDictionary*localdict in resultdict) {
                
                NSString*orderid_str = [localdict objectForKey:@"increment_id"];
                if ([orderid_str isEqualToString:@""]||[orderid_str isEqualToString:@"<null>"]||[orderid_str isEqualToString:@"null"]||[orderid_str isEqualToString:@"(null)"]||orderid_str ==nil||orderid_str==NULL)
                {
                    orderid_str=@"Not Available";
                }
                
                //self.orderidvalue_lbl.text = [NSString stringWithFormat:@"%@",orderid_str];
                
                NSLog(@"increment id:%@",orderid_str);
                NSString*orderstatus_str = [localdict objectForKey:@"status"];
                if ([orderstatus_str isEqualToString:@""]||[orderstatus_str isEqualToString:@"<null>"]||[orderstatus_str isEqualToString:@"null"]||[orderstatus_str isEqualToString:@"(null)"]||orderstatus_str ==nil||orderstatus_str==NULL)
                {
                    orderstatus_str=@"Not Available";
                }
                NSLog(@"orderstatus_str id:%@",orderstatus_str);
                
                NSString*orderdate_str = [localdict objectForKey:@"created_at"];
                if ([orderdate_str isEqualToString:@""]||[orderdate_str isEqualToString:@"<null>"]||[orderdate_str isEqualToString:@"null"]||[orderdate_str isEqualToString:@"(null)"]||orderdate_str ==nil||orderdate_str==NULL)
                {
                    orderdate_str=@"";
                }
                
                NSLog(@"orderdate_str id:%@",orderdate_str);
                
                self.orderdatevalue_lbl.text = [NSString stringWithFormat:@"%@",orderdate_str];
                
                NSString*orderqty_str = [localdict objectForKey:@"total_qty_ordered"];
                if ([orderqty_str isEqualToString:@""]||[orderqty_str isEqualToString:@"<null>"]||[orderqty_str isEqualToString:@"null"]||[orderqty_str isEqualToString:@"(null)"]||orderqty_str ==nil||orderqty_str==NULL)
                {
                    orderqty_str=@"Not Available";
                }
                NSLog(@"orderqty_str id:%@",orderqty_str);
                
                self.orderidvalue_lbl.text = [NSString stringWithFormat:@"#%@(QTY-%d)",orderid_str,[orderqty_str intValue]];
                
                NSString*ordertotal_str = [localdict objectForKey:@"base_subtotal"];
                if ([ordertotal_str isEqualToString:@""]||[ordertotal_str isEqualToString:@"<null>"]||[ordertotal_str isEqualToString:@"null"]||[ordertotal_str isEqualToString:@"(null)"]||ordertotal_str ==nil||ordertotal_str==NULL)
                {
                    ordertotal_str=@"Not Available";
                }
                
                NSLog(@"ordertotal_str id:%@",ordertotal_str);
                
                
                self.total_value_lbl.text = [NSString stringWithFormat:@"- %@/-INR",ordertotal_str];
                
                
                NSString*ordershippingmt_str = [localdict objectForKey:@"base_shipping_amount"];
                if ([ordershippingmt_str isEqualToString:@""]||[ordershippingmt_str isEqualToString:@"<null>"]||[ordershippingmt_str isEqualToString:@"null"]||[ordershippingmt_str isEqualToString:@"(null)"]||ordershippingmt_str ==nil||ordershippingmt_str==NULL)
                {
                    ordershippingmt_str=@"Not Available";
                }
                
                NSLog(@"ordershippingmt_str :%@",ordershippingmt_str);

                
                self.shipping_amt_value_lbl.text = [NSString stringWithFormat:@"- %@/-INR",ordershippingmt_str];
                
               
                
                NSString*ordergrandamt_str = [localdict objectForKey:@"base_grand_total"];
                if ([ordergrandamt_str isEqualToString:@""]||[ordergrandamt_str isEqualToString:@"<null>"]||[ordergrandamt_str isEqualToString:@"null"]||[ordergrandamt_str isEqualToString:@"(null)"]||ordergrandamt_str ==nil||ordergrandamt_str==NULL)
                {
                    ordergrandamt_str=@"Not Available";
                }
                
                NSLog(@"ordergrandamt_str :%@",ordergrandamt_str);
                
                self.grand_total_value_lbl.text = [NSString stringWithFormat:@"- %@/-INR",ordergrandamt_str];
                
                
                
                NSDictionary*subDict = [localdict objectForKey:@"product_items"];
                
                for (NSDictionary *sublocaldict in subDict) {
                    
                
                    //////////////////////////////////////Store Data from service/////////////////
                    
                    
                    NSString*orderitemproduct_id_str = [sublocaldict objectForKey:@"product_id"];
                    if ([orderitemproduct_id_str isEqualToString:@""]||[orderitemproduct_id_str isEqualToString:@"<null>"]||[orderitemproduct_id_str isEqualToString:@"null"]||[orderitemproduct_id_str isEqualToString:@"(null)"]||orderitemproduct_id_str ==nil||orderitemproduct_id_str==NULL)
                    {
                        orderitemproduct_id_str=@"Not Available";
                    }
                    
                    NSLog(@"orderitemproduct_id_str :%@",orderitemproduct_id_str);
                    [product_id_arr addObject:orderitemproduct_id_str];
                    
                    
                    
                    NSString*orderitemname_str = [sublocaldict objectForKey:@"name"];
                    if ([orderitemname_str isEqualToString:@""]||[orderitemname_str isEqualToString:@"<null>"]||[orderitemname_str isEqualToString:@"null"]||[orderitemname_str isEqualToString:@"(null)"]||orderitemname_str ==nil||orderitemname_str==NULL)
                    {
                        orderitemname_str=@"Not Available";
                    }
                    
                    NSLog(@"orderitemname_str :%@",orderitemname_str);
                    [product_name_arr addObject:orderitemname_str];
                    
                    NSString*orderitemurl_str = [sublocaldict objectForKey:@"url"];
                    if ([orderitemurl_str isEqualToString:@""]||[orderitemurl_str isEqualToString:@"<null>"]||[orderitemurl_str isEqualToString:@"null"]||[orderitemurl_str isEqualToString:@"(null)"]||orderitemurl_str ==nil||orderitemurl_str==NULL)
                    {
                        orderitemurl_str=@"Not Available";
                    }
                    
                    NSLog(@"orderitemurl_str :%@",orderitemurl_str);
                    [product_img_arr addObject:orderitemurl_str];
                    
                    NSString*orderitemsku_str = [sublocaldict objectForKey:@"sku"];
                    if ([orderitemsku_str isEqualToString:@""]||[orderitemsku_str isEqualToString:@"<null>"]||[orderitemsku_str isEqualToString:@"null"]||[orderitemsku_str isEqualToString:@"(null)"]||orderitemsku_str ==nil||orderitemsku_str==NULL)
                    {
                        orderitemsku_str=@"Not Available";
                    }
                    
                    NSLog(@"orderitemsku_str :%@",orderitemsku_str);
                    [product_sku_arr addObject:orderitemsku_str];
                    
                    NSString*orderitemqty_str = [sublocaldict objectForKey:@"qty"];
                    if ([orderitemqty_str isEqualToString:@""]||[orderitemqty_str isEqualToString:@"<null>"]||[orderitemqty_str isEqualToString:@"null"]||[orderitemqty_str isEqualToString:@"(null)"]||orderitemqty_str ==nil||orderitemqty_str==NULL)
                    {
                        orderitemqty_str=@"Not Available";
                    }
                    
                    
                    NSLog(@"orderitemqty_str :%@",orderitemqty_str);
                    [product_qty_arr addObject:orderitemqty_str];
                    
                    
                    [product_status_arr addObject:orderstatus_str];
                    
                    /*
                    NSString*orderitemname_str = [sublocaldict objectForKey:@"name"];
                    if ([orderitemname_str isEqualToString:@""]||[orderitemname_str isEqualToString:@"<null>"]||[orderitemname_str isEqualToString:@"null"]||[orderitemname_str isEqualToString:@"(null)"]||orderitemname_str ==nil||orderitemname_str==NULL)
                    {
                        orderitemname_str=@"Not Available";
                    }
                    
                    NSLog(@"orderitemname_str :%@",orderitemname_str);
                    
                    
                    */
                    
                    
                    
                    
                    
                    
                    
                    
                   /*
                    
                    
                ////////////////////////////////////Dynamic UI///////////////////////////////////////////
                
                UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(0,20+([self screenSize].height/4)* countRow, [self screenSize].width,[self screenSize].height/4-10)];
                NSLog(@"check1");
                NSLog(@"20+([self screenSize].height/4)* countRow:%f",20+([self screenSize].height/4)* countRow);
                UITapGestureRecognizer*tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openProdocutDetails:)];
                [viewarrive setTag:[orderitemproduct_id_str intValue]];
                [viewarrive addGestureRecognizer:tapgesture];
                
                
                [viewarrive setBackgroundColor:[UIColor colorWithWhite:03 alpha:1.0f]];
                
                   
                
                    UIButton *iconbtn=[[UIButton alloc]init];
                    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:orderitemurl_str]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                        //  self.product_big_imageview.image = [UIImage imageWithData:data];
                        NSLog(@"iconbtn image set");
                        [iconbtn setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
                    }];
                    
                    iconbtn.layer.borderWidth=1.0;
                    iconbtn.layer.cornerRadius=2.0;
                    // iconbtn.layer.borderColor = [UIColor clearColor].CGColor;
                    //[iconbtn addTarget:self action:@selector(openProductDetailsRecent:) forControlEvents:UIControlEventTouchUpInside];
                    
                    [iconbtn setTag:[orderitemproduct_id_str intValue]];
                    [iconbtn addGestureRecognizer:tapgesture];
                    [iconbtn setTranslatesAutoresizingMaskIntoConstraints:NO];
 
                    
                    
                    
                UILabel *lblorderNameTemp = [[UILabel alloc] init];
                lblorderNameTemp.text = [NSString stringWithFormat:@"%@", orderitemname_str];
                lblorderNameTemp.adjustsFontSizeToFitWidth = YES;
                    if (orderitemname_str.length>10) {
                lblorderNameTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/35];
                    }else{
                    lblorderNameTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/30];
                    }
                
                [lblorderNameTemp setTranslatesAutoresizingMaskIntoConstraints:NO];
                
                
                UILabel *lblstatustitleTemp = [[UILabel alloc] init];
                lblstatustitleTemp.text = @"Status:";
                lblstatustitleTemp.adjustsFontSizeToFitWidth = YES;
                lblstatustitleTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/25];
                    lblstatustitleTemp.textColor = [UIColor redColor];
                [lblstatustitleTemp setTranslatesAutoresizingMaskIntoConstraints:NO];
                
                
                
                
                UILabel *lblstatusTemp = [[UILabel alloc] init];
                lblstatusTemp.text = [NSString stringWithFormat:@"%@", orderstatus_str];
                lblstatusTemp.adjustsFontSizeToFitWidth = YES;
                lblstatusTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/30];
                    lblstatusTemp.textColor = [UIColor greenColor];
                [lblstatusTemp setTranslatesAutoresizingMaskIntoConstraints:NO];
                
                
                
                UILabel *lblskuTemp = [[UILabel alloc] init];
                lblskuTemp.text = [NSString stringWithFormat:@"SKU(%@)", orderitemsku_str];
                lblskuTemp.adjustsFontSizeToFitWidth = YES;
                lblskuTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/50];
                [lblskuTemp setTranslatesAutoresizingMaskIntoConstraints:NO];
                
                
                UILabel *lblqtyTemp = [[UILabel alloc] init];
                lblqtyTemp.text = [NSString stringWithFormat:@"QTY-%1.0f", [orderqty_str doubleValue]];
                lblqtyTemp.adjustsFontSizeToFitWidth = YES;
                //lblqtyTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/50];
                    lblqtyTemp.font = [UIFont systemFontOfSize:viewarrive.frame.size.width/40];
                [lblqtyTemp setTranslatesAutoresizingMaskIntoConstraints:NO];
                
                
                
                UIButton *btnClickOrderTemp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                
                btnClickOrderTemp.tag = [orderitemproduct_id_str intValue];
                [btnClickOrderTemp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [btnClickOrderTemp setImage:[UIImage imageNamed:@"rightarrowicon"] forState:UIControlStateNormal];
                [btnClickOrderTemp addTarget:self action:@selector(selectedOrderID:) forControlEvents:UIControlEventTouchUpInside];
                [btnClickOrderTemp setTranslatesAutoresizingMaskIntoConstraints:NO];
                
                
                
                [viewarrive addSubview:iconbtn];
                [viewarrive addSubview:lblorderNameTemp];
                [viewarrive addSubview:lblskuTemp];
                [viewarrive addSubview:lblstatusTemp];
                [viewarrive addSubview:lblstatustitleTemp];
                [viewarrive addSubview:lblqtyTemp];
                //[viewarrive addSubview:lblqtytitleTemp];
                //[viewarrive addSubview:lbldateTemp];
                //[viewarrive addSubview:lbltotaltitleTemp];
                //[viewarrive addSubview:lblgrandtotalTemp];
                [viewarrive addSubview:btnClickOrderTemp];
                
                
                
                NSLayoutConstraint*leadingorderidlbl = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
                
                NSLayoutConstraint*toporderidlbl = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
                
                NSLayoutConstraint*trailingordebtnlbl = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:btnClickOrderTemp attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
                
                NSLayoutConstraint*trailingorderstatusvalue = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:lblstatusTemp attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
                    
                    NSLayoutConstraint*bottomorderstatusvalue = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:lblstatusTemp attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
                    
                    NSLayoutConstraint*bottomorderstatustitle = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:lblstatustitleTemp attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
                    
                    NSLayoutConstraint*centeryordervalue = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:btnClickOrderTemp attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
               
                [viewarrive addConstraints:@[leadingorderidlbl,toporderidlbl,trailingorderstatusvalue,trailingordebtnlbl,bottomorderstatusvalue,centeryordervalue,bottomorderstatustitle]];
                
                
                
                NSDictionary*newviews= @{@"iconbtn":iconbtn,@"lblorderNameTemp":lblorderNameTemp,@"lblskuTemp":lblskuTemp,@"lblstatusTemp":lblstatusTemp,@"lblstatustitleTemp":lblstatustitleTemp,@"lblqtyTemp":lblqtyTemp,@"btnClickOrderTemp":btnClickOrderTemp};
                
                    /////////////////////////////Horizontal constraints////////////////////////////////
                     NSString* imgwidth = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.width/3)];
                    NSString* imgheight = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.height/3)*2.5];
                    NSDictionary*metricsimg = @{@"width":imgwidth,@"height":imgheight};
                    
                    
                    NSArray *horizontalConstraintsname =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[iconbtn(width)]-20-[lblorderNameTemp]" options:0 metrics:metricsimg views:newviews];
                    
                  NSArray *horizontalConstraintssku =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[iconbtn(width)]-20-[lblskuTemp]" options:0 metrics:metricsimg views:newviews];
                    
                  NSArray *horizontalConstraintsqty =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[iconbtn(width)]-20-[lblqtyTemp]" options:0 metrics:metricsimg views:newviews];
                    
                    NSArray *horizontalConstraintsstatus =[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lblstatustitleTemp]-2-[lblstatusTemp]" options:0 metrics:metricsimg views:newviews];
                    
                    [viewarrive addConstraints:horizontalConstraintsname];
                    [viewarrive addConstraints:horizontalConstraintsqty];
                    [viewarrive addConstraints:horizontalConstraintssku];
                    [viewarrive addConstraints:horizontalConstraintsstatus];
                    
                    
                
                ////////////////////////////////////Verticular Constraints//////////////////////////////
                    
                    NSArray *verticalConstraintsitems =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[lblorderNameTemp(30)]-10-[lblskuTemp(25)]-10-[lblqtyTemp(25)]" options:0 metrics:metricsimg views:newviews];

                    [viewarrive addConstraints:verticalConstraintsitems];
                    
                    [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[iconbtn(height)]-20-|" options:kNilOptions metrics:metricsimg views:newviews]];
                    
                    
                //////////////////////////////////end vertical constraints//////////////////////////////////
                
                NSLog(@"screen height:%f",[self screenSize].height);
                NSLog(@"Y axis of view:%f",viewarrive.frame.origin.y);
                
                [self.orderitems_scroll addSubview:viewarrive];
                
                
                */
                ////////////////////////////////////////////////////////////////////////////////////////
                
                countRow++;
                    
                }
            }
            [self.ordertabelview reloadData];
           // [self.orderitems_scroll setContentSize:CGSizeMake([self screenSize].width,([self screenSize].height/4)*countRow)];
            
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }else if(status==2){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response from Server" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"cancel", nil];
            [alert show];
            
            
        }
        
        
        
    }
    
}
/*
-(void)openProdocutDetails:(UITapGestureRecognizer*)gestureRecognizer{
    
    UIView*tempView = (UIView*)gestureRecognizer.view;
    NSLog(@"tempViewOrder:%@",tempView);
    NSLog(@"tempView.tag:%d",(int)tempView.tag);
    global_product_id = (int)tempView.tag;
    NSLog(@"orderid_intvalue:%d",orderid_intvalue);
    
    [self loadProductDetailsView];
}
*/
- (IBAction)selectedOrderID:(id)sender{
    
    tappedButton_addorder_btn = (UIButton*)sender;
    global_product_id = (int)tappedButton_addorder_btn.tag;
    NSLog(@"view order ID:%ld",(long)tappedButton_addorder_btn.tag);
    [self loadProductDetailsView];
}


-(void)loadProductDetailsView{
    ProductDetails *pd = [[ProductDetails alloc]init];
    [self presentViewController:pd animated:YES completion:nil];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"response:%@",response);
}


/*
- (void)requestFailed:(ASIHTTPRequest *)request
{
    // [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSError *error = [request error];
    NSLog(@"error:%@",error);
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Failed to get response" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)drop_down_click_user:(id)sender{
    UIButton*tappedButton =  (UIButton*)sender;
    NSLog(@"drop_down_click_user:%ld",(long)tappedButton.tag);
    if ([pageIdentify_str isEqualToString:@"MyOrdersVC"]) {
        MyOrdersVC*movc = [[MyOrdersVC alloc]init];
        [self presentViewController:movc animated:YES completion:nil];
    }else if ([pageIdentify_str isEqualToString:@"MyAccountView"]){
        MyAccountView*acctview = [[MyAccountView alloc]init];
        [self presentViewController:acctview animated:YES completion:nil];
    }else{
    [self leftMenuHomeClick:nil];
    }
    /*
    if(tappedButton.tag ==1){
        //drop_down_view.hidden=NO;
        leftmenulist_view.hidden=NO;
        [drop_down_btn_pro setTag:2];
        
    }else if(tappedButton.tag ==2){
        [drop_down_btn_pro setTag:1];
        leftmenulist_view.hidden=YES;
        //drop_down_view.hidden=YES;
    }
     */
}

-(void)logOut{
    NSLog(@"Logout form cart");
    ProductsViewController *pcvout = [[ProductsViewController alloc]init];
    [pcvout logOut];
}

-(void)login{
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [self presentViewController:lvc animated:YES completion:nil];
}
///////////////////////////////////////////////////////////////////////
- (IBAction)leftMenuHomeClick:(id)sender {
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    [self presentViewController:pvc animated:YES completion:nil];
}

- (IBAction)leftMenuCategoryClick:(id)sender {
    /*
     CategoriesViewController*cvc = [[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:[NSBundle mainBundle]];
     [self.navigationController pushViewController:cvc animated:NO];
     */
    
    isBrands=NO;
    [self callCategoriesPage];
    
}

- (IBAction)leftMenuBrandsClick:(id)sender {
    isBrands=YES;
    [self callCategoriesPage];
    
}

-(void)callCategoriesPage{
    CategoriesViewController*cvclocal = [[CategoriesViewController alloc]init];
    [self presentViewController:cvclocal animated:YES completion:nil];
    
}


- (IBAction)leftMenuPromotionClick:(id)sender {
    PromotionsVC*promo = [[PromotionsVC alloc]init];
    [self presentViewController:promo animated:YES completion:nil];
    
}

- (IBAction)leftMenuPolicesClick:(id)sender {
    [self callDentistKartInfo];
}

- (IBAction)leftMenuContactusClick:(id)sender {
    ContactUsVC * cuvc = [[ContactUsVC alloc]init];
    [self presentViewController:cuvc animated:YES completion:nil];
    // [self callDentistKartInfo];
}

- (IBAction)leftMenuLogoutClick:(id)sender {
    
    UIButton*tapped = (UIButton*)sender;
    if (tapped.tag==1) {
        [self login];
    }else if (tapped.tag==2){
        [self logOut];
    }
}

-(void)callDentistKartInfo{
    DeintistkartInfoVC *hpi = [[DeintistkartInfoVC alloc]init];
    [self presentViewController:hpi animated:YES completion:nil];
    
}
- (IBAction)cartPageClick:(id)sender {
    addcartcheckint=2;
    //cartpageopen_str=@"read";
     pageIdentify_str=@"OrderVC";
    [self openCartPage];
}
-(void)openCartPage{
    CartVC *cvclocal = [[CartVC alloc]init];
    [self presentViewController:cvclocal animated:YES completion:nil];
}

- (IBAction)searchBtnClick:(id)sender {
    pageIdentify_str=@"OrderVC";
    SearchVC*svc = [[SearchVC alloc]init];
    [self presentViewController:svc animated:YES completion:nil];
}

///////////////////////////////TableView delegate methods///////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [product_id_arr count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @try {
        
        
        NSLog(@"cellforrow");
        OrdersViewCell * pcell;
        
        static NSString *cellIdentifier1 = @"cellIdentifierOrder";
        pcell = (OrdersViewCell *)[self.ordertabelview dequeueReusableCellWithIdentifier:cellIdentifier1];
        
        if (pcell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OrdersViewCell"
                                                         owner:self options:nil];
            for (id oneObject in nib) if ([oneObject isKindOfClass:[OrdersViewCell class]])
                pcell = (OrdersViewCell *)oneObject;
        }
        pcell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSString *product_img_str=[[NSString alloc]initWithFormat:@"%@",[product_img_arr objectAtIndex:[indexPath row]]];
        
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:product_img_str]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            pcell.order_imageview.image = [UIImage imageWithData:data];
        }];
        product_img_str=nil;

        
        
        
        
        
        NSString *productname_str=[[NSString alloc]initWithFormat:@"%@",[product_name_arr objectAtIndex:[indexPath row]]];
        
        pcell.orderprductname_lbl.text = productname_str;
        pcell.orderprductname_lbl.lineBreakMode = NSLineBreakByWordWrapping;
        pcell.orderprductname_lbl.numberOfLines = 0;
        
        NSLog(@"productname_str Check:%@",productname_str);
        // pcell.user_name.text =product_img_str;
        
        NSLog(@"crossed 1");
        
        NSString *productsku_str=[[NSString alloc]initWithFormat:@"SKU(%@)",[product_sku_arr objectAtIndex:[indexPath row]]];
        
        pcell.ordersku_lbl.text=productsku_str;
        
        NSLog(@"productsku_str Check:%@",productsku_str);
        
        
        NSString *product_qty_str=[[NSString alloc]initWithFormat:@"QTY-%d",[[product_qty_arr objectAtIndex:[indexPath row]]intValue]];
        
        pcell.qty_lbl.text=product_qty_str;
        
        NSLog(@"product_qty_str Check:%@",product_qty_str);
        
        
        NSString *orderstatus_str=[[NSString alloc]initWithFormat:@"%@",[product_status_arr objectAtIndex:[indexPath row]]];
        
        pcell.orderstatusvalue_lbl.text=orderstatus_str;
        
        NSLog(@"orderstatus_str Check:%@",orderstatus_str);
        
        /*
        NSString *ordertotal_str=[[NSString alloc]initWithFormat:@"%@",[ordergrandtotal_arr objectAtIndex:[indexPath row]]];
        
        pcell.ordertotalvalue_lbl.text=ordertotal_str;
        
        NSLog(@"ordertotal_str Check:%@",ordertotal_str);
        */
        
        NSLog(@"crossed 2");
        
        
        
        
        
        
        pcell.orderarrow_btn.tag = [[product_id_arr objectAtIndex:[indexPath row]]intValue];
        [pcell.orderarrow_btn addTarget:self action:@selector(selectedOrderID:) forControlEvents:UIControlEventTouchUpInside];
        
        pcell.orderprductname_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
        pcell.ordersku_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        pcell.orderstatus_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/40];
        pcell.orderstatusvalue_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/40];
        pcell.qty_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        
        
        NSLog(@"crossed 3");
        
        return pcell;
    }
    @catch (NSException *exception) {
        NSLog(@"exception cell:%@",exception);
    }
    @finally {
        NSLog(@"final");
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    pageIdentify_str=@"OrderVC";
    
    global_product_id = [[product_id_arr objectAtIndex:indexPath.row]intValue];
    NSLog(@"view order ID:%d",global_product_id);
    [self loadProductDetailsView];    //[self loadProductDetailsView];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self screenSize].width<768) {
        NSLog(@"less than 768");
        return [self screenSize].height/4;
    }else if ([self screenSize].width>800){
        NSLog(@"greater than 800");
        return [self screenSize].height/3;
    }
    return [self screenSize].height/4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    NSLog(@"heightForFooterInSection");
    //if ([product_id_arr count]<10) {
    //[self.carttableview setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //}
    //self.tableView.tableFooterView = self.loaderview_display;
    
    
    return 0.00f;
}


- (void)dealloc {
   
    [_orderhistory_lbl release];
    [_orderidtitle_lbl release];
    [_orderidvalue_lbl release];
    [_orderdate_lbl release];
    [_orderdatevalue_lbl release];
    [_orderitems_scroll release];
    [_total_order_amt_title_lbl release];
    [_total_title_lbl release];
    [_total_value_lbl release];
    [_shipping_charges_title_lbl release];
    [_shipping_amt_value_lbl release];
    [_grand_total_title_lbl release];
    [_grand_total_value_lbl release];
    [_topvieworderhistory_view release];
    [_bottomvieworderhistory_view release];
    [_ordertabelview release];
        [super dealloc];
}
@end
