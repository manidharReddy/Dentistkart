//
//  ContactUsVC.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 27/02/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import "ContactUsVC.h"
#import "AppDelegate.h"
#import "CategoryProductsView.h"
#import "ProductsViewController.h"
#import "LoginViewController.h"

#import "MyAccountView.h"
#import "CategoriesViewController.h"
#import "DeintistkartInfoVC.h"
#import "PromotionsVC.h"
#import "SearchVC.h"
@interface ContactUsVC ()

@end

@implementation ContactUsVC
@synthesize left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro,left_menu_brand_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    global_page_id=@"ContactUsVC";
    
    
    
    self.contactus_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.fullname_txtfeild.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.email_txtfeild.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.subject_txtfeild.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.contactus_txtview.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.sendmsg_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    
    ///////////////////////Side Menu///////////////////////
    //leftmenulist_view.frame = CGRectMake(0, 50, 200, self.view.frame.size.height);
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
        
      //  self.cartitemscount_btn.hidden=NO;
        //self.cartitemscount_btn.layer.cornerRadius=8.0f;
        //NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        //[self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
        
        left_menu_profile_name.text = logged_username;
        left_menu_profile_email_lbl.text = global_email_store;
        left_menu_profile_name.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        left_menu_profile_email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/23];

        [left_menu_logout_btn setTag:2];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callMyAccountPage)];
        [leftmenulist_view addGestureRecognizer:tap];
        
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
    
    
    
    if (cartcountvalue==0) {
        NSLog(@"cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=YES;
        // [self performSelector:@selector(getCartCountValue) withObject:nil afterDelay:0.1];
    }else{
        NSLog(@" else cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=NO;
        NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
        
    }
    
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    
    
    self.contactus_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/12];
    self.address_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/15];
    self.address_txtview.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.phone_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/15];
    self.phone_txtview.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/15];
    self.email_txt_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.sendmsg_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
}
-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
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


-(void)login{
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [self presentViewController:lvc animated:YES completion:nil];
}

-(void)logOut{
    NSLog(@"Logout form cart");
    ProductsViewController *pcvout = [[ProductsViewController alloc]init];
    [pcvout logOut];
}


///////////////////////////////////////////////////////////////////////
- (IBAction)leftMenuHomeClick:(id)sender {
    ProductsViewController *pvc = [[[ProductsViewController alloc]init]autorelease];
    [self presentViewController:pvc animated:YES completion:nil];
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
    PromotionsVC*promo = [[[PromotionsVC alloc]init]autorelease];
    [self presentViewController:promo animated:YES completion:nil];

}

- (IBAction)leftMenuPolicesClick:(id)sender {
    [self callDentistKartInfo];
}

- (IBAction)leftMenuContactusClick:(id)sender {
    //[self callDentistKartInfo];
    ContactUsVC * cuvc = [[[ContactUsVC alloc]init]autorelease];
    [self presentViewController:cuvc animated:YES completion:nil];
}

-(void)callDentistKartInfo{
    
    DeintistkartInfoVC *hpi = [[DeintistkartInfoVC alloc]init];
    [self presentViewController:hpi animated:YES completion:nil];
}

-(void)callCategoriesPage{
    
    CategoriesViewController*cvclocal = [[CategoriesViewController alloc]init];
    [self presentViewController:cvclocal animated:YES completion:nil];
    
}


- (IBAction)leftMenuLogoutClick:(id)sender {
    UIButton*tapped = (UIButton*)sender;
    if (tapped.tag==1) {
        [self login];
    }else if (tapped.tag==2){
        [self logOut];
    }
}

- (IBAction)cartPageClick:(id)sender {
    cartpageopen_str=@"read";
     pageIdentify_str=@"ContactUsVC";
    addcartcheckint=2;
    [self openCartPage];
}

-(void)openCartPage{
    
    CartVC *cvclocal = [[[CartVC alloc]init]autorelease];
    [self presentViewController:cvclocal animated:YES completion:nil];
    [cvclocal release];
    
}


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

- (void)dealloc {
    [_contactus_lbl release];
    [_address_lbl release];
    [_address_txtview release];
    [_phone_lbl release];
    [_phone_txtview release];
    [_email_lbl release];
    [_email_txt_lbl release];
    [_fullname_txtfeild release];
    [_email_txtfeild release];
    [_subject_txtfeild release];
    [_contactus_txtview release];
    [_sendmsg_btn release];
    [_contactus_lbl release];
    [_contact_lbl release];
    [super dealloc];
}
- (IBAction)sendmsgClick:(id)sender {
    
    if (self.fullname_txtfeild.text.length>0 && self.email_txtfeild.text.length>0&&self.subject_txtfeild.text.length>0&&self.contactus_txtview.text.length>0) {
        
    
    //NSDictionary*merchantInfo_dict = [paymentInfoDict objectForKey:@"merchantInfo"];
    //NSDictionary*transactionInfo_dict = [paymentInfoDict objectForKey:@"transactionInfo"];
    
    
    NSString*postinfo_str = [[NSString alloc]initWithFormat:@"fullname=%@&email=%@&subject=%@&message=%@",self.fullname_txtfeild.text,self.email_txtfeild.text,self.subject_txtfeild.text,self.contactus_txtview.text];
    
    NSData*data = [postinfo_str dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString*postlength =  [NSString stringWithFormat:@"%d",(int)[data length]];
    
    
    
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc]init];
    
    [req setURL:[NSURL URLWithString:@"https://dentistkart.com/webservice/contactus/"]];
    [req setHTTPMethod:@"POST"];
    [req setValue:postlength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody:data];
    
    NSURLResponse *url_responce;
    NSError*error;
    
    NSData*responcedata = [NSURLConnection sendSynchronousRequest:req returningResponse:&url_responce error:&error];
    
    NSLog(@"responceData:%@",responcedata);
        NSDictionary*dict = [NSJSONSerialization JSONObjectWithData:responcedata options:kNilOptions error:&error];
    
    NSString*returnStr = [[NSString alloc]initWithData:responcedata encoding:NSUTF8StringEncoding];
        if (dict==nil||dict==NULL) {
            UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"No Responce from Dentiskart" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"Cancel", nil];

            [alert show];
        
        }else{
        
            int statuscode = [[dict objectForKey:@"statuscode"] intValue];
            
            if (statuscode==1) {
                UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Send Message Succefully" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"Cancel", nil];
                
                [alert show];
                self.fullname_txtfeild.text=@"";
                self.email_txtfeild.text=@"";
                self.subject_txtfeild.text=@"";
                self.contactus_txtview.text=@"";
                
                
     
            }else{
                UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Message Failed." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"Cancel", nil];
                [alert show];
            }
        
        }
    
    NSLog(@"returnStr:%@",returnStr);
    }else{
    
        NSLog(@"All feilds are mandatory");
        
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Contact US" message:@"All Feilds are mandatory" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"cancel", nil];
        [alert show];
    
    }
    

}

- (IBAction)searchBtnClick:(id)sender {
     pageIdentify_str=@"ContactUsVC";
    SearchVC*svc = [[SearchVC alloc]init];
    [self presentViewController:svc animated:YES completion:nil];
}



@end
