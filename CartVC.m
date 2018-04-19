//
//  CartVC.m
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 26/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import "CartVC.h"
#import "MBProgressHUD.h"
//#import "ASIHTTPRequest.h"
//#import "ASIFormDataRequest.h"
//#import"JSON1.h"
#import "AppDelegate.h"
#import "ProductsViewController.h"
#import "MyOrdersVC.h"
#import "MyAddressVC.h"
#import "LoginViewController.h"
#import "CategoriesViewController.h"

#import "MyAccountView.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "CategoryProductsView.h"
#import "ProductDetails.h"
#import "MyAccountEditVC.h"
#import "SearchVC.h"
#import "OrderVC.h"
#import "CartListCell.h"
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_6_0)
# define ALIGN_CENTER NSTextAlignmentCenter
#else
# define ALIGN_CENTER UITextAlignmentCenter
#endif
@interface CartVC ()

@end

@implementation CartVC
@synthesize cart_view,cart_bar_lbl,tab_view,cart_scrollview,continue_shopping_btn,checkout_btn,mycart_lbl,cart_total,total_lbl_dis,prodname_lbl,price_lbl,quant_lbl,ruppes_lbl,total_in_bracket,drop_down_view,login_or_signup_btn,cancel_or_return_bnt,whishlist_btn,myorders_btn,profile_btn,myaddress_btn,policies_btn,cantactus_btn,drop_down_btn_pro,promotions_lbl,products_down_lbl,orders_down_lbl,cart_down_lbl,more_down_lbl,logoutimgicon_imgview,profile_dropdw_imgview,usernme_imgicon_imgview,logout_btn,logged_usrname_show_lbl,left_menu_brand_btn,left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // tab_view.frame=CGRectMake(0,518, 320, 50);
    //[self.view addSubview:tab_view];
    
    //drop_down_view.frame = CGRectMake(150, 50, 200, 100);
    //[self.view addSubview:drop_down_view];
     NSLog(@"viewdidload enter");
    global_page_id=@"CartVC";
                    //txtFieldQty.delegate=self;
    
    //[cart_view setBackgroundColor:[UIColor colorWithRed:250/255.0 green:241/250.0 blue:140/250.0 alpha:1]];
   // [cart_bar_lbl setBackgroundColor:[UIColor colorWithRed:39/255.0 green:180/255.0 blue:245/255.0 alpha:1]];
    //cart_bar_lbl.font = [UIFont fontWithName:@"Santor" size:22.0f];
    
    [self.shoppingcart_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/20]];
    
   // continue_shopping_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:15.0f];
    checkout_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:15.0f];
    
    //continue_shopping_btn.layer.borderWidth=1.0;
    //continue_shopping_btn.layer.cornerRadius=2.0;
    //continue_shopping_btn.layer.borderColor = [UIColor clearColor].CGColor;
    
    checkout_btn.layer.borderWidth=1.0;
    checkout_btn.layer.cornerRadius=2.0;
    checkout_btn.layer.borderColor = [UIColor clearColor].CGColor;
    
    //cartcountvalue=0;
    //countvalue=@"0";
   // mycart_lbl.font = [UIFont fontWithName:@"Santor" size:22.0f];
    cart_total.font = [UIFont fontWithName:@"Santor" size:12.0f];
    total_lbl_dis.font = [UIFont fontWithName:@"Santor" size:15.0f];
    
    prodname_lbl.font = [UIFont fontWithName:@"Santor" size:12.0f];
    price_lbl.font = [UIFont fontWithName:@"Santor" size:12.0f];
    quant_lbl.font = [UIFont fontWithName:@"Santor" size:12.0f];
    ruppes_lbl.font = [UIFont fontWithName:@"Santor" size:8.0f];
    
   // cart_id_arr = [[NSMutableArray alloc]init];
    product_id_arr = [[NSMutableArray alloc]init];
    product_name_arr = [[NSMutableArray alloc]init];
    //product_imgurl_arr = [[NSMutableArray alloc]init];
    
   quantity_arr = [[NSMutableArray alloc]init];
   amount_arr = [[NSMutableArray alloc]init];
    
    special_view_price_arr = [[NSMutableArray alloc]init];
    special_view_shiiping_rate_arr = [[NSMutableArray alloc]init];
    sp_view_discount_arr = [[NSMutableArray alloc]init];
    sp_view_total_arr = [[NSMutableArray alloc]init];
    product_imgurl_arr = [[NSMutableArray alloc]init];
    
    
    
    
    
   // total_arr = [[NSMutableArray alloc]init];
    NSLog(@"logged user check:%@",logged_username);
    //logged_usrname_show_lbl.text = [[NSString alloc]initWithFormat:@"Hi %@!",logged_username];
    //logged_usrname_show_lbl.font =[UIFont fontWithName:@"Santor" size:14.0f];
    //////////////////////LeftMenu///////////////////////////////////
    //leftmenulist_view.frame = CGRectMake(0, 50, 200, 600);
    leftmenulist_view.frame = CGRectMake(0, 50, ([self screenSize].width/2)+[self screenSize].width/3, [self screenSize].height-50);
    
    [self.view addSubview:leftmenulist_view];
    left_menu_profile_img.layer.cornerRadius=10;
    left_menu_profile_img.clipsToBounds=YES;
    
    leftmenulist_view.hidden=YES;

    
    [self.promocode_txtfeild setFont:[UIFont systemFontOfSize:[self screenSize].width/20]];
    [self.apply_btn.titleLabel setFont:[UIFont systemFontOfSize:[self screenSize].width/25]];
    [self.promocode_status_lbl setFont:[UIFont systemFontOfSize:[self screenSize].width/30]];
    /*
    if ([logged_username isEqualToString:@""]||[logged_username isEqualToString:@"(null)"]||logged_username==nil||logged_username==NULL)
    {
        NSLog(@"not login");
        self.dentistkartname_lbl.adjustsFontSizeToFitWidth=YES;
       // self.show_user_not_log_view.frame = CGRectMake(0, 0,self.leftmenu_underview.frame.size.width , self.leftmenu_underview.frame.size.height);
        self.show_user_not_log_view.frame = CGRectMake(0, 0,([self screenSize].width/2)+[self screenSize].width/3 , self.leftmenu_underview.frame.size.height);

        [self.leftmenulist_view addSubview:self.show_user_not_log_view];

        
    }else{
        left_menu_profile_name.text = [NSString stringWithString:logged_username];
        left_menu_profile_email_lbl.text = [NSString stringWithString:global_email_store];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callMyAccountPage)];
        [leftmenulist_view addGestureRecognizer:tap];

        
        
    }
    */
    
    
    //self.apply_btn.layer.borderWidth=1.0;
    //self.apply_btn.layer.borderColor=[[UIColor colorWithRed:79.0f green:194.0f blue:244.0f alpha:1.0f]CGColor];
    
    self.apply_btn.layer.cornerRadius=2.0;
    self.apply_btn.clipsToBounds=YES;
    
    self.carttableview.delegate=self;
    self.carttableview.dataSource=self;
    
    if ([logged_name_str isEqualToString:@""]||[logged_name_str isEqualToString:@"(null)"]||logged_name_str==nil||logged_name_str==NULL) {
        left_menu_profile_name.hidden=YES;
        left_menu_profile_email_lbl.hidden=YES;
        [left_menu_logout_btn setTag:1];
        [left_menu_logout_btn setTitle:@"Login" forState:UIControlStateNormal];
        
        NSLog(@"not login");
        self.dentistkartname_lbl.adjustsFontSizeToFitWidth=YES;
        // self.show_user_not_log_view.frame = CGRectMake(0, 0,self.leftmenu_underview.frame.size.width , self.leftmenu_underview.frame.size.height);
        self.show_user_not_log_view.frame = CGRectMake(0, 0,([self screenSize].width/2)+[self screenSize].width/3 , self.leftmenu_underview.frame.size.height);
        
        [self.leftmenulist_view addSubview:self.show_user_not_log_view];

    }else{
        
        left_menu_profile_name.text = logged_username;
        left_menu_profile_name.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        left_menu_profile_name.adjustsFontSizeToFitWidth=YES;
        
        left_menu_profile_email_lbl.text = global_email_store;
        left_menu_profile_email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/23];
        left_menu_profile_email_lbl.adjustsFontSizeToFitWidth=YES;
        [left_menu_logout_btn setTag:2];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callMyAccountPage)];
        [leftmenulist_view addGestureRecognizer:tap];

        //left_menu_profile_name.text = logged_username;
        //left_menu_profile_email_lbl.text = global_email_store;
        //[left_menu_logout_btn setTag:2];
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

    
    
    
    
    
    
    
    
    
    ///////////////////////Featured ScrollView///////////////////////////
    cart_scrollview.delegate = self;
    cart_scrollview.scrollEnabled=YES;
    cart_scrollview.userInteractionEnabled=YES;
    cart_scrollview.pagingEnabled = YES;
    cart_scrollview.showsHorizontalScrollIndicator = NO;
    cart_scrollview.showsVerticalScrollIndicator = NO;
    cart_scrollview.scrollsToTop = NO;
    ////////////////////////////////////end/////////////////////////////////////////
    
    
    self.special_price_view.hidden=YES;
    
    self.special_price_view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
    [self.view addSubview:self.special_price_view];
    
   /*
    login_or_signup_btn.titleLabel.font =[UIFont fontWithName:@"Santor" size:15.0f];
    cancel_or_return_bnt.titleLabel.font =[UIFont fontWithName:@"Santor" size:15.0f];
    whishlist_btn.titleLabel.font =[UIFont fontWithName:@"Santor" size:15.0f];
    myorders_btn.titleLabel.font =[UIFont fontWithName:@"Santor" size:15.0f];
    profile_btn.titleLabel.font=[UIFont fontWithName:@"Santor" size:15.0f];
    myaddress_btn.titleLabel.font =[UIFont fontWithName:@"Santor" size:15.0f];
    policies_btn.titleLabel.font =[UIFont fontWithName:@"Santor" size:15.0f];
    cantactus_btn.titleLabel.font =[UIFont fontWithName:@"Santor" size:15.0f];
    */
    drop_down_view.hidden=YES;
    /*
    promotions_lbl.font =[UIFont fontWithName:@"Santor" size:11.0f];
    products_down_lbl.font =[UIFont fontWithName:@"Santor" size:11.0f];
    orders_down_lbl.font =[UIFont fontWithName:@"Santor" size:11.0f];
    cart_down_lbl.font =[UIFont fontWithName:@"Santor" size:11.0f];
    more_down_lbl.font =[UIFont fontWithName:@"Santor" size:11.0f];
    
    [login_or_signup_btn setTitle:logged_username forState:UIControlStateNormal];
    login_or_signup_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:20.0f];
     usernme_imgicon_imgview.image = [UIImage imageNamed:@"user.png"];
     profile_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:20.0f];
     logout_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:20.0f];
    */
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";
    
    self.total_displayview.hidden=YES;
    
    //if ([cartpageopen_str isEqualToString:@"read"]) {
    
    //}
   
    //addcartcheckint=2;
    [self readcartdb];
    //[self performSelector:@selector(cartCreateIfNotExist) withObject:nil afterDelay:0.0];

    
}

-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

-(void)removingCartItems{
    NSArray*arrcartinscroll = [cart_scrollview subviews];
    
    for (UIView*view in arrcartinscroll) {
        [view removeFromSuperview];
    }
    
    
    [prodname_lbl release];
    [product_name_arr release];
    [special_view_shiiping_rate_arr release];
    [sp_view_discount_arr release];
    [special_view_price_arr release];
    [global_cart_total release];
    [global_grandprice_str release];
    
    product_id_arr=nil;
    product_name_arr=nil;
    special_view_shiiping_rate_arr=nil;
    sp_view_discount_arr=nil;
    special_view_price_arr=nil;
    global_cart_total=nil;
    global_grandprice_str=nil;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"rotated enter");
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    // [self loadVisiblePages];
    
   // [self removingCartItems];
    
    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:]
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]
        NSLog(@"rotated enter complet:%@",context);
        //[self viewDidLoad];
        
        
        if (self.view.bounds.size.height < self.view.bounds.size.width) {
            // self.heightCon.constant = self.view.bounds.size.height;
            NSLog(@"entere in landscape hjk:");
            
            //[self getListItemsInCart];
           
           //[self viewDidLoad];
            
            NSString* viewheight_str = [[NSString alloc]initWithFormat:@"%f",[self screenSize].width];
            
            NSDictionary *views = @{@"cart_view":cart_view};
            NSDictionary *metrics = @{@"height" : viewheight_str};
            [self.cartscrollview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[cart_view(height)]|" options:kNilOptions metrics:metrics views:views]];
            
            
            
                    }else{
              //          [self getListItemsInCart];
                        //[self openCartPage];
                        
             //           [self viewDidLoad];
            NSLog(@"enter in portrait");
        }
        
        
        
        
        //[self.scrollproduct addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[beeView(width)]|" options:kNilOptions metrics:metrics views:views]];
        
        
        
        //[self viewDidLoad];
        
    }];
}



-(void)updateViewConstraints {
    [super updateViewConstraints];
    NSLog(@"updateViewConstraints");
    if (self.view.bounds.size.height < self.view.bounds.size.width) {
        // self.heightCon.constant = self.view.bounds.size.height;
        NSLog(@"entere in landscape:");
        
    }else{
        //self.heightCon.constant = 350;
    }
}

-(void)openCartPage{
    
    CartVC *cvclocal = [[[CartVC alloc]init]autorelease];
    [self presentViewController:cvclocal animated:YES completion:nil];
    [cvclocal release];
    
}





-(void)callMyAccountPage{
    //MyAccountView*mmyacct = [[MyAccountView alloc]initWithNibName:@"MyAccountView" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:mmyacct animated:NO];
    MyAccountView*mmyacct = [[MyAccountView alloc]init];
    [self presentViewController:mmyacct animated:YES completion:nil];

}

-(void)cartCreateIfNotExist{
    @try {
        
    
    [self readcartdb];
    NSLog(@"cartid_check cartCreateIfNotExist in cartvc:%@",cartid_check);
    if([cartid_check isEqualToString:@"false"]){
        
    NSString *str_cartcheck = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/cart/create/"];
    
    NSLog(@"str_cartcheck:%@",str_cartcheck);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_cartcheck]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    
    
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    NSError *jsonError;
    // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    
    NSLog(@"dict:%@",dict);
    
    if (dict==nil||dict==NULL)
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else {
        
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        
        
        NSLog(@"enter else");
        
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."])
            
        {
            NSLog(@"enter success block creatcartidexitsornot");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            //NSDictionary*createresultdict = [dict objectForKey:@"createResult"];
            cartid_check = [dict objectForKey:@"createResult"];
            [self insertcart_db];
            //[self addProductToCart];
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
    }else {
        NSLog(@"cart create check id true: ");
        if (tappedButton_addcart_btn.tag==0) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"zero cart");
        }else{
        [self addProductToCart];
        }
    }
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception Create Cart:%@",exception);
    }
    @finally {
        NSLog(@"finally block creat cart service");
    }
}

-(void)addProductToCart{
    
    @try {
        
        if (tappedButton_addcart_btn.tag!=0 && ![quantity_str isEqualToString:@"0"]){
            
        
    NSString *str_addcart = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/cart/add/?cartid=%@&productid=%ld&quantity=%@",cartid_check,(long)tappedButton_addcart_btn.tag,quantity_str];
    
    NSLog(@"str_addtocart:%@",str_addcart);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_addcart]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];

    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    NSError *jsonError;
    // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    
    NSLog(@"dict:%@",dict);
    
    if (dict==nil||dict==NULL)
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Empty Data" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else {
        
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        
        NSLog(@"enter else");
        
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."])
            
        {
            NSLog(@"enter success block addProductToCart");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            //NSDictionary*createresultdict = [dict objectForKey:@"createResult"];
            int create_result_int = [[dict objectForKey:@"createResult"]intValue];
            
            
            if(create_result_int==1){
               // if (addcartcheckint==0) {
                [tappedButton_addcart_btn setTag:0];
                //[self countOfCartItems];
               
                //}else if(addcartcheckint==1){
               // [self getListItemsInCart];
                //}
                
            }else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Failed to add to cart" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                [alert release];
            }
            //[self insertcart_db];
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
        }else{
        
        }

    }
    @catch (NSException *exception) {
        NSLog(@"AddCart Service Exception:%@",exception);
    }
    @finally {
        
    }
}

-(void)insertcart_db
{
    sqlite3_stmt *stmt3;
    //char *errorMsg4;
    char *update4 = "insert into cart values (?,?);";
    NSLog(@"Insert cart query:%s",update4);
    int x1 = sqlite3_prepare_v2(database, update4, -1, &stmt3, nil);
    NSLog(@"x1:%d",x1);
    if (x1 == SQLITE_OK)
    {
        sqlite3_bind_text(stmt3, 1, NULL,-1, NULL);
        sqlite3_bind_text(stmt3, 2, [cartid_check UTF8String],-1, NULL);
        NSLog(@"before if cartid_check:%@",cartid_check);
        [self readcartdb];
    }
    
    if (sqlite3_step(stmt3) != SQLITE_DONE)
        //NSLog(@"Error: %",errorMsg4);
        sqlite3_finalize(stmt3);
    //[self readcartdb];
    [self addProductToCart];
}

-(void)readcartdb
{
    //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //hud.labelText = @"Loading....";
    
    NSLog(@"Entered in read cart");
    NSString *query = [[NSString alloc] initWithFormat:@"select * from cart;"];
    sqlite3_stmt *stmt;
    int x = sqlite3_prepare_v2(database,[query UTF8String],-1, &stmt, nil);
    if (x == SQLITE_OK)
    {
        NSLog(@"enter in SQLITE_OK");
        @try {
            // Loop through the results and add them to the feeds array
            while(sqlite3_step(stmt) == SQLITE_ROW)
            {
                NSLog(@"SQLITE_ROW");
                
                
                NSString *cartid_str = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 1)];
                NSLog(@"cartidstr:%@",cartid_str);
                cartid_check = [[NSString alloc]initWithFormat:@"%@",cartid_str];
               
            }
        }
        @catch (NSException *exception) {
            NSLog(@"Exception DB:%@",exception);
        }
        @finally {
            NSLog(@"entered in final block");
        }
        
    }
    sqlite3_finalize(stmt);
    
    NSLog(@"cartid check in readcartdb:%@",cartid_check);
   // global_user_logedin_status=@"Yes";
    if([cartid_check isEqualToString:@""]||[cartid_check isEqualToString:@"(null)"]||cartid_check==nil||cartid_check==NULL){
    cartid_check=@"false";
        [self performSelector:@selector(cartCreateIfNotExist) withObject:nil afterDelay:0.0];
        
    }else{
        NSLog(@"tappedButton_addcart_btn.tag:%ld",(long)tappedButton_addcart_btn.tag);
        
        if (tappedButton_addcart_btn.tag==0) {
            NSLog(@"tappedbtn zero condition");
            if (cartcountvalue!=0) {
                NSLog(@"cartcountvalue condition:%d",cartcountvalue);
                if (addcartcheckint==2) {
                    NSLog(@"addcartcheckint one xyz value:%d",addcartcheckint);
                    //[self getListItemsInCart];
                    [self performSelector:@selector(getListItemsInCart) withObject:nil afterDelay:0.0];
                    addcartcheckint=0;
                }else if (addcartcheckint==1) {
                    NSLog(@"addcartcheckint zero xyz value:%d",addcartcheckint);
                    addcartcheckint=0;
                    [self countOfCartItems];
                }
            }else{
                NSLog(@"getListItems called 1");
                NSLog(@"addcartcheckint value:%d",addcartcheckint);
                if (addcartcheckint==2) {
                    NSLog(@"addcartcheckint one value:%d",addcartcheckint);
            [self performSelector:@selector(getListItemsInCart) withObject:nil afterDelay:0.0];
                }else if (addcartcheckint==1) {
                    NSLog(@"addcartcheckint zero value:%d",addcartcheckint);
                    addcartcheckint=0;
                    [self countOfCartItems];
                }
            
            }
        }else{
            NSLog(@"tappedbtn zero condition else");
            if ([cartid_check isEqualToString:@"false"]) {
                NSLog(@"cartid in local db is empty");
            }else{
           // [self addProductToCart];
            }
        
        }
        
    }
}

-(void)countOfCartItems{

    
    //[self cartCreateIfNotExist];
    @try {
        
    
    if(![cartid_check isEqualToString:@"false"]){
    NSString *str_cartlistitems = [NSString stringWithFormat:@"https://dentistkart.com/webservice/cart/totalcart/?cartid=%@",cartid_check];
    
    NSLog(@"str_cartlistitems:%@",str_cartlistitems);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_cartlistitems]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    
    
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    NSError *jsonError;
    // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    
    NSLog(@"dictcart:%@",dict);
    
    if (dict==nil||dict==NULL)
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }else {
        
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        
        
        NSLog(@"enter else");
        
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."])
            
        {
         NSDictionary*createresultdict = [dict objectForKey:@"createResult"];
            NSLog(@"createresutl:%@",createresultdict);
            //cartcountvalue =0;
            //for(NSDictionary*localdict in createresultdict){
              //  NSLog(@"localdict:%@",localdict);
              //  cartcountvalue++;
            //}
            
            cartcountvalue = [[createresultdict objectForKey:@"items_count"] intValue];
            NSLog(@"countcartvalue:%d",cartcountvalue);
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            
            NSLog(@"cart count problem");
        
        }
    }
    }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@",exception);
    }
    @finally {
        NSLog(@"Entered into finally.");
    }
}

-(void)getListItemsInCart{

  // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //hud.labelText = @"Loading....";
    @try {
        
    
    NSString *str_cartlistitems = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/cart/list/?cartid=%@",
                             cartid_check];
    
    NSLog(@"str_cartlistitems:%@",str_cartlistitems);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_cartlistitems]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    
    
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    NSError *jsonError;
    // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    
    NSLog(@"dictcart:%@",dict);
    
    if (dict==nil||dict==NULL)
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else {
        
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        
        
        NSLog(@"enter else");
        
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."])
            
        {
            NSLog(@"enter success block");
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            if ([[dict objectForKey:@"createResult"] isEqual:@"[]"]) {
                
                
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Cart Alert" message:@"Your Cart is Empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                [alert release];
                
                
            }else{
                
                //cart_scrollview.translatesAutoresizingMaskIntoConstraints=NO;
           NSDictionary*createresultdict = [dict objectForKey:@"createResult"];
           
           // NSMutableArray * createresultinarr;
            
            //createresultinarr = [[NSMutableArray alloc]initWithArray:[dict objectForKey:@"createResult"]];
            
            NSDictionary*dictfirst = [dict objectForKey:@"cartInfo"];
            NSMutableArray * jsoninarr = [[NSMutableArray alloc]initWithArray:[dictfirst objectForKey:@"items"]];
            NSLog(@"jsoninarr:%@",jsoninarr);
            NSLog(@"cartInfo data:%@",dictfirst);
            NSMutableArray*grandtotaljson_arr =[dict objectForKey:@"cartTotal"];
            
           // NSMutableArray*tempimgurlarr= [[NSMutableArray alloc]init];
            
            double sumofproductprice,carttotaldouble=0.0;
            NSLog(@"createresutl:%@",createresultdict);
            for(NSDictionary*localdict in createresultdict){
                NSLog(@"localdict:%@",localdict);
                
                [product_imgurl_arr addObject:[localdict objectForKey:@"imgurl"]];
               // [tempimgurlarr addObject:[localdict objectForKey:@"imgurl"]];
                
                NSString*specialprice_str=[localdict objectForKey:@"special_price"];
                
                if ([specialprice_str isEqualToString:@""]||[specialprice_str isEqualToString:@"<null>"]||[specialprice_str isEqualToString:@"null"]||[specialprice_str isEqualToString:@"(null)"]||specialprice_str ==nil||specialprice_str==NULL||[specialprice_str isEqual:[NSNull null]]){
                    NSLog(@"enter in price:%@",specialprice_str);
               [special_view_price_arr addObject:[localdict objectForKey:@"price"]];
                    sumofproductprice = [[localdict objectForKey:@"price"] doubleValue];
                }
                else{
                    NSLog(@"enter in special_price:%@",specialprice_str);
                [special_view_price_arr addObject:[localdict objectForKey:@"special_price"]];
                    sumofproductprice = [[localdict objectForKey:@"special_price"] doubleValue];
                }
                //sumofproductprice = sumofproductprice+[[localdict objectForKey:@"special_price"] doubleValue];
            }
            
           // int countRow=0;
            NSLog(@"jsoninarr count:%lu",(unsigned long)jsoninarr.count);
            for (int i=0; i<jsoninarr.count; i++) {
                NSLog(@"for loop enter");
                NSDictionary*dictcartitems = [jsoninarr objectAtIndex:i];
                [product_id_arr addObject:[dictcartitems objectForKey:@"product_id"]];
                [product_name_arr addObject:[dictcartitems objectForKey:@"name"]];
                //[special_view_price_arr addObject:[dictcartitems objectForKey:@"price"]];
                [special_view_shiiping_rate_arr addObject:[dictcartitems objectForKey:@"free_shipping"]];
                [sp_view_discount_arr addObject:[dictcartitems objectForKey:@"discount_amount"]];
                [quantity_arr addObject:[dictcartitems objectForKey:@"qty"]];
                
                
                if ([[dictcartitems objectForKey:@"qty"]intValue]>0) {
                    NSLog(@"entred if i checked");
                    carttotaldouble = carttotaldouble+([[special_view_price_arr objectAtIndex:i]doubleValue]*[[dictcartitems objectForKey:@"qty"] intValue]);
                }
                
                NSLog(@"carttotaldouble ckeck:%f",carttotaldouble);
                //[sp_view_total_arr addObject:[dictcartitems objectForKey:@""]];
                
                //UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(20,20 + (cart_scrollview.frame.size.height * countRow), [self screenSize].width-40,([self screenSize].height-self.total_displayview.frame.size.height))];
                
                //UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(20,20 + (cart_scrollview.frame.size.height * countRow), [self screenSize].width-40,[self screenSize].height/4)];
                
                
                
                /*
                 UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(20,20+([self screenSize].width/3)* countRow, [self screenSize].width-40,([self screenSize].width/3)-10)];
                
                
                NSLog(@"check1");
                //[viewarrive setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:1.0f]];
                [viewarrive setBackgroundColor:[UIColor colorWithWhite:03 alpha:1.0f]];
                NSLog(@"out1");
              //  NSString*urlstr = @"https://www.dentistkart.com/media/catalog/product/t/e/tetric_n-flow.jpg";
                  NSString*urlstr = [[NSString alloc]initWithFormat:@"%@",[tempimgurlarr objectAtIndex:i]];
                NSLog(@"out1");
                
                
                
                UIButton *iconbtn=[[UIButton alloc]init];
                NSLog(@"out2");
                [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                    //  self.product_big_imageview.image = [UIImage imageWithData:data];
                    NSLog(@"iconbtn image set");
                    [iconbtn setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
                }];
                NSLog(@"out3");
                iconbtn.tag = countRow;
                // [iconbtn setTag:[[recentlybrought_productsids objectAtIndex:number]intValue]];
                iconbtn.layer.borderWidth=1.0;
                iconbtn.layer.cornerRadius=2.0;
                [iconbtn setTranslatesAutoresizingMaskIntoConstraints:NO];
                
                NSLog(@"out4");
                
                
               // UILabel *lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(150, 25, 150, 21)];
                 UILabel *lblnameTemp = [[UILabel alloc] init];
                lblnameTemp.text = [NSString stringWithFormat:@"%@", [dictcartitems objectForKey:@"name"]];
                lblnameTemp.adjustsFontSizeToFitWidth = YES;
                lblnameTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
                [lblnameTemp setTranslatesAutoresizingMaskIntoConstraints:NO];
                NSLog(@"lblnameTemp.text:%@",lblnameTemp.text);
                 NSLog(@"out5");
                ////////////////////////////////TextField for Qty/////////////////////////////////////
               UITextField*txtFieldQty = [[UITextField alloc]init];
                txtFieldQty.delegate=self;
                txtFieldQty.text = [NSString stringWithFormat:@"%@",[dictcartitems objectForKey:@"qty"]];
                txtFieldQty.adjustsFontSizeToFitWidth=YES;
                [txtFieldQty setBorderStyle:UITextBorderStyleRoundedRect];
                txtFieldQty.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
                txtFieldQty.textAlignment = ALIGN_CENTER;
                txtFieldQty.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
                [txtFieldQty setTranslatesAutoresizingMaskIntoConstraints:NO];
                txtFieldQty.keyboardType = UIKeyboardTypeNumberPad;
                [txtFieldQty addTarget:self
                                action:@selector(textfeildChanged:)
                      forControlEvents:UIControlEventEditingChanged];
                
               
                
               // UILabel *lblQty = [[UILabel alloc] initWithFrame:CGRectMake(150, 55, 150, 21)];
                 UILabel *lblQty = [[UILabel alloc] init];
                lblQty.text = @"Quantity:";
                lblQty.adjustsFontSizeToFitWidth = YES;
                lblQty.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
                [lblQty setTranslatesAutoresizingMaskIntoConstraints:NO];
                NSLog(@"out6");
                
                
                
                UIButton *btnTempUpdate = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                //[btnTempDelete addTarget:self action:@selector(sampleDelete:) forControlEvents:UIControlEventTouchUpInside];
              //  btnTempUpdate.frame = CGRectMake(10,210, viewarrive.frame.size.width-10, 21);
                btnTempUpdate.titleLabel.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
                [btnTempUpdate setTitle:@"Update" forState:UIControlStateNormal];
                btnTempUpdate.tag = [[dictcartitems objectForKey:@"product_id"] intValue];
               //btnTempUpdate.titleLabel.textColor = [UIColor whiteColor];
                [btnTempUpdate setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                //btnTempUpdate.titleLabel.textColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
                btnTempUpdate.backgroundColor =  [UIColor colorWithRed: 79.0/255.0 green: 194.0/255.0 blue:232.0/255.0 alpha: 1.0];
                [btnTempUpdate addTarget:self action:@selector(updateItemFromCartPage:) forControlEvents:UIControlEventTouchUpInside];
                [btnTempUpdate setTranslatesAutoresizingMaskIntoConstraints:NO];

                  NSLog(@"out7");
                UIButton *btnTempPrice = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                //[btnTempDelete addTarget:self action:@selector(sampleDelete:) forControlEvents:UIControlEventTouchUpInside];
                //btnTempPrice.frame = CGRectMake(250,170 , 50, 21);
                btnTempPrice.titleLabel.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
               // btnTempPrice.layer.borderWidth=1.0;
                
                //btnTempPrice.layer.borderColor = [UIColor grayColor].CGColor;
               // UIImage*image =[UIImage imageNamed:@"rightarrow"];
                //[btnTempPrice setImage:image forState:UIControlStateNormal];
                //btnTempPrice.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0,5);
                //btnTempPrice.imageEdgeInsets = UIEdgeInsetsMake(0., 0., 0.,10.);
                //btnTempPrice.titleEdgeInsets = UIEdgeInsetsMake(0., image.size.width, 0., 0.);
                
                [btnTempPrice setTitle:[NSString stringWithFormat: @"Price: Rs %.2f", [[special_view_price_arr objectAtIndex:i]doubleValue]] forState:UIControlStateNormal];
                btnTempPrice.tag = i;
                //[btnTempPrice.titleLabel setTextAlignment:NSTextAlignmentCenter];
                [btnTempPrice addTarget:self action:@selector(viewSpecialPrice:) forControlEvents:UIControlEventTouchUpInside];
                [btnTempPrice setTranslatesAutoresizingMaskIntoConstraints:NO];
               
                NSLog(@"out8");
                UIButton *btnTempDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                //[btnTempDelete addTarget:self action:@selector(sampleDelete:) forControlEvents:UIControlEventTouchUpInside];
                btnTempDelete.frame = CGRectMake(10,210, viewarrive.frame.size.width-10, 21);
              // btnTempDelete.titleLabel.textColor = [UIColor whiteColor];
                btnTempDelete.titleLabel.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
                [btnTempDelete setTitle:@"Remove" forState:UIControlStateNormal];
                btnTempDelete.tag = [[dictcartitems objectForKey:@"product_id"] intValue];
               [btnTempDelete setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                //[btnTempDelete setTitleColor:[UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:1.0f] forState:UIControlEventTouchUpInside];
                btnTempDelete.backgroundColor =  [UIColor colorWithRed: 176.0/255.0 green: 63.0/255.0 blue:63.0/255.0 alpha: 1.0];
                [btnTempDelete addTarget:self action:@selector(deleteItemFromCartPage:) forControlEvents:UIControlEventTouchUpInside];
                [btnTempDelete setTranslatesAutoresizingMaskIntoConstraints:NO];
                NSLog(@"out9");
                [viewarrive addSubview:iconbtn];
                [viewarrive addSubview:lblnameTemp];
                [viewarrive addSubview:txtFieldQty];
                [viewarrive addSubview:lblQty];
                [viewarrive addSubview:btnTempUpdate];
                //[viewarrive addSubview:txtFieldQty];
                //[viewarrive addSubview:lblprice];
                [viewarrive addSubview:btnTempPrice];
                [viewarrive addSubview:btnTempDelete];
                
                
                NSLayoutConstraint *leadingiconbtn = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
               
               // NSLayoutConstraint *leadingprodname = [NSLayoutConstraint constraintWithItem:iconbtn attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lblnameTemp attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];

               NSLayoutConstraint *trailingprodname = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:lblnameTemp attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
                
                NSLayoutConstraint *topprodname = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblnameTemp attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
                
               
                 NSLayoutConstraint *trailingsprice = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:lblnameTemp attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
               
               
                
                NSDictionary*newviews = @{@"iconbtn":iconbtn,@"lblnameTemp":lblnameTemp,@"lblQty":lblQty,@"txtFieldQty":txtFieldQty,@"btnTempUpdate":btnTempUpdate,@"btnTempPrice":btnTempPrice,@"btnTempDelete":btnTempDelete};
               
                
                NSString* num = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.width-40)];
                NSString* numheight = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.height)/2];
                
                NSString* imgwidth = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.width/3)];
                NSDictionary*newmetrics = @{@"width":num,@"height":numheight};
                
                NSString* imgheight = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.height/3)*2.5];
                NSDictionary*metricsimg = @{@"width":imgwidth,@"height":imgheight};
                
               
                
                    if ([self screenSize].width<500) {
                    
                    
                    NSArray *horizontalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[iconbtn(width)]-5-[lblnameTemp]" options:0 metrics:metricsimg views:newviews];
                    
                    
                    NSArray *horizontalConstraintsqty1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[iconbtn(width)]-5-[lblQty]-2-[txtFieldQty(25)]-5-[btnTempUpdate]" options:0 metrics:metricsimg views:newviews];
                    
                    NSArray *horizontalConstraintsprice1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[iconbtn(width)]-5-[btnTempPrice]" options:0 metrics:metricsimg views:newviews];
                    
                    
                    NSArray *horizontalConstraintsone1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[iconbtn(width)]-5-[btnTempDelete]-10-|" options:0 metrics:newmetrics views:newviews];
                    
                    
                    
                    [viewarrive addConstraints:horizontalConstraintsone1];
                    [viewarrive addConstraints:horizontalConstraintsqty1];
                    [viewarrive addConstraints:horizontalConstraintsprice1];
                    [viewarrive addConstraints:horizontalConstraints1];
                }else{
                    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[iconbtn(width)]-20-[lblnameTemp]" options:0 metrics:metricsimg views:newviews];
                    NSArray *horizontalConstraintsqty =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[iconbtn(width)]-20-[lblQty]-2-[txtFieldQty(50)]-10-[btnTempUpdate]" options:0 metrics:metricsimg views:newviews];
                    
                    NSArray *horizontalConstraintsprice =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[iconbtn(width)]-20-[btnTempPrice]" options:0 metrics:metricsimg views:newviews];
                    
                    NSArray *horizontalConstraintsone =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[iconbtn(width)]-20-[btnTempDelete]-20-|" options:0 metrics:newmetrics views:newviews];
                    
                    [viewarrive addConstraints:horizontalConstraintsone];
                    [viewarrive addConstraints:horizontalConstraintsqty];
                    [viewarrive addConstraints:horizontalConstraintsprice];
                    [viewarrive addConstraints:horizontalConstraints];
                    
                }
                
                ///Horizontal views///////////////////////////
                   if([self screenSize].width<500){
                    // NSArray *verticalConstraintsPrice =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[lblnameTemp]-20-[btnTempPrice]-20-[lblQty]-20-[btnTempDelete(50)]-20-|" options:0 metrics:metricsimg views:newviews];
                    NSArray *verticalConstraintsPrice1 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[lblnameTemp]-5-[btnTempPrice]-5-[lblQty]-5-[btnTempDelete(20)]-5-|" options:0 metrics:metricsimg views:newviews];
                    
                    //[viewarrive addConstraints:verticalConstraintsPrice];
                    [viewarrive addConstraints:verticalConstraintsPrice1];
                    
                    //NSArray *verticalConstraintsQty =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[lblnameTemp]-20-[btnTempPrice]-20-[txtFieldQty(50)]-20-[btnTempDelete(50)]-20-|" options:0 metrics:metricsimg views:newviews];
                    //[viewarrive addConstraints:verticalConstraintsQty];
                    NSArray *verticalConstraintsQty1 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[lblnameTemp]-5-[btnTempPrice]-5-[txtFieldQty(30)]-5-[btnTempDelete(20)]-5-|" options:0 metrics:metricsimg views:newviews];
                    [viewarrive addConstraints:verticalConstraintsQty1];
                    
                    //NSArray *verticalConstraintsupdate =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[lblnameTemp]-20-[btnTempPrice]-20-[btnTempUpdate(50)]-20-[btnTempDelete(50)]-20-|" options:0 metrics:metricsimg views:newviews];
                    NSArray *verticalConstraintsupdate1 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[lblnameTemp]-5-[btnTempPrice]-5-[btnTempUpdate(30)]-5-[btnTempDelete(50)]-5-|" options:0 metrics:metricsimg views:newviews];
                    
                    //[viewarrive addConstraints:verticalConstraintsupdate];
                    [viewarrive addConstraints:verticalConstraintsupdate1];
                    
                    [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[iconbtn(height)]-5-|" options:kNilOptions metrics:metricsimg views:newviews]];
                    
                    
                }else{
                    NSArray *verticalConstraintsPrice =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[lblnameTemp]-20-[btnTempPrice]-20-[lblQty]-20-[btnTempDelete(50)]-20-|" options:0 metrics:metricsimg views:newviews];
                    
                    [viewarrive addConstraints:verticalConstraintsPrice];
                    
                    NSArray *verticalConstraintsQty =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[lblnameTemp]-20-[btnTempPrice]-20-[txtFieldQty(50)]-20-[btnTempDelete(50)]-20-|" options:0 metrics:metricsimg views:newviews];
                    [viewarrive addConstraints:verticalConstraintsQty];
                    
                    NSArray *verticalConstraintsupdate =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[lblnameTemp]-20-[btnTempPrice]-20-[btnTempUpdate(50)]-20-[btnTempDelete(50)]-20-|" options:0 metrics:metricsimg views:newviews];
                    
                    [viewarrive addConstraints:verticalConstraintsupdate];
                    [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[iconbtn(height)]-20-|" options:kNilOptions metrics:metricsimg views:newviews]];
                }
                

               [viewarrive addConstraints:@[leadingiconbtn,trailingprodname,topprodname,trailingsprice]];
                
                [cart_scrollview addSubview:viewarrive];
                               countRow = countRow + 1;
                
                            }
             
                
                    NSLog(@"jsoninarr.count==i+1");
                    [cart_scrollview setContentSize:CGSizeMake([self screenSize].width, ([self screenSize].width/3+10)+([self screenSize].width/3-10)*countRow)];
    
                
                
                */
                
            }
            
            
            tappedButton_addcart_btn.tag=0;
            
           // [self countOfCartItems];
            
            NSLog(@"grandtotal:%@",grandtotaljson_arr);
            NSLog(@"grandtotal count:%d",(int)grandtotaljson_arr.count);
            
            if (grandtotaljson_arr.count==3) {
            NSDictionary*dicttotal = [grandtotaljson_arr objectAtIndex:2];
            //global_cart_total = [[NSString alloc]initWithFormat:@"Total(%lu)",(unsigned long)jsoninarr.count];
            //self.total_lbl_dis.text = [[NSString alloc]initWithFormat:@"Total(%lu)",(unsigned long)jsoninarr.count];
            //NSString*amount_str = ;
            global_grandprice_str = [[NSString alloc]initWithFormat:@"%@",[dicttotal objectForKey:@"amount"]];
            self.cart_total.text = [[NSString alloc]initWithFormat:@"%.2f",[[dicttotal objectForKey:@"amount"]doubleValue]];
                //grandtotal_str = [[NSMutableString alloc]initWithFormat:@"%.2f",[[dicttotal objectForKey:@"amount"]doubleValue]];
            }else if (grandtotaljson_arr.count==2) {
                NSDictionary*dicttotal = [grandtotaljson_arr objectAtIndex:1];
              //  global_cart_total = [[NSString alloc]initWithFormat:@"Total(%lu)",(unsigned long)jsoninarr.count];
                //self.total_lbl_dis.text = [[NSString alloc]initWithFormat:@"Total(%lu)",(unsigned long)jsoninarr.count];
                //NSString*amount_str = ;
            
                if ([[dicttotal objectForKey:@"amount"] doubleValue]==0.0) {
                    NSLog(@" if carttotaldouble value:%f",carttotaldouble);
                    global_grandprice_str = [[NSString alloc]initWithFormat:@"%f",carttotaldouble];
                    self.cart_total.text = [[NSString alloc]initWithFormat:@"%.2f",carttotaldouble];
                }else{
                    NSLog(@"else empty");
                global_grandprice_str = [[NSString alloc]initWithFormat:@"%@",[dicttotal objectForKey:@"amount"]];
                self.cart_total.text = [[NSString alloc]initWithFormat:@"%.2f",[[dicttotal objectForKey:@"amount"]doubleValue]];
                }
            }
            else{
                NSLog(@"carttotaldouble value:%f",carttotaldouble);
                global_grandprice_str = [[NSString alloc]initWithFormat:@"%f",carttotaldouble];
                self.cart_total.text = [[NSString alloc]initWithFormat:@"%.2f",carttotaldouble];
            }
            
            self.cart_total.font = [UIFont systemFontOfSize:[self screenSize].width/20];
            self.total_lbl_dis.font = [UIFont systemFontOfSize:[self screenSize].width/20];
            self.checkout_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
            
            
            [self.carttableview reloadData];
            self.total_displayview.hidden=NO;
                
                
                
            }
            
            //[self.carttableview reloadData];
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            self.total_displayview.hidden=YES;
            self.emptycart_view.frame = CGRectMake(0,100,[self screenSize].width, ([self screenSize].height-100));
            self.emptycart_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];
            self.shoppingcart_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
            self.emptycartsublbl_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
            self.gotohomepage_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
            
            //[self.cart_scrollview addSubview:self.emptycart_view];
            [self.view addSubview:self.emptycart_view];
            //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            //[alert show];
        }
    }

        
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception cart service:%@",exception);
    }
    @finally {
        NSLog(@"Finally block cart service");
    }
}

-(IBAction)viewSpecialPrice:(id)sender{
    
    NSLog(@"enter in viewSpecialPrice");
    UIButton*tapped_btn = (UIButton*)sender;
    self.normal_price_lbl.text = [special_view_price_arr objectAtIndex:tapped_btn.tag];
    self.shipping_price_lbl.text = [special_view_shiiping_rate_arr objectAtIndex:tapped_btn.tag];
    self.dicount_price.text = [sp_view_discount_arr objectAtIndex:tapped_btn.tag];
    self.special_price_view.hidden=NO;
}


-(IBAction)deleteItemFromCartPage:(id)sender{

    /*
    indicatorroll = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake([self screenSize].width/2, [self screenSize].height/2, [self screenSize].width/4,[self screenSize].width/4)];
    [indicatorroll setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [indicatorroll setBackgroundColor:[UIColor blackColor]];
    [self.cart_scrollview addSubview:indicatorroll];
    [indicatorroll startAnimating];
*/
    
    UIButton*product_id_sender = (UIButton*)sender;
    
    int prodid = [[product_id_arr objectAtIndex:product_id_sender.tag]intValue];
    
    
    //tappedButton_addcart_btn = (UIButton*)sender;
       // [self removeItemsFromCartView];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Removing....";
    
    
    NSString *str_deleteItemFromCart = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/cart/remove/?cartid=%@&productid=%d",
                                        cartid_check,prodid];
    
    NSLog(@"str_deleteItemFromCart:%@",str_deleteItemFromCart);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_deleteItemFromCart]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    
    
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    NSError *jsonError;
    // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    
    NSLog(@"dict:%@",dict);
    
    if (dict==nil||dict==NULL)
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else {
        
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        
        
        NSLog(@"enter else");
        
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."])
            
        {
            NSLog(@"enter success block delete deleteItemFromCartPage");
            
            //NSString*result = [dict objectForKey:@"createResult"];
            int successornot = [[dict objectForKey:@"createResult"]intValue];
            if(successornot==1){
                //[self.cart_scrollview reloadInputViews];
                
                
                [product_id_arr removeObjectAtIndex:product_id_sender.tag];
                [special_view_price_arr removeObjectAtIndex:product_id_sender.tag];
                [product_imgurl_arr removeObjectAtIndex:product_id_sender.tag];
                [product_name_arr removeObjectAtIndex:product_id_sender.tag];
                [special_view_shiiping_rate_arr removeObjectAtIndex:product_id_sender.tag];
                [sp_view_discount_arr removeObjectAtIndex:product_id_sender.tag];
                [quantity_arr removeObjectAtIndex:product_id_sender.tag];
                double carttotaldouble=0.0;
                
                for (int i=0; i<special_view_price_arr.count; i++) {
                    carttotaldouble = carttotaldouble+([[special_view_price_arr objectAtIndex:i]doubleValue]*[[quantity_arr objectAtIndex:i] intValue]);
                }
                NSLog(@"carttotaldouble delte:%f",carttotaldouble);
                
                self.cart_total.text = [[NSString alloc]initWithFormat:@"%0.2f",carttotaldouble];
                
                
                [self.carttableview reloadData];
                
               // [self removingCartItems];
                //[self getListItemsInCart];
                // [indicatorroll stopAnimating];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                //[self viewDidLoad];
                /*
                 CartVC*cvc = [[CartVC alloc]initWithNibName:@"CartVC" bundle:[NSBundle mainBundle]];
                 [self.navigationController pushViewController:cvc animated:YES];
                 */
                tappedButton_addcart_btn=nil;
                cartcountvalue--;
                
            }else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Your item has not removed from cart" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                
            }
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
    
    

}


-(void)removeItemsFromCartView{
   
    

}

-(IBAction)updateItemFromCartPage:(id)sender{
    [sender resignFirstResponder];
    
    tappedButton_addcart_btn = (UIButton*)sender;
    
    NSLog(@" entred updateItemFromCartPage");
    //if ([self.tempQtyValue isEqualToString:@""]) {
        
    //}else{
    NSLog(@"tempQtyValue value:%@",self.tempQtyValue);
    NSScanner* scan = [NSScanner scannerWithString:self.tempQtyValue];
    
    NSLog(@"scanner:%@",scan);
    int val;
    NSLog(@"isNumeric we are complted");
    BOOL isNumeric = [scan scanInt:&val] && [scan isAtEnd];
    
    
    //NSScanner*scanner = [NSScanner scannerWithString:tempQtyValue];
    
    //BOOL isNumeric = [scanner scanInteger:NULL]&&[scanner isAtEnd];
    NSLog(@"isNumeric:%d",isNumeric);
    if (isNumeric) {

    if ([self.tempQtyValue intValue]!=0) {
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"updating....";
        
    
    NSString *str_deleteItemFromCart = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/cart/update/?cartid=%@&productid=%ld&quantity=%@",
                                        cartid_check,(long)tappedButton_addcart_btn.tag,self.tempQtyValue];
    
    NSLog(@"str_updateItemFromCart:%@",str_deleteItemFromCart);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_deleteItemFromCart]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    
    
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    NSError *jsonError;
    // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    
    NSLog(@"dict:%@",dict);
    
    if (dict==nil||dict==NULL)
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else {
        
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        
        
        NSLog(@"enter else");
        
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."])
            
        {
            NSLog(@"enter success block updateItemFromCartPage");
            
           // NSString*result = [dict objectForKey:@"createResult"];
            int resultvalue = [[dict objectForKey:@"createResult"]intValue];
            if(resultvalue==1){
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                
                [product_name_arr removeAllObjects];
                [special_view_price_arr removeAllObjects];
                [product_id_arr removeAllObjects];
                [product_imgurl_arr removeAllObjects];
                [special_view_shiiping_rate_arr removeAllObjects];
                [sp_view_discount_arr removeAllObjects];
                [quantity_arr removeAllObjects];
                
                [self getListItemsInCart];
                
                
                
                //[self removingCartItems];
                
                
                //[self getListItemsInCart];
                //[self.carttableview reloadData];
                //[self getListItemsInCart];
               // addcartcheckint=2;
                //CartVC*cvc = [[CartVC alloc]init];
                //[self presentViewController:cvc animated:YES completion:nil];
            }
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Quantity shouldn't be zero" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];

    }
    
    }else{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Quantity should be a number" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    }
    //}


}


// pragma mark is used for easy access of code in Xcode
#pragma mark - TextField Delegates

// This method is called once we click inside the textField
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"Text field did begin editing");
    
    NSLog(@"textFieldShouldBeginEditing");
    NSLog(@"textfeild value QTY:%@",textField.text);
   [self setTempQtyValue:textField.text];
    //tempQtyValue=textField.text;
    NSLog(@"tempQtyValue:%@",self.tempQtyValue);
    //[self textFieldDidEndEditing:textField];
    //[self textFieldShouldClear:textField];
    
}

// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"Text field ended editing");
    //[textField resignFirstResponder];
    NSLog(@"end editing textfeild value QTY:%@",textField.text);
    [self setTempQtyValue:textField.text];
    

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"end textFieldShouldReturn value QTY:%@",textField.text);
        NSLog(@"empty textfeild");
        //[self alertPopForEmpty];
    //[textField resignFirstResponder];
    [self setTempQtyValue:textField.text];
   
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    NSLog(@"textFieldShouldClear");
    textField.text=@"";
    return YES;
}
-(void)alertPopForEmpty{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Quantity shouldn't be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(IBAction)textfeildChanged:(id)sender{
    NSLog(@"value changed:%@",sender);
    [self textFieldShouldReturn:sender];
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





- (IBAction)drop_down_click_user:(id)sender{
    UIButton*tappedButton =  (UIButton*)sender;
    NSLog(@"drop_down_click_user:%lu",(unsigned long)tappedButton.tag);
    NSLog(@"pageIdentify_str drop down:%@",pageIdentify_str);
    if ([pageIdentify_str isEqualToString:@"ProductsViewController"]) {
        [self callProductspage];
    }else if ([pageIdentify_str isEqualToString:@"CategoriesViewController"]){
        [self callCategoriesPage];
    }else if ([pageIdentify_str isEqualToString:@"MyAddressVC"]){
        [self callCutomerAddress];
    }else if ([pageIdentify_str isEqualToString:@"MyOrdersVC"]){
        [self orders_btn_click:nil];
    }else if ([pageIdentify_str isEqualToString:@"CategoryProductsView"]){
        //CategoryProductsView *cpv = [[CategoryProductsView alloc]initWithNibName:@"CategoryProductsView" bundle:[NSBundle mainBundle]];
        //[self.navigationController pushViewController:cpv animated:YES];
        
        CategoryProductsView *cpv = [[CategoryProductsView alloc]init];
        [self presentViewController:cpv animated:YES completion:nil];

    }else if ([pageIdentify_str isEqualToString:@"ProductDetails"]){
        //ProductDetails *pdv = [[ProductDetails alloc]initWithNibName:@"ProductDetails" bundle:[NSBundle mainBundle]];
        //[self.navigationController pushViewController:pdv animated:YES];
        ProductDetails *pdv = [[ProductDetails alloc]init];
        [self presentViewController:pdv animated:YES completion:nil];
        
        
    }else if ([pageIdentify_str isEqualToString:@"MyAccountEditVC"]){
        //MyAccountEditVC *mavc = [[MyAccountEditVC alloc]initWithNibName:@"MyAccountEditVC" bundle:[NSBundle mainBundle]];
        //[self.navigationController pushViewController:mavc animated:YES];
        
        MyAccountEditVC *mavc = [[MyAccountEditVC alloc]init];
        [self presentViewController:mavc animated:YES completion:nil];
        
    }else if ([pageIdentify_str isEqualToString:@"MyAccountView"]){
        [self callMyAccountPage];
    }else if ([pageIdentify_str isEqualToString:@"DeintistkartInfoVC"]){
        [self callDentistKartInfo];
    }else if ([pageIdentify_str isEqualToString:@"ContactUsVC"]){
        [self leftMenuContactusClick:nil];
    }else if ([pageIdentify_str isEqualToString:@"PromotionsVC"]){
        [self leftMenuPromotionClick:nil];
    }else if ([pageIdentify_str isEqualToString:@"SearchVC"]){
       // SearchVC *svc = [[SearchVC alloc]initWithNibName:@"SearchVC" bundle:[NSBundle mainBundle]];
        //[self.navigationController pushViewController:svc animated:YES];
        SearchVC *svc = [[SearchVC alloc]init];
        [self presentViewController:svc animated:YES completion:nil];
    }else if ([pageIdentify_str isEqualToString:@"OrderVC"]){
        //OrderVC *ovc = [[OrderVC alloc]initWithNibName:@"OrderVC" bundle:[NSBundle mainBundle]];
        //[self.navigationController pushViewController:ovc animated:YES];
        OrderVC *ovc = [[OrderVC alloc]init];
        [self presentViewController:ovc animated:YES completion:nil];
    }
    
    
    /*
    if(tappedButton.tag ==1){
        //drop_down_view.hidden=NO;
        leftmenulist_view.hidden=NO;
        [drop_down_btn_pro setTag:2];
        
    }else if(tappedButton.tag ==2){
        [drop_down_btn_pro setTag:1];
        //drop_down_view.hidden=YES;
        leftmenulist_view.hidden=YES;
    }
*/
    
    
    
    
    /*
    if(tappedButton.tag ==1){
        drop_down_view.hidden=NO;
        [drop_down_btn_pro setTag:2];
        
    }else if(tappedButton.tag ==2){
        [drop_down_btn_pro setTag:1];
        drop_down_view.hidden=YES;
    }
     
     */
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
    [_special_price_view release];
    [_normal_price_lbl release];
    [_shipping_price_lbl release];
    [_dicount_price release];
    [_total_amount_lbl release];
    [_leftmenu_underview release];
    [_show_user_not_log_view release];
    [_dentistkartname_lbl release];
    [_total_displayview release];
    [_shoppingcart_lbl release];
    [_emptycart_view release];
    [_emptycart_lbl release];
    [_emptycartsublbl_lbl release];
    [_gotohomepage_btn release];
    [_promocode_txtfeild release];
    [_apply_btn release];
    [_promocode_status_lbl release];
    [_carttableview release];
    [_cartscrollview release];
    [super dealloc];
}
- (IBAction)promotions_btn_click:(id)sender {
}

- (IBAction)products_btn_click:(id)sender {
    [self callProductspage];
    }

- (IBAction)orders_btn_click:(id)sender {
    //MyOrdersVC *movc = [[MyOrdersVC alloc]initWithNibName:@"MyOrdersVC" bundle:[NSBundle mainBundle]];
    
    //[self.navigationController pushViewController:movc animated:YES];
    
    MyOrdersVC *movc = [[MyOrdersVC alloc]init];
    [self presentViewController:movc animated:YES completion:nil];
}

- (IBAction)cart_btn_click:(id)sender {
}

- (IBAction)more_btn_click:(id)sender {
}

- (IBAction)goToHomePage:(id)sender {
    [self callProductspage];
    
}

- (IBAction)continueShopping_Click:(id)sender {
    [self callProductspage];

}

- (IBAction)checkOut_click:(id)sender {
    
    @try {
        
    
pageIdentify_str=@"CartVC";
     NSLog(@"logged_user_id:%@",logged_user_id);
    if ([logged_user_id isEqualToString:@"(null)"]||[logged_user_id isEqualToString:@""]||logged_user_id==nil||logged_user_id==NULL)
    {
        NSLog(@"logged_user_id:%@",logged_user_id);
        //[self loginAsUser];
        customer_type_str=@"Guest";
        global_page_id=@"MyAddressVC";
       // [self callCutomerAddress];
        if ([UIAlertView class]) {
            
            NSLog(@"UIAlertView");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please checkout either as a Guest or by Login." delegate:self cancelButtonTitle:@"Guest" otherButtonTitles:@"Login",nil];
        [alert show];
        [alert release];
        }
        
        
        else if([UIAlertController class]){
         NSLog(@"UIAlertController");
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Alert"
                                      message:@"Please checkout either as a Guest or by Login."
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Guest"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel your yes please button action here
                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                        [self guestAsUser];
                                        
                                    }];
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"Login"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       [self loginAsUser];
                                   }];
        
        [alert addAction:yesButton];
        [alert addAction:noButton];
        [self presentViewController:alert animated:YES completion:nil];
        }
         
        
    }
         
         
         else {
             NSLog(@"else [self callCutomerAddress] called ");
        customer_type_str=@"Customer";
        
       // [self callCutomerAddress];
             [self performSelector:@selector(callCutomerAddress) withObject:nil afterDelay:0.0];
    
    }
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception alert guest:%@",exception);
    }
    @finally {
        NSLog(@"finally in guest alert");
    }
    
}

-(void)callCutomerAddress{
   // MyAddressVC *mavc = [[MyAddressVC alloc]initWithNibName:@"MyAddressVC" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:mavc animated:NO];
    //[mavc popoverPresentationController];
    //mavc.modalPresentationStyle = UIModalPresentationPopover;
    NSLog(@"called callCutomerAddress entered");
     MyAddressVC *mavc = [[MyAddressVC alloc]init];
    
    [self presentViewController:mavc animated:YES completion:nil];
    NSLog(@"leaved callCutomerAddress");
}

-(void)guestAsUser{
    NSLog(@"guest");
    customer_type_str=@"Guest";
    [self callCutomerAddress];
}
-(void)loginAsUser{
    NSLog(@"login");
    customer_type_str=@"Customer";
    [self login];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Alert index:%ld",(long)buttonIndex);
    
    if(buttonIndex==0)
    {
        customer_type_str=@"Guest";
        [self callCutomerAddress];
        
    }
    else  if(buttonIndex==1)
    {
        
        [self login];
    }
}


-(void)callProductspage{
   // ProductsViewController *pvc = [[ProductsViewController alloc]initWithNibName:@"ProductsViewController" bundle:[NSBundle mainBundle]];
    
    //[self.navigationController pushViewController:pvc animated:YES];

    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    [self presentViewController:pvc animated:YES completion:nil];


}


- (IBAction)logoutUser:(id)sender {
   // [self logOut];
    [self callProductspage];
    [self logOut];
    
    
}
-(void)login{
    //LoginViewController *lvc = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:lvc animated:NO];
    LoginViewController*lvc = [[LoginViewController alloc]init];
    [self presentViewController:lvc animated:YES completion:nil];
}

-(void)logOut{
    NSLog(@"Logout form cart");
    ProductsViewController *pcvout = [[ProductsViewController alloc]init];
    [pcvout logOut];
}

- (IBAction)closeusermenupop:(id)sender {
    
    drop_down_view.hidden=YES;
}

///////////////////////////////////////////////////////////////////////
- (IBAction)leftMenuHomeClick:(id)sender {
    ProductsViewController*pvc = [[ProductsViewController alloc]init];
    //[self.navigationController pushViewController:pvc animated:NO];
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
- (IBAction)logoutCall:(id)sender {
}



- (IBAction)closeSpecialViewClick:(id)sender {
    self.special_price_view.hidden=YES;
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
        CartListCell * pcell;
        
        static NSString *cellIdentifier1 = @"cellIdentifierCart";
        pcell = (CartListCell *)[self.carttableview dequeueReusableCellWithIdentifier:cellIdentifier1];
        
        if (pcell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CartListCell"
                                                         owner:self options:nil];
            for (id oneObject in nib) if ([oneObject isKindOfClass:[CartListCell class]])
                pcell = (CartListCell *)oneObject;
        }
        pcell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSString *product_img_str=[[NSString alloc]initWithFormat:@"%@",[product_imgurl_arr objectAtIndex:[indexPath row]]];
        
       // countRow=[[product_id_arr objectAtIndex:indexPath.row]intValue];
        //NSLog(@"countRow in cell:%d",countRow);
        NSLog(@"Product Image Check:%@",product_img_str);
        // pcell.user_name.text =product_img_str;
        
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:product_img_str]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            pcell.cartimageview.image = [UIImage imageWithData:data];
        }];
        product_img_str=nil;
        NSLog(@"crossed 1");
        /*
         URLImageView *iconbtn = [[URLImageView alloc] initWithFrame:CGRectMake(10, 10, pcell.cellfirstview.frame.size.width-20, pcell.cellfirstview.frame.size.height-20)];
         [iconbtn startLoading:product_img_str];
         [pcell.cellfirstview addSubview:iconbtn];
         */
        NSString *name_str=[[NSString alloc]initWithFormat:@"%@",[product_name_arr objectAtIndex:[indexPath row]]];
        pcell.cartprodname_lbl.text = name_str;
        
        pcell.cartprodname_lbl.lineBreakMode = NSLineBreakByWordWrapping;
        pcell.cartprodname_lbl.numberOfLines=0;
        NSLog(@"crossed 2");
        
        name_str=nil;
        NSString *price_str=[[NSString alloc]initWithFormat:@"Rs.%.2f",[[special_view_price_arr objectAtIndex:[indexPath row]] doubleValue]];
        NSLog(@"price_str:%@",price_str);
        pcell.cartpricevalue_lbl.text = price_str;
        price_str=nil;
        
        NSString *qty_str=[[NSString alloc]initWithFormat:@"%d",[[quantity_arr objectAtIndex:[indexPath row]]intValue]];
        NSLog(@"qty_srt:%@",qty_str);
        pcell.cartqty_txtfld.text = qty_str;
        
        pcell.cartqty_txtfld.textAlignment = ALIGN_CENTER;
        
        [pcell.cartqty_txtfld addTarget:self
                        action:@selector(textfeildChanged:)
              forControlEvents:UIControlEventEditingChanged];
            qty_str=nil;
        
        pcell.cartqtyupdate_btn.tag = [[product_id_arr objectAtIndex:[indexPath row]]intValue];
        [pcell.cartqtyupdate_btn addTarget:self action:@selector(updateItemFromCartPage:) forControlEvents:UIControlEventTouchUpInside];
        pcell.cartqtyupdate_btn.layer.cornerRadius=2.0;
        pcell.cartqtyupdate_btn.clipsToBounds=YES;
        
        pcell.cartremove_btn.tag = indexPath.row;
        
        [pcell.cartremove_btn addTarget:self action:@selector(deleteItemFromCartPage:) forControlEvents:UIControlEventTouchUpInside];

        pcell.cartprodname_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        pcell.cartqty_txtfld.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        pcell.cartpricetitle_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        pcell.cartpricevalue_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        pcell.cartqty_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        pcell.cartqtyupdate_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/30];
        pcell.cartremove_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
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
    pageIdentify_str = @"CartVC";
    NSLog(@"didselect");
    prodimages_glb_arr=nil;
    
    // prodid_global_str = [[NSString alloc]initWithFormat:@"%@",[product_id_arr objectAtIndex:[indexPath row]]];
    NSLog(@"indexPath:%ld",(long)indexPath.row);
    global_product_id = [[product_id_arr objectAtIndex:[indexPath row]] intValue];
    NSLog(@"product_id_arr:%@",product_id_arr);
    NSLog(@"global_product:%d",global_product_id);
    
    [self loadProductDetailsView];
}
/*
- (void)selectedCellViewTapped:(UITapGestureRecognizer *)gr {
    
    //(UIView*)gestureRecognizer.view;
    NSLog(@"gr:%@",gr);
    NSLog(@"(UITextView*)gr.view:%@",(UITextView*)gr.view);
    UITextView* txtview = (UITextView*)gr.view;
    int indexval = (int)txtview.tag ;
    NSLog(@"indexval:%d",indexval);
    // NSIndexPath *path = [NSIndexPath indexPathWithIndex:indexval];
    //NSLog(@"path:%@",path);
    //NSLog(@"path row:%d",(int)path.row);
    NSIndexPath *path = [NSIndexPath indexPathForRow:indexval inSection:nil];
    NSLog(@"path:%@",path);
    [self tableView:self.tableView didSelectRowAtIndexPath:path];
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    if ([self screenSize].width<768) {
        NSLog(@"less than 768");
        return [self screenSize].height/4;
    }else if ([self screenSize].width>800){
        NSLog(@"greater than 800");
        return [self screenSize].height/3;
    }
    return [self screenSize].height/4;
     */
    float heightval =0.0f;
    
    if (self.view.bounds.size.height < self.view.bounds.size.width) {
        
        heightval=[self screenSize].height/3;
        return heightval ;
    }else{
        heightval=[self screenSize].height/4;
        return heightval;
    }
    
    return heightval;
    
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




-(void)loadProductDetailsView{
    ProductDetails *pd = [[ProductDetails alloc]init];
    [self presentViewController:pd animated:YES completion:nil];
}

@end
