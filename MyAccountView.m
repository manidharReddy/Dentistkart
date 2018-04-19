//
//  MyAccountView.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 30/12/15.
//  Copyright © 2015 Google Inc. All rights reserved.
//

#import "MyAccountView.h"
#import "AppDelegate.h"
#import "CategoriesViewController.h"
#import "LoginViewController.h"

#import "MyAccountEditVC.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "SearchVC.h"
#import "MyAddressVC.h"
#import "MyOrdersVC.h"
#import "OrderVC.h"
@interface MyAccountView ()

@end

@implementation MyAccountView
@synthesize left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro,left_menu_brand_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"entred in accountview didload");
    pageIdentify_str=@"MyAccountView";
    
    
     NSLog(@"user name view:%@",logged_username);
    ///////////////////////Side Menu///////////////////////
    //leftmenulist_view.frame = CGRectMake(0, 50, 200, 600);
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
        //self.cartitemscount_btn.hidden=YES;
        
    }else{
       // self.cartitemscount_btn.hidden=NO;
        //self.cartitemscount_btn.layer.cornerRadius=8.0f;
        //NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        //[self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];

        
        left_menu_profile_name.text = logged_username;
        left_menu_profile_email_lbl.text = global_email_store;
        left_menu_profile_name.font = [UIFont systemFontOfSize:[self screenSize].width/20];
        left_menu_profile_email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/23];
        self.edit_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/30];

        self.usernamemyacct.text=logged_username;
        self.usremailmyacct.text=global_email_store;
        
        self.usernamemyacct.font = [UIFont systemFontOfSize:[self screenSize].width/23];
        self.usremailmyacct.font = [UIFont systemFontOfSize:[self screenSize].width/28];
        [left_menu_logout_btn setTag:2];
    }
    
    
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

    //////////////////////////////////////////////////////////
    
    
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
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    
    self.addr_txtview.hidden=YES;
    self.addr_txtview.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.viewmoreaddress_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.myorders_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.viewallorders_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.myaddress_btn.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    
      // indicatorroll = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake([self screenSize].width/2,self.myaddrview_view.frame.origin.y+(self.myaddrview_view.frame.size.height/2), self.myaddrview_view.frame.size.width/20,self.myaddrview_view.frame.size.height/20)];
    
    indicatorroll = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake([self screenSize].width/2, [self screenSize].height/1.4, 80, 80)];
    [indicatorroll setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.scroll_underview addSubview:indicatorroll];
    [self.latestorderview addSubview:indicatorroll];
    [indicatorroll startAnimating];
    
    self.orderid_lbl.hidden=YES;
    self.statustitle_lbl.hidden=YES;
    self.statusvalue_lbl.hidden=YES;
    self.datetitle_lbl.hidden=YES;
    self.datevalue_lbl.hidden=YES;
    self.qtytitle_lbl.hidden=YES;
    self.qtyvalue_lbl.hidden=YES;
    self.ordertotal_lbl.hidden=YES;
    self.ordertotalvalue_lbl.hidden=YES;
    self.nextbtn.hidden=YES;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";

    //self.profile_imgview.frame = CGRectMake(0, 5, self.profilenamedis_view.frame.size.width/2,self.profilenamedis_view.frame.size.height/1.5);
    if ([self screenSize].width<500) {
      self.profile_imgview.contentMode = UIViewContentModeScaleAspectFit;  
    }
   //
    //[self.profilenamedis_view addSubview:self.profile_imgview];
    
    [self performSelector:@selector(getUserDefaultAddress) withObject:nil afterDelay:0.1];

}
-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

-(void)getUserDefaultAddress{

    
    NSString *str_getlistAddressService;
    
    str_getlistAddressService = [NSString stringWithFormat:@"https://dentistkart.com/webservice/customer/address/recent_address/?customerid=%@",logged_user_id];
    
    NSLog(@"str_getlistAddressService:%@",str_getlistAddressService);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_getlistAddressService]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    NSError *jsonError;
    NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:kNilOptions
                                                           error:&jsonError];
    NSLog(@"dict:%@",dict);
    
    if (dict==nil||dict==NULL){
        [indicatorroll stopAnimating];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }else {
        //NSDictionary*address_result_dict;
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        NSLog(@"message console:%@",message);
        NSLog(@"statuscode:%@",statuscode);
        NSLog(@"enter else");
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        
        int status = [statuscode intValue];
        
        if (status==1 || status==0){
            NSLog(@"enter success block getUserDefaultAddress");
             NSDictionary*dictchange =[dict objectForKey:@"createResult"];
            
            
            NSDictionary*customer_recentaddr = [dictchange objectForKey:@"CustomerRecentAddress"];
            NSLog(@"status in address:%@",[customer_recentaddr objectForKey:@"status"]);
            if ([[customer_recentaddr objectForKey:@"status"]intValue]!=0) {
                
            
            NSString  *street_str=[customer_recentaddr objectForKey:@"street"];
            NSLog(@"street_str mani:%@",street_str);
            NSString  *city_str=[customer_recentaddr objectForKey:@"city"];
            NSLog(@"city_str:%@",city_str);
            
            NSString  *postcode_str=[customer_recentaddr objectForKey:@"postcode"];
            NSLog(@"postcode_str:%@",postcode_str);

            [indicatorroll stopAnimating];
            self.addr_txtview.hidden=NO;
            
           // if ([street_str containsString:@"*"]) {
                NSLog(@"component:%@",[street_str componentsSeparatedByString:@"*"]);
                
                NSArray*arryaddrss = [street_str componentsSeparatedByString:@"*"];
                NSLog(@"arryaddrss:%@",arryaddrss);
                NSLog(@"[arryaddrss objectAtIndex:0]:%@",[arryaddrss objectAtIndex:0]);
                NSLog(@"[arryaddrss objectAtIndex:1]:%@",[arryaddrss objectAtIndex:1]);
                NSString*street_one_str = [arryaddrss objectAtIndex:0];
                //NSString*street_two_str = [arryaddrss objectAtIndex:1];
                self.addr_txtview.text = [[NSString alloc]initWithFormat:@"%@,%@,India-%@",street_one_str,city_str,postcode_str];
                
           // }else{
             //   self.addr_txtview.text = [[NSString alloc]initWithFormat:@"%@,%@,India-%@",street_str,city_str,postcode_str];
            //}
            
            [self.addr_txtview setFont:[UIFont systemFontOfSize:[self screenSize].width/25]];
            }else{
                
                [indicatorroll stopAnimating];
                self.addr_txtview.text = @"You have no address";
                [self.addr_txtview setFont:[UIFont systemFontOfSize:[self screenSize].width/25]];
            }
            
            NSLog(@"entred before for loop");
            NSDictionary*recentorder_dict = [dictchange objectForKey:@"RecentOrder"];
            NSLog(@"recentorder_dict:%@",recentorder_dict);
            
            
            if ([[recentorder_dict objectForKey:@"status"]intValue]!=0) {
                NSLog(@"entred in order");
            
           // for (NSDictionary*localorder_dict in recentorder_dict ) {
            
               // NSLog(@"localorder_dict:%@",localorder_dict);
            
                NSString*orderid_str = [recentorder_dict objectForKey:@"increment_id"];
                
                if ([orderid_str isEqualToString:@""]||[orderid_str isEqualToString:@"<null>"]||[orderid_str isEqualToString:@"null"]||[orderid_str isEqualToString:@"(null)"]||orderid_str ==nil||orderid_str==NULL)
                {
                    orderid_str=@"";
                }
                NSLog(@"orderid_str:%@",orderid_str);
            [self.orderid_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/30]];
                self.orderid_lbl.text = [NSString stringWithFormat:@"#%@",orderid_str];
                [self.nextbtn setTag:[orderid_str intValue]];
                
                NSString*status_str = [recentorder_dict objectForKey:@"status"];
                
                if ([status_str isEqualToString:@""]||[status_str isEqualToString:@"<null>"]||[status_str isEqualToString:@"null"]||[status_str isEqualToString:@"(null)"]||status_str ==nil||status_str==NULL)
                {
                    status_str=@"";
                }
                 NSLog(@"status_str:%@",status_str);
                [self.statustitle_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/35]];
                [self.statusvalue_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/35]];
                self.statusvalue_lbl.text = [NSString stringWithFormat:@":%@",status_str];

                NSString*created_at_str = [recentorder_dict objectForKey:@"created_at"];
                
                if ([created_at_str isEqualToString:@""]||[created_at_str isEqualToString:@"<null>"]||[created_at_str isEqualToString:@"null"]||[created_at_str isEqualToString:@"(null)"]||created_at_str ==nil||orderid_str==NULL)
                {
                    created_at_str=@"";
                }
                NSLog(@"created_at_str:%@",created_at_str);
            [self.datetitle_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/35]];
            [self.datevalue_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/35]];

                self.datevalue_lbl.text = [NSString stringWithFormat:@":%@",created_at_str];

                NSString*qty_str = [recentorder_dict objectForKey:@"total_qty_ordered"];
                
                if ([qty_str isEqualToString:@""]||[qty_str isEqualToString:@"<null>"]||[qty_str isEqualToString:@"null"]||[qty_str isEqualToString:@"(null)"]||qty_str ==nil||qty_str==NULL)
                {
                    qty_str=@"";
                }
             NSLog(@"qty_str:%@",qty_str);
            [self.qtytitle_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/35]];
            [self.qtyvalue_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/35]];

                self.qtyvalue_lbl.text = [NSString stringWithFormat:@":%@",qty_str];

                NSString*grandtotal_str = [recentorder_dict objectForKey:@"base_grand_total"];
                
                if ([grandtotal_str isEqualToString:@""]||[grandtotal_str isEqualToString:@"<null>"]||[grandtotal_str isEqualToString:@"null"]||[grandtotal_str isEqualToString:@"(null)"]||grandtotal_str ==nil||grandtotal_str==NULL)
                {
                    grandtotal_str=@"";
                }
                NSLog(@"grandtotal_str:%@",grandtotal_str);
            [self.ordertotal_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/35]];
            [self.ordertotalvalue_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/35]];

                self.ordertotalvalue_lbl.text = [NSString stringWithFormat:@":%@",grandtotal_str];
            
            [self.nextbtn.titleLabel setFont:[UIFont systemFontOfSize:[self screenSize].width/20]];
                
                self.orderid_lbl.hidden=NO;
                self.statustitle_lbl.hidden=NO;
                self.statusvalue_lbl.hidden=NO;
                self.datetitle_lbl.hidden=NO;
                self.datevalue_lbl.hidden=NO;
                self.qtytitle_lbl.hidden=NO;
                self.qtyvalue_lbl.hidden=NO;
                self.ordertotal_lbl.hidden=NO;
                self.ordertotalvalue_lbl.hidden=NO;
                self.nextbtn.hidden=NO;
                
                [indicatorroll stopAnimating];
                
            }else{
               //NSLog(@"");
                [indicatorroll stopAnimating];
                 NSLog(@"Entred in else");
                self.orderid_lbl.hidden=YES;
                self.statustitle_lbl.hidden=YES;
                self.statusvalue_lbl.hidden=YES;
                self.datetitle_lbl.hidden=YES;
                self.datevalue_lbl.hidden=YES;
                self.qtytitle_lbl.hidden=YES;
                self.qtyvalue_lbl.hidden=YES;
                self.ordertotal_lbl.hidden=YES;
                self.ordertotalvalue_lbl.hidden=YES;
                self.nextbtn.hidden=YES;
                
                
                
                UILabel*lblnoordersshow = [[UILabel alloc]initWithFrame:CGRectMake(20, (self.myorders_view.frame.size.height/2),([self screenSize].width-40),30)];
                lblnoordersshow.text=@"You have no recent orders";
                lblnoordersshow.font = [UIFont systemFontOfSize:[self screenSize].width/30];
                
                [self.myorders_view addSubview:lblnoordersshow];
        
            }
            
            //}
            
            
            
            //int ordercount_int=0;
            
            
            
            //self.neworders_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
            //self.neworders_lbl.text = [NSString stringWithFormat:@"You have %d new orders",ordercount_int];
            
            /*
            for (NSDictionary*address_result_dict in dictchange ) {
            NSString  *street_str=[address_result_dict objectForKey:@"street"];
            NSLog(@"street_str mani:%@",street_str);
                
             
            NSString  *city_str=[address_result_dict objectForKey:@"city"];
            NSLog(@"city_str:%@",city_str);
            
            NSString  *postcode_str=[address_result_dict objectForKey:@"postcode"];
            NSLog(@"postcode_str:%@",postcode_str);
                
                NSString *isBilling_str =[[NSString alloc]initWithFormat:@"%@",[address_result_dict objectForKey:@"is_default_billing"]];
                
                NSString *isBilling_shipping_str = [[NSString alloc]initWithFormat:@"%@",[address_result_dict objectForKey:@"is_default_shipping"]];
                
                NSLog(@"isBilling_str:%@",isBilling_str);
                NSLog(@"is_default_shipping:%@",isBilling_shipping_str);
                
                if ([isBilling_str isEqualToString:@"1"] || [isBilling_shipping_str isEqualToString:@"1"]) {
                    NSLog(@"enter in billing if");
                    [indicatorroll stopAnimating];
                    self.addr_txtview.hidden=NO;
                    
                    if ([street_str containsString:@"*"]) {
                        NSLog(@"component:%@",[street_str componentsSeparatedByString:@"*"]);
                        
                        NSArray*arryaddrss = [street_str componentsSeparatedByString:@"*"];
                        NSLog(@"arryaddrss:%@",arryaddrss);
                        NSLog(@"[arryaddrss objectAtIndex:0]:%@",[arryaddrss objectAtIndex:0]);
                        NSLog(@"[arryaddrss objectAtIndex:1]:%@",[arryaddrss objectAtIndex:1]);
                        NSString*street_one_str = [arryaddrss objectAtIndex:0];
                        //NSString*street_two_str = [arryaddrss objectAtIndex:1];
                    self.addr_txtview.text = [[NSString alloc]initWithFormat:@"%@,%@,-%@",street_one_str,city_str,postcode_str];
                        
                    }else{
                    self.addr_txtview.text = [[NSString alloc]initWithFormat:@"%@,%@,-%@",street_str,city_str,postcode_str];
                    }

                    
                   
                }else{
                    NSLog(@"enter in else billing");
                }
                
            }
            */
        }
    }
 [MBProgressHUD hideHUDForView:self.view animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drop_down_click_user:(id)sender{
    UIButton*tappedButton =  (UIButton*)sender;
    NSLog(@"drop_down_click_user:%ld",(long)tappedButton.tag);
    
    [self leftMenuHomeClick:nil];
    
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
    @autoreleasepool {
        
    
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    [self presentViewController:pvc animated:YES completion:nil];
    }
}

- (IBAction)leftMenuCategoryClick:(id)sender {
    isBrands=NO;
    [self callCategoriesPage];
    
/*
    CategoriesViewController*cvc = [[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:cvc animated:NO];
 */
}

- (IBAction)leftMenuBrandsClick:(id)sender {
    isBrands=YES;
    [self callCategoriesPage];
    
    
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
-(void)callCategoriesPage{
    CategoriesViewController*cvclocal = [[CategoriesViewController alloc]init];
    [self presentViewController:cvclocal animated:YES completion:nil];
    
}



- (IBAction)cartPageClick:(id)sender {
    cartpageopen_str=@"read";
     pageIdentify_str=@"MyAccountView";
    addcartcheckint=2;
    [self openCartPage];
}

-(void)openCartPage{
    
    CartVC *cvclocal = [[[CartVC alloc]init]autorelease];
    [self presentViewController:cvclocal animated:YES completion:nil];
    [cvclocal release];
    
}

- (IBAction)searchBtnClick:(id)sender {
     pageIdentify_str=@"MyAccountView";
    SearchVC*svc = [[SearchVC alloc]init];
    [self presentViewController:svc animated:YES completion:nil];
}

- (IBAction)arrowClick:(id)sender {
    orderid_intvalue = (int)self.nextbtn.tag;
    NSLog(@"view order ID:%ld",(long)self.nextbtn.tag);
    [self orderDetailsPage];

}
-(void)orderDetailsPage{
    OrderVC *ovc = [[OrderVC alloc]init];
    [self presentViewController:ovc animated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_usernamemyacct release];
    [_usremailmyacct release];
    [_neworders_lbl release];
    [_address_lbl release];
    [_subscriber_txtbox release];
    [_addr_txtview release];
    [_edit_btn release];
    [_myorders_lbl release];
    [_viewallorders_btn release];
    [_myaddress_btn release];
    [_viewmoreaddress_btn release];
    [_myaddrview_view release];
    [_scroll_underview release];
    [_orderid_lbl release];
    [_statustitle_lbl release];
    [_statusvalue_lbl release];
    [_datetitle_lbl release];
    [_datevalue_lbl release];
    [_qtytitle_lbl release];
    [_qtyvalue_lbl release];
    [_ordertotal_lbl release];
    [_ordertotalvalue_lbl release];
    [_nextbtn release];
    [_myorders_view release];
    [_latestorderview release];
    [_profile_imgview release];
    [_profilenamedis_view release];
    [super dealloc];
}
- (IBAction)editProfileClick:(id)sender {
    pageIdentify_str=@"MyAccountView";
    MyAccountEditVC *myaccedit = [[MyAccountEditVC alloc]init];
    [self presentViewController:myaccedit animated:YES completion:nil];
    
}

- (IBAction)viewallOrders_Click:(id)sender {
    pageIdentify_str=@"MyAccountView";
    MyOrdersVC*movc = [[MyOrdersVC alloc]init];
    [self presentViewController:movc animated:YES completion:nil];
}

- (IBAction)viewMoreAddressClick:(id)sender {
    customer_type_str=@"Customer";
    pageIdentify_str=@"MyAccountView";
    MyAddressVC*mavc = [[MyAddressVC alloc]init];
    [self presentViewController:mavc animated:YES completion:nil];
}

- (IBAction)submitSubscribeClick:(id)sender {
}
@end
