//
//  PaymentConfirmVC.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 18/02/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import "PaymentConfirmVC.h"
#import "AppDelegate.h"
#import "CategoriesViewController.h"
#import "LoginViewController.h"
#import "MyAccountView.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
@interface PaymentConfirmVC ()

@end

@implementation PaymentConfirmVC
@synthesize left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro,left_menu_brand_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
        self.cartitemscount_btn.hidden=YES;
        
    }else{
        
        self.cartitemscount_btn.hidden=NO;
        self.cartitemscount_btn.layer.cornerRadius=8.0f;
        NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
        
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

    //////////////////////////////////////////////////////////
    
    [self.paymentcomplete_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/20]];
    [self.payment_txtview setFont:[UIFont systemFontOfSize:[self screenSize].width/20]];
    //[self.ordernumber_show setFont:[UIFont systemFontOfSize:[self screenSize].width/20]];
    self.ordernumber_show.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.ordernumber_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];

}

-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}


-(void)confirmPaymentResult:(NSDictionary*)paymentresult :(int)ordernumber{
    
    NSLog(@"paymentresult:%@",paymentresult);
    
    NSLog(@"payment_confirm_img_str payment confirm:%@",payment_confirm_img_str);
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[paymentresult objectForKey:@"image_url"]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        //  self.product_big_imageview.image = [UIImage imageWithData:data];
        NSLog(@"payment image");
        [self.successicon setImage:[UIImage imageWithData:data]];
    }];
    self.paymentcomplete_lbl.text = [paymentresult objectForKey:@"payment_status"];
    self.payment_txtview.text = [paymentresult objectForKey:@"payment_msg"];
    self.ordernumber_show.titleLabel.text = [NSString stringWithFormat:@"%d",ordernumber];

    

}
-(void)callMyAccountPage{
    MyAccountView*mmyacct = [[MyAccountView alloc]init];
    [self presentViewController:mmyacct animated:YES completion:nil];
}


- (IBAction)drop_down_click_user:(id)sender{
    UIButton*tappedButton =  (UIButton*)sender;
    NSLog(@"drop_down_click_user:%ld",(long)tappedButton.tag);
    if(tappedButton.tag ==1){
        //drop_down_view.hidden=NO;
        leftmenulist_view.hidden=NO;
        [drop_down_btn_pro setTag:2];
        
    }else if(tappedButton.tag ==2){
        [drop_down_btn_pro setTag:1];
        leftmenulist_view.hidden=YES;
        //drop_down_view.hidden=YES;
    }
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
    [self openCartPage];
}

-(void)openCartPage{
    
    CartVC *cvclocal = [[CartVC alloc]init];
    [self presentViewController:cvclocal animated:YES completion:nil];
    
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
    [_successicon release];
    [_paymentcomplete_lbl release];
    [_payment_txtview release];
    [_ordernumber_lbl release];
    [_ordernumber_show release];
    [_thankyou_icon release];
    [_gotohome_btn release];
    [super dealloc];
}
- (IBAction)gobuttonclick:(id)sender {
    [self leftMenuHomeClick:nil];
}
@end
