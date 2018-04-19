//
//  MyAddressVC.m
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 06/01/15.
//  Copyright (c) 2015 Google Inc. All rights reserved.
//

#import "MyAddressVC.h"
//#import "ASIHTTPRequest.h"
//#import "ASIFormDataRequest.h"
//#import"JSON1.h"
#import "AppDelegate.h"
#import "ProductsViewController.h"
#import "MBProgressHUD.h"
#import "MyOrdersVC.h"

#import "CartVC.h"
#import "CategoriesViewController.h"
#import "LoginViewController.h"
#import "MyAccountView.h"
#import "WibmoSDK.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "SearchVC.h"
#import "OrderVC.h"
#import "PaymentConfirmVC.h"
#import "AddressViewCell.h"

#define MerchantName @"Dentistkart"
#define CountryCode @"IN"

#define ENCODE_STRING(kString)      (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)kString, NULL, (CFStringRef)@"_.-!*'\"();:@&=+$,/?%#[]% ",kCFStringEncodingUTF8))

//#define BASE_URL                    @"https://www.pcqa.enstage-sas.com/"    // QA
//#define BASE_URL                  @"https://wallet.pc.enstage-sas.com/"   // Staging

#define BASE_URL       @"https://wallet.pc.enstage-sas.com/v1/wPay/pickup"   //Staging

//#define BASE_URL                  @"https://www.wibmo.com/"               // Production

#define GET_MSG_HASH                    @"sampleMerchant/generatewPayMessageHash.jsp?txnAmount=%@&merAppData=%@&merDyn=false"
//#define GET_MSG_HASH                    @"testMerchant/generatewPayMessageHash.jsp?txnAmount=%@&merAppData=%@&merDyn=false"

@interface MyAddressVC () //<WibmoSDKDelegate>
{
    NSDictionary*paymentInfoDict;
    /*
    NSString*guestname_str;
    NSString*guestemail_str;
    NSString*guestphone_str;
*/
}

@property (nonatomic,retain) NSString *hashkeyString;
@property (nonatomic,retain) NSString *merchant_app_data_str;
@property (nonatomic,retain) NSString *merchant_app_id_str;
@property (nonatomic,retain) NSString *merchant_id_str;
@property (nonatomic,retain) NSString *transaction_amt_str;
@property (nonatomic,retain) NSString *transaction_currency_str;
@property (nonatomic,retain) NSString *transaction_id_str;

@property (nonatomic, retain) NSString *urlString;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;

@property (nonatomic, retain) NSString *messageHash;
@property (nonatomic, retain) NSString *merchantTransactionID;

@property (nonatomic,retain) NSString *guestname_str;
@property (nonatomic,retain) NSString *guestemail_str;
@property (nonatomic,retain) NSString *guestphone_str;

@end

@implementation MyAddressVC
@synthesize myaddress_view,myaddress_bar_lbl,myaddress_lbl,place_order_btn,newaddress_btn,modify_address_btn,address_show_lbl,address_check_view,pincode_txtfeild,street_txtfeild,block_txtfeild,title_lbl_fr_popup,mobile_txtfeild,tyes_btn,comments_textview,ok_btn,tab_view,drop_down_btn_pro,drop_down_view,login_or_signup_btn,profile_btn,logoutimgicon_imgview,profile_dropdw_imgview,usernme_imgicon_imgview,logout_btn,promotions_lbl,products_down_lbl,orders_down_lbl,cart_down_lbl,more_down_lbl,logged_usrname_show_lbl,left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,left_menu_brand_btn,addresstextView;
- (void)viewDidLoad {
    NSLog(@"address didload");
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ///////////////////ScrollProduct ////////////////////////////////
    self.address_scrollview.scrollEnabled=YES;
    self.address_scrollview.userInteractionEnabled=YES;
    self.address_scrollview.pagingEnabled = YES;
    self.address_scrollview.showsHorizontalScrollIndicator = NO;
    self.address_scrollview.showsVerticalScrollIndicator = NO;
    self.address_scrollview.scrollsToTop = NO;
    ////////////////////////////////////////////////////////////////
    
    self.address_scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    //[self.view addSubview:myaddress_view];
    
   // [myaddress_view setBackgroundColor:[UIColor colorWithRed:250/255.0 green:241/250.0 blue:140/250.0 alpha:1]];
    //[myaddress_bar_lbl setBackgroundColor:[UIColor colorWithRed:39/255.0 green:180/255.0 blue:245/255.0 alpha:1]];
    //myaddress_bar_lbl.font = [UIFont fontWithName:@"Santor" size:22.0f];
    //[myaddress_lbl setTextColor:[UIColor colorWithRed:115/255.0 green:8/255.0 blue:6/255.0 alpha:1]];
    //myaddress_lbl.font = [UIFont fontWithName:@"Santor" size:30.0f];
    
   // modify_address_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:15.0f];
    //newaddress_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:15.0f];
    //place_order_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:15.0f];
    
   // [self.view addSubview:self.guestSignupview];
    
    address_check_view.frame=CGRectMake(0,50,self.view.frame.size.width, self.view.frame.size.height-50);
    [self.view addSubview:address_check_view];
    address_check_view.alpha=0.0;
    
   // self.confirmorderview.frame = CGRectMake(0,50,self.view.frame.size.width, self.view.frame.size.height-50);
     self.confirmorderview.frame = CGRectMake(0,50,[self screenSize].width, [self screenSize].height-50);
   // [self.confirmorderview addSubview:leftmenulist_view];
    [self.view addSubview:self.confirmorderview];
    
    //ok_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:15.0f];
   // typespicker.frame = CGRectMake(0, 480, 320, 260);
    //typespicker.hidden = TRUE;
    //[self.view addSubview:typespicker];

    
    //tab_view.frame=CGRectMake(0,518, 320, 50);
    //[self.view addSubview:tab_view];
    
   // drop_down_view.frame = CGRectMake(150, 50, 200, 100);
    //[self.view addSubview:drop_down_view];
    
    ///////////////////////Side Menu///////////////////////
   // leftmenulist_view.frame = CGRectMake(0, 0, 200, 600);
    
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
        
      // self.cartitemscount_btn.hidden=YES;

    }else{
        
        //self.cartitemscount_btn.hidden=NO;
        //self.cartitemscount_btn.layer.cornerRadius=8.0f;
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
    self.checkout_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.newaddress_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.myaddress_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    
    self.pleaseselect_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/40];
    
    
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

    
    //left_menu_profile_name.text = logged_username;
    //left_menu_profile_email_lbl.text = global_email_store;
    //////////////////////////////////////////////////////////
    
    /*
    title_lbl_fr_popup.font = [UIFont fontWithName:@"Santor" size:15.0f];
    types_list_arr =[[NSMutableArray alloc]initWithObjects:@"HOUSE",@"HDB",@"CONDOMINIUM",@"OFFICEBUILDING",@"OTHERS", nil];
    
    logged_usrname_show_lbl.text = [[NSString alloc]initWithFormat:@"Hi %@!",logged_username];
    logged_usrname_show_lbl.font =[UIFont fontWithName:@"Santor" size:14.0f];
    
    
    login_or_signup_btn.titleLabel.font =[UIFont fontWithName:@"Santor" size:15.0f];
    
    profile_btn.titleLabel.font=[UIFont fontWithName:@"Santor" size:15.0f];
       drop_down_view.hidden=YES;
    
    promotions_lbl.font =[UIFont fontWithName:@"Santor" size:11.0f];
    products_down_lbl.font =[UIFont fontWithName:@"Santor" size:11.0f];
    orders_down_lbl.font =[UIFont fontWithName:@"Santor" size:11.0f];
    cart_down_lbl.font =[UIFont fontWithName:@"Santor" size:11.0f];
    more_down_lbl.font =[UIFont fontWithName:@"Santor" size:11.0f];
    ok_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:18.0f];
    [login_or_signup_btn setTitle:logged_username forState:UIControlStateNormal];
    login_or_signup_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:20.0f];
    usernme_imgicon_imgview.image = [UIImage imageNamed:@"user.png"];
    profile_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:20.0f];
    logout_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:20.0f];
    address_show_lbl.font = [UIFont fontWithName:@"Santor" size:20.0f];
    
    */
    
    if (cartcountvalue==0) {
        NSLog(@"cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=YES;
        //[self performSelector:@selector(getCartCountValue) withObject:nil afterDelay:0.1];
    }else{
        NSLog(@" else cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=NO;
        NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
        NSLog(@"else cartcountvalu check: out");
    }
    
     NSLog(@"self.postalcode_txtfld");
    [self.postalcode_txtfld addTarget:self
                    action:@selector(textfeildChanged:)
          forControlEvents:UIControlEventEditingChanged];
NSLog(@"self.postalcode_txtfld overed");
    
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    
    
    
  
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";
    NSLog(@"customer_type_str type :%@",customer_type_str);
    if ([customer_type_str isEqualToString:@"Guest"]) {
         NSLog(@"customer_type_str type if :%@",customer_type_str);
        [self show_popup_guestsignup];
        self.guestSignupview.frame = CGRectMake(0,50,self.view.frame.size.width, self.view.frame.size.height-50);
        
    }else if ([customer_type_str isEqualToString:@"Customer"]){
         NSLog(@"customer_type_str type else :%@",customer_type_str);
        //[self show_popup_address];
        [self performSelector:@selector(setCustomerTypeService) withObject:nil afterDelay:0.1];
    }
    
    self.totalprice_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.qty_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.shipping_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.coupon_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.grandtotal_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.coupon_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.qty_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.confirmyourorder_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];
   // self.grandtotalprice_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    //self.grandtotalprice_btn.layer.borderWidth = 4.0;
    //self.grandtotalprice_btn.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.shipping_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.totalprice_lbl.font=[UIFont systemFontOfSize:[self screenSize].width/30];
    self.grandtotal_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.grandtotal_value_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    
    
   // self.grandtotalprice_lbl.layer.borderWidth = 2.0;
    //self.grandtotalprice_lbl.layer.borderColor = [UIColor blackColor].CGColor;
    
    /*
    CALayer* layer = [self.grandtotal_title_lbl layer];
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.borderColor = [UIColor darkGrayColor].CGColor;
    bottomBorder.borderWidth = 1;
    bottomBorder.frame = CGRectMake(-1, layer.frame.size.height-1, layer.frame.size.width, 1);
    [bottomBorder setBorderColor:[UIColor blackColor].CGColor];
    [layer addSublayer:bottomBorder];
    */
    
    //[self performSelector:@selector(setCustomerTypeService) withObject:nil afterDelay:0.5];
    
    deflt_bill_str=@"False";
    deflt_ship_str=@"False";
//[self setCustomerTypeService];
    
    //self.total_display_view.hidden=YES;
    self.confirmorderview.hidden=YES;
    
   /*
    [self performSelector:@selector(getAddress) withObject:nil afterDelay:0.1];
    checkaddressvalue=0;
    
    */
    
    
   // [self performSelector:@selector(setCustomerTypeService) withObject:nil afterDelay:0.1];
     NSLog(@"idkjjdjjd");
    
    self.postalcode_txtfld.keyboardType = UIKeyboardTypePhonePad;
    self.telephone_txtfld.keyboardType = UIKeyboardTypePhonePad;
     NSLog(@"huedajsdjsdnkasd");
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



- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"rotated enter");
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    
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
            
            
            NSString* viewheight_str = [[NSString alloc]initWithFormat:@"%f",[self screenSize].width-50];
            NSLog(@"viewheight_str:%@",viewheight_str);
            NSDictionary *views = @{@"address_innerview":self.address_innerview};
            NSDictionary *metrics = @{@"height" : viewheight_str};
            [self.address_scrollview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[address_innerview(height)]|" options:kNilOptions metrics:metrics views:views]];
            
            [self.myaddrstableview reloadData];
        }else{
            [self.myaddrstableview reloadData];
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







-(void)getlistAddressService{
   
    NSString *str_getlistAddressService;
    
        str_getlistAddressService = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/customer/address/list/?customer_id=%@",logged_user_id];
    
    NSLog(@"str_getlistAddressService:%@",str_getlistAddressService);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_getlistAddressService]];
    str_getlistAddressService=nil;
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
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }else {
       // NSDictionary*address_result_dict;
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        NSLog(@"enter else");
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
            NSLog(@"enter success block getlistAddressService");
           
            
            int countRow=0;
            NSLog(@"hello1");
            
            NSArray*arry_list = [[NSArray alloc]init];
            NSLog(@"createResult:%@",[dict objectForKey:@"createResult"]);
            NSDictionary*dictchange =[dict objectForKey:@"createResult"];
            NSLog(@"dictchange:%@",dictchange);
           // NSString*str_createResult =[[NSString alloc]initWithFormat:@"%@",[dict objectForKey:@"createResult"]];
            NSArray*createresultarr = [dict objectForKey:@"createResult"];
            NSLog(@"createresultarr:%@",createresultarr);
            //if ([str_createResult isEqualToString:@"()"]) {
            if (createresultarr.count==0) {
                NSLog(@"hello4");
                [self clickCheckBoxBill:0];
                [self clickCheckBoxShip:0];
                [self show_popup_address];
                
            }else{
                NSLog(@"hello5");
                NSLog(@"dict else:%@",[dict objectForKey:@"createResult"]);
                //[arry_list addObject:[dict objectForKey:@"createResult"]];
                arry_list = [dict objectForKey:@"createResult"];
                NSLog(@"arry_list:%@",arry_list);
                myaddress_lbl.text =[[NSString alloc]initWithFormat:@"%lu SAVED ADDRESS",(unsigned long)[arry_list count]];

            }
                        NSLog(@"hello2");
            
            int i=0;
            address_id_arr = [[NSMutableArray alloc]init];
            firstname_arr = [[NSMutableArray alloc]init];
            lastname_arr = [[NSMutableArray alloc]init];
            street_arr = [[NSMutableArray alloc]init];
            street_two_arr = [[NSMutableArray alloc]init];
            city_arr = [[NSMutableArray alloc]init];
            postalcode_arr = [[NSMutableArray alloc]init];
            telephone_arr = [[NSMutableArray alloc]init];
            countrycode_arr = [[NSMutableArray alloc]init];
            
            NSLog(@"hello3");
           // for (int i=0; i<arry_list.count; i++) {
            
            for (NSDictionary*address_result_dict in dictchange ) {
                
            
            NSLog(@"hello6");
                
                if (arry_list.count==0) {
            NSLog(@"hello7");
                }else{
                    NSLog(@"hello8");
                   // NSLog(@"array_list:%@",[arry_list objectAtIndex:i]);
            //address_result_dict = [arry_list objectAtIndex:i];
                    NSLog(@"address_result_dict:%@",address_result_dict);
                    NSLog(@"arrydu:%@",[address_result_dict objectForKey:@"customer_address_id"]);
            NSString  *addrid_string=[address_result_dict objectForKey:@"customer_address_id"];
            NSLog(@"addrid_string mani:%@",addrid_string);
            address_id_store = [[NSString alloc]initWithFormat:@"%@",addrid_string];
                    [address_id_arr addObject:address_id_store];
            
            NSString  *firstname_str=[address_result_dict objectForKey:@"firstname"];
            //[tyes_btn setTitle:type_string forState:UIControlStateNormal];
            NSLog(@"firstname_str:%@",firstname_str);
            //type_store_str = [NSString stringWithString:type_string];
                    [firstname_arr addObject:firstname_str];
            
                    
            NSString  *lastname_str=[address_result_dict objectForKey:@"lastname"];
            NSLog(@"lastname_str:%@",lastname_str);
                    [lastname_arr addObject:lastname_str];
            
                    NSString  *street_str=[address_result_dict objectForKey:@"street"];
                    //NSArray*arryaddrss = [[NSArray alloc]init];
                   // if ([street_str containsString:@"*"]) {
                        NSLog(@"component:%@",[street_str componentsSeparatedByString:@"*"]);
                        
                    NSArray*arryaddrss = [street_str componentsSeparatedByString:@"*"];
                        NSLog(@"arryaddrss:%@",arryaddrss);
                        NSLog(@"[arryaddrss objectAtIndex:0]:%@",[arryaddrss objectAtIndex:0]);
                        NSLog(@"[arryaddrss objectAtIndex:1]:%@",[arryaddrss objectAtIndex:1]);
                        NSString*street_one_str = [arryaddrss objectAtIndex:0];
                        NSString*street_two_str = [arryaddrss objectAtIndex:1];
                        [street_arr addObject:street_one_str];
                        [street_two_arr addObject:street_two_str];
/*
                    }else{
                    [street_arr addObject:[address_result_dict objectForKey:@"street"]];
                    }
  */                  
                    //street_arr=nil;
                    //street_two_arr=nil;
                    
                    
            NSLog(@"street_str mani:%@",street_str);
                    
                    
            street_store_str = [NSString stringWithString:street_str];
            
            NSString  *city_str=[address_result_dict objectForKey:@"city"];
            NSLog(@"city_str:%@",city_str);
                    [city_arr addObject:city_str];
            //block_store_str = [NSString stringWithString:block_str];
           
            NSString  *postcode_str=[address_result_dict objectForKey:@"postcode"];
            NSLog(@"postcode_str:%@",postcode_str);
                    [postalcode_arr addObject:postcode_str];
            postal_store_str = [NSString stringWithString:postcode_str];
            
                    NSString*country_str = [address_result_dict objectForKey:@"country_id"];
                    [countrycode_arr addObject:country_str];
            NSString  *telephone_str=[address_result_dict objectForKey:@"telephone"];
            NSLog(@"telephone_str:%@",telephone_str);
                    NSLog(@"telephone_str vlaue before:%@",telephone_str);
                    //telephone_str = [telephone_str stringByReplacingOccurrencesOfString:@"+91" withString:@""];
                    if (telephone_str.length>10) {
                        NSLog(@"telephone_str length:%lu",(unsigned long)telephone_str.length);
                    
                    if ([[telephone_str substringWithRange:NSMakeRange(0, telephone_str.length-10)] isEqualToString:@"+91"]) {
                        
                    
                    telephone_str = [telephone_str substringWithRange:NSMakeRange(2, telephone_str.length-2)];
                        [telephone_arr addObject:telephone_str];
                    
                    NSLog(@"telephone_str after:%@",telephone_str);
                    }else{
                    [telephone_arr addObject:telephone_str];
                    }
                    }else{
                    [telephone_arr addObject:telephone_str];
                    }
                    
                    /*
                    BOOL is_default_billing_bool = [address_result_dict objectForKey:@"is_default_billing"];
                    BOOL is_default_shipping_bool = [address_result_dict objectForKey:@"is_default_shipping"];
                    NSLog(@"is_default_billing:%@",[address_result_dict objectForKey:@"is_default_billing"]);
                    NSLog(@"is_default_shipping:%@",[address_result_dict objectForKey:@"is_default_shipping"]);
                    NSLog(@"bool bill:%d",is_default_billing_bool);
                    NSLog(@"bool bill:%d",is_default_shipping_bool);
                    */
                   
                    
                    
                   // UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(20,20 + (self.myaddress_view.frame.size.height * countRow),[self screenSize].width-40, [self screenSize].width/2)];
                    
                    
                    /*
                    
                    UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(10,20+([self screenSize].height/4)* countRow, [self screenSize].width-20,[self screenSize].height/4-10)];

                    [viewarrive setTag:i];
                    if ([pageIdentify_str isEqualToString:@"CartVC"]) {
                        
                    
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedAddressViewTapped:)];
                    [viewarrive addGestureRecognizer:tap];

                    }
                    
                    */
                    
                    NSLog(@"is_default_billing:%@",[address_result_dict objectForKey:@"is_default_billing"]);
                    NSLog(@"is_default_shipping:%@",[address_result_dict objectForKey:@"is_default_shipping"]);

                    NSString *isBilling_str =[[NSString alloc]initWithFormat:@"%@",[address_result_dict objectForKey:@"is_default_billing"]];
                    
                    NSString *isBilling_shipping_str = [[NSString alloc]initWithFormat:@"%@",[address_result_dict objectForKey:@"is_default_shipping"]];
                    
                    NSLog(@"isBilling_str:%@",isBilling_str);
                    NSLog(@"is_default_shipping:%@",isBilling_shipping_str);

                    if([isBilling_str isEqualToString:@"1"]&&[isBilling_shipping_str isEqualToString:@"1"]){
                        
                        default_bill_str=@"true";
                        defaultshippaddr_temp=@"1";
                        defaultbilladdr_temp=@"1";
                        selectedAddrIndex=i;
                        //[self selectedAddressViewTapped:nil];
                    }else{
                    
                        if ([isBilling_str isEqualToString:@"1"]) {
                            default_bill_str=@"true";
                            
                            defaultbilladdr_temp=@"1";
                            
                            NSLog(@"deafult address select");
                            // [self setSelectedDeliveryAddressService];
                            //[self setSelectedAddress:i];
                            selectedAddrIndex=i;
                           // [self selectedAddressViewTapped:nil];
                            
                            //[self defaultAddressViewShow];
                        }else if ([isBilling_shipping_str isEqualToString:@"1"]){
                            default_bill_str=@"true";
                            defaultshippaddr_temp=@"1";
                            selectedAddrIndex=i;
                            //[self selectedAddressViewTapped:nil];

                            
                        }
                    
                    }
                    
                    
                    
                /*
                UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(20,20 + (self.myaddress_view.frame.size.height * countRow),[self screenSize].width-40, [self screenSize].width/2)];
                    
                    [viewarrive setTag:i];
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedAddressViewTapped:)];
                    [viewarrive addGestureRecognizer:tap];
                 */
                    
                   // NSLog(@"width of viewarrive:%f",self.myaddress_view.frame.size.width-20);
                    
                    /*
                [viewarrive setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:1.0f]];
                
                
                //UILabel *lblTempname = [[UILabel alloc] initWithFrame:CGRectMake(8,5,80,20)];
                UILabel *lblTempname = [[UILabel alloc] init];
                lblTempname.text = [NSString stringWithFormat: @"%@\t%@",[address_result_dict objectForKey:@"firstname"],[address_result_dict objectForKey:@"lastname"]];
                lblTempname.adjustsFontSizeToFitWidth = YES;
                lblTempname.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
                
                    lblTempname.translatesAutoresizingMaskIntoConstraints=NO;
                
                //UILabel *lblTempaddress = [[UILabel alloc] initWithFrame:CGRectMake(8,10,100,100)];
                    
                    
                    UITextView *lblTempaddress = [[UITextView alloc]init];
                    
                    NSString*addr_str = [address_result_dict objectForKey:@"street"];
                   // NSArray*arryaddr;
                    //NSArray*arryaddr = [[NSArray alloc]init];
                   // if ([addr_str containsString:@"*"]) {
                        NSLog(@"component:%@",[addr_str componentsSeparatedByString:@"*"]);
                        
                        NSArray*arryaddr = [addr_str componentsSeparatedByString:@"*"];
                        lblTempaddress.text =[NSString stringWithFormat: @"%@,\n%@,\nIndia-%@",[arryaddr objectAtIndex:0],
                                              [address_result_dict objectForKey:@"city"],[address_result_dict objectForKey:@"postcode"]];
                   // lblTempaddress.text =[NSString stringWithFormat: @"%@\n%@\n-%@",[arryaddr objectAtIndex:0],
                                        //  [address_result_dict objectForKey:@"city"],[address_result_dict objectForKey:@"postcode"]];
                    lblTempaddress.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/30];
                    lblTempaddress.editable=NO;
                    lblTempaddress.scrollEnabled=NO;
                    lblTempaddress.translatesAutoresizingMaskIntoConstraints=NO;
                    arryaddr=nil;
                    
               // UILabel *lblTempphone = [[UILabel alloc] initWithFrame:CGRectMake(8,150,100, 20)];
                    UILabel *lblTempphone = [[UILabel alloc] init];
                lblTempphone.text = [NSString stringWithFormat: @"Telephone:%@",telephone_str];
                lblTempphone.adjustsFontSizeToFitWidth = YES;
                lblTempphone.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
                    lblTempphone.translatesAutoresizingMaskIntoConstraints=NO;
                
                
                UIButton *btnTempEdit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                //[btnTempDelete addTarget:self action:@selector(sampleDelete:) forControlEvents:UIControlEventTouchUpInside];
               // btnTempEdit.frame = CGRectMake(200,190 ,40, 21);
                btnTempEdit.titleLabel.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/30];
                [btnTempEdit setTitle:@"Edit |" forState:UIControlStateNormal];
                btnTempEdit.tag = i;
                [btnTempEdit addTarget:self action:@selector(editAddressList:) forControlEvents:UIControlEventTouchUpInside];
                    btnTempEdit.translatesAutoresizingMaskIntoConstraints=NO;
                
                UIButton *btnTempRemove = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                //[btnTempDelete addTarget:self action:@selector(sampleDelete:) forControlEvents:UIControlEventTouchUpInside];
               // btnTempRemove.frame = CGRectMake(250,190 ,40, 21);
                btnTempRemove.titleLabel.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/30];
                [btnTempRemove setTitle:@" Remove" forState:UIControlStateNormal];
                btnTempRemove.tag = [[address_result_dict objectForKey:@"customer_address_id"] intValue];
                [btnTempRemove addTarget:self action:@selector(removeAddressId:) forControlEvents:UIControlEventTouchUpInside];
                    btnTempRemove.translatesAutoresizingMaskIntoConstraints=NO;
                
                    [viewarrive addSubview:lblTempname];
                    [viewarrive addSubview:lblTempaddress];
                    [viewarrive addSubview:lblTempphone];
                    [viewarrive addSubview:lblTempphone];
                    [viewarrive addSubview:btnTempEdit];
                    [viewarrive addSubview:btnTempRemove];
                    
                    
                    NSDictionary*newviews =@{@"lblTempname":lblTempname,@"lblTempaddress":lblTempaddress,@"lblTempphone":lblTempphone,@"btnTempEdit":btnTempEdit,@"btnTempRemove":btnTempRemove};
                    
                    NSString*lblnamewidth =[[NSString alloc]initWithFormat:@"%f",viewarrive.frame.size.width-10];
                    NSString*lblnameheight = [[NSString alloc]initWithFormat:@"%f",viewarrive.frame.size.height/4];
                    
                    NSDictionary*lblnamemetrics = @{@"width":lblnamewidth,@"height":lblnameheight};
                    
                    
                    if ([self screenSize].width<500) {
                        NSArray*lblnamewdthconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[lblTempname(width)]" options:0 metrics:lblnamemetrics views:newviews];
                        NSArray*lblTempaddresswdthconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[lblTempaddress(width)]" options:0 metrics:lblnamemetrics views:newviews];
                        NSArray*lblTempphonewdthconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[lblTempphone]-5-[btnTempEdit]-1-[btnTempRemove]-5-|" options:0 metrics:lblnamemetrics views:newviews];
                        // NSArray*lblnamewdthconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblTempname(width)]" options:0 metrics:lblnamemetrics views:newviews];
                        NSArray*btnTempEditheghtconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblTempaddress]-5-[btnTempEdit]-1-|" options:0 metrics:lblnamemetrics views:newviews];
                        NSArray*btnTempRemoveheghtconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblTempaddress]-5-[btnTempRemove]-5-|" options:0 metrics:lblnamemetrics views:newviews];
                        
                        NSArray*allheghtconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[lblTempname(20)]-5-[lblTempaddress(55)]" options:0 metrics:lblnamemetrics views:newviews];
                        [viewarrive addConstraints:lblnamewdthconstraints];
                        [viewarrive addConstraints:lblTempaddresswdthconstraints];
                        [viewarrive addConstraints:lblTempphonewdthconstraints];
                        [viewarrive addConstraints:allheghtconstraints];
                        [viewarrive addConstraints:btnTempEditheghtconstraints];
                        [viewarrive addConstraints:btnTempRemoveheghtconstraints];
                        lblnamewdthconstraints=nil;
                        lblTempaddresswdthconstraints=nil;
                        lblTempphonewdthconstraints=nil;
                        btnTempEditheghtconstraints=nil;
                        btnTempRemoveheghtconstraints=nil;
                        allheghtconstraints=nil;
                    }else{
                    NSArray*lblnamewdthconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblTempname(width)]" options:0 metrics:lblnamemetrics views:newviews];
                    NSArray*lblTempaddresswdthconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblTempaddress(width)]" options:0 metrics:lblnamemetrics views:newviews];
                    NSArray*lblTempphonewdthconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblTempphone]-10-[btnTempEdit]-1-[btnTempRemove]-10-|" options:0 metrics:lblnamemetrics views:newviews];
                   // NSArray*lblnamewdthconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblTempname(width)]" options:0 metrics:lblnamemetrics views:newviews];
                    NSArray*btnTempEditheghtconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblTempaddress]-10-[btnTempEdit]-10-|" options:0 metrics:lblnamemetrics views:newviews];
                    NSArray*btnTempRemoveheghtconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lblTempaddress]-10-[btnTempRemove]-10-|" options:0 metrics:lblnamemetrics views:newviews];

                    NSArray*allheghtconstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblTempname(height)]-10-[lblTempaddress]" options:0 metrics:lblnamemetrics views:newviews];
                        [viewarrive addConstraints:lblnamewdthconstraints];
                        [viewarrive addConstraints:lblTempaddresswdthconstraints];
                        [viewarrive addConstraints:lblTempphonewdthconstraints];
                        [viewarrive addConstraints:allheghtconstraints];
                        [viewarrive addConstraints:btnTempEditheghtconstraints];
                        [viewarrive addConstraints:btnTempRemoveheghtconstraints];
                        lblnamewdthconstraints=nil;
                        lblTempaddresswdthconstraints=nil;
                        lblTempphonewdthconstraints=nil;
                        btnTempEditheghtconstraints=nil;
                        btnTempRemoveheghtconstraints=nil;
                        allheghtconstraints=nil;

                        
                    }
                    
                    
                    NSLayoutConstraint*lbltelephonebottom = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:lblTempphone attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
                    
                    NSLayoutConstraint*btnTempeditbottom = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:btnTempEdit attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];

                     NSLayoutConstraint *btnTempremovetraiingconstraints = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:btnTempRemove attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
                    NSLayoutConstraint *btnTempedittraiingconstraints = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:btnTempRemove attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];

                  //  NSLayoutConstraint *btnTempeditrightconstraints = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:btnTempEdit attribute:NSLayoutAttributeLeft multiplier:1.0 constant:1];
                   // NSLayoutConstraint *btnTempeditleftconstraints = [NSLayoutConstraint constraintWithItem:lblTempphone attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:btnTempEdit attribute:NSLayoutAttributeLeft multiplier:1.0 constant:1];

                    NSLayoutConstraint *btnTempremovebottomconstraints = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:btnTempRemove attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
                    
                    
                    [viewarrive addConstraints:@[btnTempremovetraiingconstraints,btnTempremovebottomconstraints,lbltelephonebottom,btnTempeditbottom,btnTempedittraiingconstraints]];
                    
                    
                    
                   // [viewarrive addConstraints:@[lblnamewdthconstraints,lblTempaddresswdthconstraints,lblTempphonewdthconstraints]];
                    //[viewarrive addConstraints:@[allheghtconstraints,btnTempEditheghtconstraints,btnTempEditheghtconstraints]];
                    
                    
                    
               // [self.myaddress_view addSubview:viewarrive];
                    [self.address_list_scrollview addSubview:viewarrive];
                     */
               // countRow++;
                    i++;
                    
                    /*
                    viewarrive=nil;
                    newviews=nil;
                    lblnamewidth=nil;
                    lblnameheight=nil;
                    lblnamemetrics=nil;
                    lblTempname=nil;
                    lblTempaddress=nil;
                    lblTempphone=nil;
                    btnTempEdit=nil;
                    btnTempRemove=nil;
                     */
                }
                dict=nil;
                dictchange=nil;
                
            }
           // [self.address_list_scrollview setContentSize:CGSizeMake([self screenSize].width,(([self screenSize].height/4)*countRow)+10)];
            [self.myaddrstableview reloadData];
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"end of loop");
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }
}

- (void)selectedAddressTxtViewTapped:(UITapGestureRecognizer *)gr {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";

    UIView *theViewThatGotTapped = (UIView *)gr.view;
    
    if (gr==nil) {
        
        NSLog(@"selectedAddressViewTapped gr:%@",gr);
    }else{
        selectedAddrIndex = (int)theViewThatGotTapped.tag;
        NSLog(@"selectedAddressViewTapped gr:%@",gr);
                self.total_display_view.hidden=YES;
        
    }
    
    NSLog(@"enter in selected address tapped");
    
    
    delivery_address_id_str = [address_id_arr objectAtIndex:selectedAddrIndex];
    //[self.deliveryaddressView removeFromSuperview];
    int resultval = [self setSelectedDeliveryAddressService];
    NSLog(@"result value:%d",resultval);
    if(resultval==1){
       // [self updatedCartInfo];
        [self setSelectedAddress:selectedAddrIndex];
        [self performSelector:@selector(updatedCartInfo) withObject:nil afterDelay:0.5];
        
    }
}




- (void)selectedAddressViewTapped:(int)indexvalu {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";
    
    
        selectedAddrIndex = indexvalu;
        NSLog(@"selectedAddressViewTapped gr:%d",indexvalu);
        self.total_display_view.hidden=YES;
        
    
    
    NSLog(@"enter in selected address tapped");
    
    
    delivery_address_id_str = [address_id_arr objectAtIndex:selectedAddrIndex];
    //[self.deliveryaddressView removeFromSuperview];
    int resultval = [self setSelectedDeliveryAddressService];
    NSLog(@"result value:%d",resultval);
    if(resultval==1){
        // [self updatedCartInfo];
        [self setSelectedAddress:selectedAddrIndex];
        [self performSelector:@selector(updatedCartInfo) withObject:nil afterDelay:0.5];
        
    }
}



-(void)updatedCartInfo{
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
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        
        
        NSLog(@"enter else");
        
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
        
            NSMutableArray*grandtotaljson_arr =[dict objectForKey:@"cartTotal"];
            NSLog(@"Array Amount:%@",grandtotaljson_arr);
            NSDictionary*dicttotal = [grandtotaljson_arr objectAtIndex:0];
            NSLog(@"dicttotal:%@",dicttotal);
            
            self.totalprice_lbl.text = [[NSString alloc]initWithFormat:@"%@",[dicttotal objectForKey:@"amount"]];
            
          
            //self.totalprice_lbl.font = [UIFont fontWithName:@"Santor" size:[self screenSize].width/30];

            if (grandtotaljson_arr.count==3) {
                NSDictionary*dictshipping = [grandtotaljson_arr objectAtIndex:1];
                NSDictionary*dictgradprice = [grandtotaljson_arr objectAtIndex:2];
                
                
                self.shipping_lbl.text = [[NSString alloc]initWithFormat:@"%@",[dictshipping objectForKey:@"amount"]];
                NSLog(@"shipping_lbl:%@",self.shipping_lbl.text);
                
                self.grandtotal_value_lbl.text = [[NSString alloc]initWithFormat:@"%@",[dictgradprice objectForKey:@"amount"]];
                
                
                self.paynow_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/35 weight:1.0];
            }else if (grandtotaljson_arr.count==2){
                NSLog(@"grandtotaljson_arr.count:%lu",(unsigned long)grandtotaljson_arr.count);
             NSDictionary*dictgradprice = [grandtotaljson_arr objectAtIndex:1];
                NSLog(@"dictgradprice:%@",dictgradprice);
               // self.grandtotal_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];
                self.shipping_lbl.text = @"0.00";
                self.grandtotal_value_lbl.text = [[NSString alloc]initWithFormat:@"%@",[dictgradprice objectForKey:@"amount"]];
               // self.paynow_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/30 weight:1.0];
                self.paynow_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/15];
                
            }
            self.confirmorderview.hidden=NO;
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }else if (status==2||[message isEqualToString:@"Error in Authentication."]){
            NSLog(@"enter in cart address empty");
            self.checkout_lbl.text = @"Address";
            
            
        }
    }
    

}




-(void)setSelectedAddress:(int)index{
    NSLog(@"setSelectedAddress:");
    
    self.totalcount_lbl.text = [NSString stringWithFormat:@"%@",global_cart_total];
    self.totalcount_lbl.adjustsFontSizeToFitWidth=YES;
    
    self.price_display_lbl.text = [NSString stringWithFormat:@"%@",global_grandprice_str];
    self.price_display_lbl.adjustsFontSizeToFitWidth=YES;
    
    
    delivery_address_id_str = [NSString stringWithFormat:@"%@",[address_id_arr objectAtIndex:index]];
    //self.address_lbl.text = [NSString stringWithFormat: @"%@%@-%@",[street_arr objectAtIndex:index],[city_arr objectAtIndex:index],[postalcode_arr objectAtIndex:index]];
    
    self.addresstextView.text = [NSString stringWithFormat: @"%@%@-%@",[street_arr objectAtIndex:index],[city_arr objectAtIndex:index],[postalcode_arr objectAtIndex:index]];
    self.addresstextView.font = [UIFont fontWithName:@"Santor" size:[self screenSize].width/20];
    
    [self.address_lbl sizeToFit];
    
    NSMutableString*strname = [NSMutableString stringWithFormat: @"%@",[firstname_arr objectAtIndex:index]];
  
    NSLog(@"str_name:%@",strname);
   // self.username_delivery_lbl.text = [NSString stringWithString:strname];
    
    
    self.username_delivery_lbl.text = [[strname stringByAppendingString:@" "] stringByAppendingFormat:@"%@",[lastname_arr objectAtIndex:index]];
  
    NSLog(@"self.username_delivery_lbl.text:%@",self.username_delivery_lbl.text);
    //self.username_delivery_lbl.text = [NSString stringWithFormat: @"%@ %@",[firstname_arr objectAtIndex:index],[lastname_arr objectAtIndex:index]];
    self.username_delivery_lbl.adjustsFontSizeToFitWidth = YES;
    self.username_delivery_lbl.font = [UIFont fontWithName:@"Santor" size:[self screenSize].width/20];
    
    NSLog(@"usernam_delivery_lbl:%@",self.username_delivery_lbl.text);
    firstlastname = [NSString stringWithString:self.username_delivery_lbl.text];
    NSLog(@"firstlastname:%@",firstlastname);
    self.usr_delvry_ph_lbl.text = [NSString stringWithFormat: @"%@",[telephone_arr objectAtIndex:index]];
    self.usr_delvry_ph_lbl.adjustsFontSizeToFitWidth = YES;
    self.usr_delvry_ph_lbl.font = [UIFont fontWithName:@"Santor" size:[self screenSize].width/20];
    paytelephonenum = [telephone_arr objectAtIndex:index];
    
    /*
    NSLog(@"firstname:%@",firstname_arr);
    NSLog(@"lastname:%@",lastname_arr);
    NSLog(@"usernaem_delivery:%@",self.username_delivery_lbl.text);
    firstlastname = [NSString stringWithFormat: @"%@",self.username_delivery_lbl.text];
    
    NSLog(@"firstlastname:%@",firstname_arr);
    */
    
    
    //[self defaultAddressViewShow];

}


-(void)defaultAddressViewShow{

    NSLog(@"enter in defaultAddressViewShow");
    NSLog(@"self.delivery_addr_disview:%@",self.delivery_addr_disview);
    if(self.view.window!=nil){
        
          self.deliveryaddressView.hidden=NO;
    }else{
        
        CGRect framedel  = CGRectMake(0,50, self.view.frame.size.width, self.view.frame.size.height-50);
        self.deliveryaddressView.frame = framedel;
        
        [self.view addSubview:self.deliveryaddressView];
        /*
        CGRect frame = self.deliveryaddressView.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:.5];
        frame.origin.y = 0;
        self.deliveryaddressView.frame = frame;
        [UIView commitAnimations];
        */
        /*
      leftmenulist_view.frame = CGRectMake(0, 0, ([self screenSize].width/2)+[self screenSize].width/3, [self screenSize].height-50);
        [self.deliveryaddressView addSubview:leftmenulist_view];
        */
    }
}



-(int)setSelectedDeliveryAddressService{
    int resultno;
    NSString*delivery_addree_usl_str;
    if ([customer_type_str isEqualToString:@"Guest"]) {
        delivery_addree_usl_str = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/checkout/address/?customermode=Guest&shoppingCartId=%@&fname=%@&lname=%@&street=%@&company=company&city=%@&countryid=%@&reagion=%@&postalcode=%@&telephone=%@&fax=fax",cartid_check,self.firstname_txtfld.text,self.lastname_txtfld.text,self.streetone_txtfld.text,self.city_txtfld.text,@"in",@"hyderabad",self.postalcode_txtfld.text,self.telephone_txtfld.text];
       // guestphone_str = [NSString stringWithString:self.telephone_txtfld.text];
        [self setGuestphone_str:self.telephone_txtfld.text];
        NSLog(@"guestphone_str:%@",self.guestphone_str);
        delivery_addree_usl_str = [delivery_addree_usl_str stringByReplacingOccurrencesOfString:@" " withString:@""];
        delivery_addree_usl_str = [delivery_addree_usl_str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSMutableString *result = [NSMutableString stringWithString:delivery_addree_usl_str];
        
        // Replace spaces with underscores
        [result replaceOccurrencesOfString:@" "
                                withString:@"_"
                                   options:0
                                     range:NSMakeRange(0, [result length])];
        
        // Delete http token separators and remaining whitespace
        static NSCharacterSet *charsToDelete = nil;
        if (charsToDelete == nil) {
            // Make a set of unwanted characters
            NSString *const kSeparators = @"()<>@[]{}";
            
            NSMutableCharacterSet *mutableChars;
            mutableChars = [[[NSCharacterSet whitespaceAndNewlineCharacterSet] mutableCopy] autorelease];
            [mutableChars addCharactersInString:kSeparators];
            charsToDelete = [mutableChars copy]; // hang on to an immutable copy
        }
        
        while (1) {
            NSRange separatorRange = [result rangeOfCharacterFromSet:charsToDelete];
            if (separatorRange.location == NSNotFound) break;
            
            [result deleteCharactersInRange:separatorRange];
        };
        
        NSLog(@"str_addnewAddressService:%@",result);
        
    }else{
    delivery_addree_usl_str = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/checkout/address/?customermode=%@&shoppingCartId=%@&addressId=%@",customer_type_str,cartid_check,delivery_address_id_str];
    }
    
    NSLog(@"delivery_addree_usl_str:%@",delivery_addree_usl_str);
    delivery_addree_usl_str = [delivery_addree_usl_str stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableURLRequest *urlreq = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:delivery_addree_usl_str]];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:urlreq returningResponse:nil error:nil];
    NSString*returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"returnString:%@",returnString);
    NSError *jsonError;
    
    //NSDictionary*dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&jsonError];
    NSDictionary *dictaddr = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    NSLog(@"dict:%@",dictaddr);
    NSLog(@"dictvalu:%@",[dictaddr objectForKey:@"createResult"]);
    if (dictaddr==nil||dictaddr==NULL){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else {
        
        NSString* statuscode = [dictaddr objectForKey:@"statuscode"];
        NSString* message = [dictaddr objectForKey:@"message"];
        
        NSLog(@"setSelectedDeliveryAddressService statuscode:%@",statuscode);
        
        
        NSLog(@"enter else");
        
        NSLog(@" setSelectedDeliveryAddressService check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
            NSString*result = [dictaddr objectForKey:@"createResult"];
            
            if([result isEqualToString:@"true"]){
                
                resultno=1;
                return resultno;
            }
        }
    }
    return resultno;
}
-(void)setCustomerTypeService{

    
    NSString *str_setCustomerTypeService;
    if ([customer_type_str isEqualToString:@"Customer"]) {
        NSLog(@"setCustomerTypeService called");
        str_setCustomerTypeService = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/checkout/customer/?shoppingCartId=%@&customermode=%@&customer_id=%@",cartid_check,customer_type_str,logged_user_id];
        
    }else if ([customer_type_str isEqualToString:@"Guest"]){
        
        if ([self.firstname_txt.text isEqualToString:@""]||[self.firstname_txt.text isEqualToString:@"(null)"]||self.firstname_txt.text==nil||self.firstname_txt.text==NULL||[self.firstname_txt.text isEqualToString:@""]||[self.firstname_txt.text isEqualToString:@"(null)"]||self.firstname_txt==nil||self.firstname_txt.text==NULL)
        {
            [self alertShow];
            NSLog(@"login username db :%@",self.firstname_txt.text);
            
        }else if ([self.lastname_txt.text isEqualToString:@""]||[self.lastname_txt.text isEqualToString:@"(null)"]||self.lastname_txt.text==nil||self.lastname_txt.text==NULL||[self.lastname_txt.text isEqualToString:@""]||[self.lastname_txt.text isEqualToString:@"(null)"]||self.lastname_txt.text==nil||self.lastname_txt.text==NULL)
        {
            [self alertShow];
            NSLog(@"login email db :%@",self.lastname_txt.text);
            
        }else if ([self.email_txt.text isEqualToString:@""]||[self.email_txt.text isEqualToString:@"(null)"]||self.email_txt.text==nil||self.email_txt.text==NULL||[self.email_txt.text isEqualToString:@""]||[self.email_txt.text isEqualToString:@"(null)"]||self.email_txt.text==nil||self.email_txt.text==NULL)
        {
            [self alertShow];
            NSLog(@"login email db :%@",self.lastname_txt.text);
            
        }else{
        str_setCustomerTypeService = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/checkout/customer/?shoppingCartId=%@&customermode=%@&fname=%@&lname=%@&email=%@",cartid_check,customer_type_str,self.firstname_txt.text,self.lastname_txt.text,self.email_txt.text];
           // global_email_store = self.email_txt.text;
           
            
            NSString*tempdata = [self.firstname_txt.text stringByAppendingString:@" "];
             NSLog(@"tempdata str:%@",tempdata);
            
            [self setGuestname_str:[tempdata stringByAppendingString:self.lastname_txt.text]];
           // guestname_str = [NSString stringWithFormat:@"%@",[tempdata stringByAppendingString:self.lastname_txt.text]];
            NSLog(@"guestname_str str:%@",self.guestname_str);
            
            [self setGuestemail_str:self.email_txt.text];
            //guestemail_str = [NSString stringWithString:self.email_txt.text];

        }
    }
    
    NSLog(@"str_setCustomerTypeService:%@",str_setCustomerTypeService);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_setCustomerTypeService]];
    
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
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
            NSLog(@"enter success block");
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            NSString*result = [dict objectForKey:@"createResult"];
            
            if([result isEqualToString:@"true"]){
                if ([customer_type_str isEqualToString:@"Guest"]){
                    self.close_cancel_btn.hidden=YES;
                    self.ok_btn.hidden=YES;
                    self.checkBilling_btn.hidden=YES;
                    self.checkShipping_btn.hidden=YES;
                    self.default_bill_addr_lbl.hidden=YES;
                    self.default_ship_addr_lbl.hidden=YES;
                    
                    UIButton*checkout_btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    //checkout_btn.frame = CGRectMake(0, ([self screenSize].height)-([self screenSize].height/9), [self screenSize].width,[self screenSize].height/10);
                    checkout_btn.frame = CGRectMake(0, self.address_check_view.frame.size.height, [self screenSize].width,self.address_check_view.frame.size.height/10);

                    [checkout_btn setTitle:@"Checkout" forState:UIControlStateNormal];
                    [checkout_btn addTarget:self action:@selector(validateCheck:) forControlEvents:UIControlEventTouchUpInside];
                    [checkout_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [checkout_btn.titleLabel setFont:[UIFont systemFontOfSize:[self screenSize].width/20]];
                    [checkout_btn setBackgroundColor:[UIColor orangeColor]];
                    [self.address_check_view addSubview:checkout_btn];
                    /*
                    global_email_store = self.email_txt.text;
                    NSString*tempdata = [self.firstname_txt.text stringByAppendingString:@" "];
                    self.username_delivery_lbl.text = [tempdata stringByAppendingString:self.lastname_txt.text];
                     */
                    self.guestSignupview.hidden=YES;
                [self show_popup_address];
                }else{
               [self getlistAddressService];
                }
                
            }
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }
}
-(IBAction)validateCheck:(id)sender{
    [self validationfeilds];
}
-(void)addNewaddressService{

    NSString *str_addnewAddressService;
    NSLog(@"self.telephone_txtfld.text:%@",self.telephone_txtfld.text);
    self.telephone_txtfld.text = [self.telephone_txtfld.text stringByReplacingOccurrencesOfString:@"+91" withString:@""];
    NSLog(@"self.telephone_txtfld.text after:%@",self.telephone_txtfld.text);
    str_addnewAddressService = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/customer/address/create/?customer_id=%@&fname=%@&lname=%@&street1=%@&street2=%@&city=%@&countryid=%@&reagion=%@&reagionid=%@&postalcode=%@&telephone=%@&defaultbilling=%@&defaultshipping=%@",logged_user_id,self.firstname_txtfld.text,self.lastname_txtfld.text,self.streetone_txtfld.text,self.streettwo_txtfld.text,self.city_txtfld.text,@"in",@"hyderabad",@"3",self.postalcode_txtfld.text,self.telephone_txtfld.text,deflt_ship_str,deflt_bill_str];
   
    str_addnewAddressService = [str_addnewAddressService stringByReplacingOccurrencesOfString:@" " withString:@""];
    str_addnewAddressService = [str_addnewAddressService stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSMutableString *result = [NSMutableString stringWithString:str_addnewAddressService];
    
    // Replace spaces with underscores
    [result replaceOccurrencesOfString:@" "
                            withString:@"_"
                               options:0
                                 range:NSMakeRange(0, [result length])];
    
    // Delete http token separators and remaining whitespace
    static NSCharacterSet *charsToDelete = nil;
    if (charsToDelete == nil) {
        // Make a set of unwanted characters
        NSString *const kSeparators = @"()<>@[]{}";
        
        NSMutableCharacterSet *mutableChars;
        mutableChars = [[[NSCharacterSet whitespaceAndNewlineCharacterSet] mutableCopy] autorelease];
        [mutableChars addCharactersInString:kSeparators];
        charsToDelete = [mutableChars copy]; // hang on to an immutable copy
    }
    
    while (1) {
        NSRange separatorRange = [result rangeOfCharacterFromSet:charsToDelete];
        if (separatorRange.location == NSNotFound) break;
        
        [result deleteCharactersInRange:separatorRange];
    };

    NSLog(@"str_addnewAddressService:%@",result);
    
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:result]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    returnString = [returnString stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    
    NSError *jsonError;
    NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:kNilOptions
                                                           error:&jsonError];
    NSLog(@"dict:%@",dict);
    
    if (dict==nil||dict==NULL){
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }else {
       // NSDictionary*creat_result_dict;
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        NSLog(@"enter else");
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
            NSLog(@"enter success block");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            //int countRow=0;
           // NSArray*arry_list = [dict objectForKey:@"createResult"];
            NSString*result = [dict objectForKey:@"createResult"];
            result = [result stringByReplacingOccurrencesOfString:@"""" withString:@""];
            NSLog(@"result one:%@",result);
            
            
            [self callSelfController];
            //[self getlistAddressService];
            //[self close_popup_address];
            
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }

}


-(void)orderCreationService{
    
    NSString *str_orderCreationService;
  
        str_orderCreationService = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/orders/create/?shoppingCartId=%@",cartid_check];
  
    
    NSLog(@"str_orderCreationService:%@",str_orderCreationService);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_orderCreationService]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnStringorderCreationService:*%@*",returnString);
    
    NSError *jsonError;
    // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    
    NSLog(@"dictorderCreationService:%@",dict);
    
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
        
        NSLog(@"check1 orderCreationService");
        NSLog(@"statuscode check orderCreationService:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
            NSLog(@"enter success block");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSDictionary*dictcreateresult = [dict objectForKey:@"createResult"];
            
           // [self setHashkeyString:[dictcreateresult objectForKey:@"hash_key"]];
            [self setMessageHash:[dictcreateresult objectForKey:@"hash_key"]];
            [self setMerchant_app_data_str:[dictcreateresult objectForKey:@"merchant_app_data"]];
            [self setMerchant_app_id_str:[dictcreateresult objectForKey:@"merchant_app_id"]];
            [self setMerchant_id_str:[dictcreateresult objectForKey:@"merchant_id"]];
            [self setTransaction_amt_str:[dictcreateresult objectForKey:@"transaction_amt"]];
            [self setTransaction_currency_str:[dictcreateresult objectForKey:@"transaction_currency"]];
            //[self setTransaction_id_str:[dictcreateresult objectForKey:@"transaction_id"]];
            [self setMerchantTransactionID:[dictcreateresult objectForKey:@"transaction_id"]];
            
            
            [self initializePayment];
            
            
           // if([result isEqualToString:@"true"]){
             //   [self getlistAddressService];
            //}
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            
            NSString*errormsg = [[NSString alloc]initWithFormat:@"%@",[dict objectForKey:@"createResult"]];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:errormsg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }

}
-(void)callSelfController{
    MyAddressVC*myaddrvc = [[MyAddressVC alloc]init];
    [self presentViewController:myaddrvc animated:YES completion:nil];
}
-(void)validationfeilds{
    
    if ([self.firstname_txtfld.text isEqualToString:@""]||[self.firstname_txtfld.text isEqualToString:@"(null)"]||self.firstname_txtfld.text==nil||self.firstname_txtfld.text==NULL||[self.firstname_txtfld.text isEqualToString:@""]||[self.firstname_txtfld.text isEqualToString:@"(null)"]||self.firstname_txtfld==nil||self.firstname_txtfld.text==NULL)
    {
        [self alertShow];
        NSLog(@"login username db :%@",self.firstname_txtfld.text);
        
    }else if ([self.lastname_txtfld.text isEqualToString:@""]||[self.lastname_txtfld.text isEqualToString:@"(null)"]||self.lastname_txtfld.text==nil||self.lastname_txtfld.text==NULL||[self.lastname_txtfld.text isEqualToString:@""]||[self.lastname_txtfld.text isEqualToString:@"(null)"]||self.lastname_txtfld.text==nil||self.lastname_txtfld.text==NULL)
    {
        [self alertShow];
        NSLog(@"login email db :%@",self.lastname_txtfld.text);
        
    }else if ([self.streetone_txtfld.text isEqualToString:@""]||[self.streetone_txtfld.text isEqualToString:@"(null)"]||self.streetone_txtfld.text==nil||self.streetone_txtfld.text==NULL||[self.streetone_txtfld.text isEqualToString:@""]||[self.streetone_txtfld.text isEqualToString:@"(null)"]||self.streetone_txtfld.text==nil||self.streetone_txtfld.text==NULL)
    {
        [self alertShow];
        
    }else if ([self.streettwo_txtfld.text isEqualToString:@""]||[self.streettwo_txtfld.text isEqualToString:@"(null)"]||self.streettwo_txtfld.text==nil||self.streettwo_txtfld.text==NULL||[self.streettwo_txtfld.text isEqualToString:@""]||[self.streettwo_txtfld.text isEqualToString:@"(null)"]||self.streettwo_txtfld.text==nil||self.streettwo_txtfld.text==NULL)
    {
    [self alertShow];
    }else if ([self.city_txtfld.text isEqualToString:@""]||[self.city_txtfld.text isEqualToString:@"(null)"]||self.city_txtfld.text==nil||self.city_txtfld.text==NULL||[self.city_txtfld.text isEqualToString:@""]||[self.city_txtfld.text isEqualToString:@"(null)"]||self.city_txtfld.text==nil||self.city_txtfld.text==NULL)
    {
        [self alertShow];
    }else if ([self.country_txtfld.text isEqualToString:@""]||[self.country_txtfld.text isEqualToString:@"(null)"]||self.country_txtfld.text==nil||self.country_txtfld.text==NULL||[self.country_txtfld.text isEqualToString:@""]||[self.country_txtfld.text isEqualToString:@"(null)"]||self.country_txtfld.text==nil||self.country_txtfld.text==NULL)
    {
        [self alertShow];
    }else if ([self.postalcode_txtfld.text isEqualToString:@""]||[self.postalcode_txtfld.text isEqualToString:@"(null)"]||self.postalcode_txtfld.text==nil||self.postalcode_txtfld.text==NULL||[self.postalcode_txtfld.text isEqualToString:@""]||[self.postalcode_txtfld.text isEqualToString:@"(null)"]||self.postalcode_txtfld.text==nil||self.city_txtfld.text==NULL)
    {
        [self alertShow];
    }else if ([self.telephone_txtfld.text isEqualToString:@""]||[self.telephone_txtfld.text isEqualToString:@"(null)"]||self.telephone_txtfld.text==nil||self.telephone_txtfld.text==NULL||[self.telephone_txtfld.text isEqualToString:@""]||[self.telephone_txtfld.text isEqualToString:@"(null)"]||self.telephone_txtfld.text==nil||self.telephone_txtfld.text==NULL)
    {
        [self alertShow];
    }else{
        
        NSLog(@" entred updateItemFromCartPage");
        
        NSLog(@"self.pincode_txtfeild.text value:%@",self.postalcode_txtfld.text);
        NSScanner* scan = [NSScanner scannerWithString:self.postalcode_txtfld.text];
        NSScanner* scantelephone = [NSScanner scannerWithString:self.telephone_txtfld.text];
        
        NSLog(@"scanner:%@",scan);
                NSLog(@"scanner telephone:%@",scantelephone);
        int val,valtelephone;
        NSLog(@"isNumeric we are complted");
        
        BOOL isNumeric = [scan scanInt:&val] && [scan isAtEnd];
        BOOL isNumericTele = [scantelephone scanInt:&valtelephone] && [scantelephone isAtEnd];
        
        if (isNumeric) {
            if (isNumericTele) {
                
            
        //[self getAddressByPostalCode];
            
        NSLog(@"entred in else");
        
        if ([self.country_txtfld.text isEqualToString:@"India"]) {
            
        
        if (self.telephone_txtfld.text.length>=10&& self.postalcode_txtfld.text.length>=4) {
        NSLog(@"entred in if");
        
        
            if ([customer_type_str isEqualToString:@"Guest"]) {
                int resultval = [self setSelectedDeliveryAddressService];
                NSLog(@"result value guest:%d",resultval);
                if(resultval==1){
                    // [self updatedCartInfo];
                    //[self setSelectedAddress:selectedAddrIndex];
                    [self performSelector:@selector(updatedCartInfo) withObject:nil afterDelay:0.2];
                    
                }
                
            }else{
            
        if (updatecheck==1) {
            NSLog(@"entred in update if");
            [self performSelector:@selector(updateAddressService) withObject:nil afterDelay:1.0];
            //[self updateAddressService];
            updatecheck=0;
        }else{
           [self performSelector:@selector(addNewaddressService) withObject:nil afterDelay:1.0];
        //[self addNewaddressService];
        }
            }
            
        }else if(self.telephone_txtfld.text.length<10){
            
            UIAlertView*alertv = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Telephone number shouldnot exceeds 10 digits" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alertv show];
        }else if(self.postalcode_txtfld.text.length<6){
            UIAlertView*alertv = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"PostalCode number shouldnot exceeds 10 digits" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alertv show];
        }
        }else if (![self.country_txtfld.text isEqualToString:@"India"]){
            UIAlertView*alertv = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Product delivery is available only in India,Please kindly enter country has India" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alertv show];

        }
            }else{
                UIAlertView*alertv = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Telephone is incorrect please enter numeric for telephone" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alertv show];
                
            }
    }else{
        UIAlertView*alertv = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Postalcode is incorrect please enter numeric for postalcode" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertv show];
        
    }
    }
}
-(void)getAddressByPostalCode{

    
   // NSString*str_url = [[NSString alloc]initWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%d&sensor=true",[[self.postalcode_txtfld text]intValue]];
    
    NSString*str_url = [[NSString alloc]initWithFormat:@"https://www.whizapi.com/api/v2/util/ui/in/indian-city-by-postal-code?pin=%d&project-app-key=x2e33kzg3c2q7nk64spnidxx",[[self.postalcode_txtfld text]intValue]];

    NSMutableURLRequest*req = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: req returningResponse: nil error: nil ];
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
       /*
        NSString*status_str = [dict objectForKey:@"status"];
        int onoroff=0;
        NSLog(@"onoroff:%d",onoroff);
        if ([status_str isEqualToString:@"OK"]) {
             NSDictionary*resultsdic = [dict objectForKey:@"results"];
            for (NSDictionary*localdict in resultsdic) {
                NSDictionary*addrcomponents_dict = [localdict objectForKey:@"address_components"];
                for (NSDictionary*localaddress_components in addrcomponents_dict) {
                    NSArray*types_arr = [localaddress_components objectForKey:@"types"];
                    
                    if ([[types_arr objectAtIndex:0] isEqualToString:@"locality"]) {
                        onoroff=1;
                        self.city_txtfld.text = [localaddress_components objectForKey:@"long_name"];
                        NSLog(@"city_txtfld.text:%@",self.city_txtfld.text);
                    }else if ([[types_arr objectAtIndex:0] isEqualToString:@"administrative_area_level_1"]) {
                        NSLog(@"country states:%@",[localaddress_components objectForKey:@"long_name"]);
                    }else if ([[types_arr objectAtIndex:0] isEqualToString:@"country"]) {
                        //self.country_txtfld.text= [localaddress_components objectForKey:@"long_name"];
                        
                        self.country_txtfld.text= [localaddress_components objectForKey:@"long_name"];
                        NSLog(@"country_txtfld.text:%@",self.country_txtfld.text);
                        
                    }else if (onoroff==0){
                        NSLog(@"oneoroff:%d",onoroff);
                        if ([[types_arr objectAtIndex:0] isEqualToString:@"administrative_area_level_2"]) {
                        self.city_txtfld.text = [localaddress_components objectForKey:@"long_name"];
                             NSLog(@" onoroff city_txtfld.text:%@",self.city_txtfld.text);
                        }
                    }
                }
            }
        }
       */
        
        
        int rescode = [[dict objectForKey:@"ResponseCode"]intValue];
        
        if (rescode==0) {
            
            NSDictionary*postalresult_dict = [dict objectForKey:@"Data"];
            
            for (NSDictionary*singledict in postalresult_dict) {
                 self.city_txtfld.text = [singledict objectForKey:@"City"];
                self.country_txtfld.text = [singledict objectForKey:@"Country"];
                break;
            }
                                              
        }
        
    }

}

-(IBAction)editAddressList:(id)sender{
    UIButton*indexid = (UIButton*)sender;
    [self.title_lbl_fr_popup  setText:@"Update Address"];
    [self.ok_btn.titleLabel setText:@"Save"];
    NSUInteger indexval =indexid.tag;
    NSLog(@"editaddress valu index:%lu",(unsigned long)indexval);
     NSLog(@"firstname check:%@",firstname_arr);
    NSLog(@"firstname check:%@",[firstname_arr objectAtIndex:indexval]);
    NSLog(@"firstname check:%@",[firstname_arr objectAtIndex:indexval]);
        NSLog(@"firstname_arr check:%@",[firstname_arr objectAtIndex:indexval]);
        NSLog(@"lastname_arr check:%@",[lastname_arr objectAtIndex:indexval]);
        NSLog(@"street_arr check:%@",[street_arr objectAtIndex:indexval]);
    NSLog(@"address_id_arr:%@",address_id_arr);
    tmpaddressid = [address_id_arr objectAtIndex:indexval];
    self.firstname_txtfld.text = [firstname_arr objectAtIndex:indexval];
    NSLog(@"firstname_arr:%@",firstname_arr);
    self.firstname_txtfld.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    self.lastname_txtfld.text = [lastname_arr objectAtIndex:indexval];
     NSLog(@"lastname_arr:%@",address_id_arr);
    self.lastname_txtfld.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    self.streetone_txtfld.text = [street_arr objectAtIndex:indexval];
     NSLog(@"street_arr:%@",street_arr);
    self.streetone_txtfld.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    self.streettwo_txtfld.text = [street_two_arr objectAtIndex:indexval];
     NSLog(@"street_two_arr:%@",street_two_arr);
    self.streettwo_txtfld.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    self.city_txtfld.text = [city_arr objectAtIndex:indexval];
     NSLog(@"city_arr:%@",city_arr);
    self.city_txtfld.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    //self.country_txtfld.text = []
    self.postalcode_txtfld.text = [postalcode_arr objectAtIndex:indexval];
     NSLog(@"postalcode_arr:%@",postalcode_arr);
    self.postalcode_txtfld.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    NSLog(@"telephone_arr index:%@",telephone_arr);
    NSLog(@"indexvalue:%lu",(unsigned long)indexval);
    self.telephone_txtfld.text = [telephone_arr objectAtIndex:indexval];
     NSLog(@"telephone_arr:%@",telephone_arr);
    self.telephone_txtfld.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    self.country_txtfld.text = [countrycode_arr objectAtIndex:indexval];
     NSLog(@"countrycode_arr:%@",countrycode_arr);
     self.country_txtfld.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    if ([defaultbilladdr_temp isEqualToString:@"1"] && [defaultshippaddr_temp isEqualToString:@"1"]) {
        deflt_bill_str=@"True";
        [self.checkBilling_btn setImage:[UIImage imageNamed:@"click_new.png"] forState:UIControlStateNormal];
        [self.checkShipping_btn setImage:[UIImage imageNamed:@"click_new.png"] forState:UIControlStateNormal];
    }else{
        
        if ([defaultbilladdr_temp isEqualToString:@"1"]){
            deflt_bill_str=@"True";
            
            [self.checkBilling_btn setImage:[UIImage imageNamed:@"click_new.png"] forState:UIControlStateNormal];

        
        }else if ([defaultshippaddr_temp isEqualToString:@"1"]){
            deflt_bill_str=@"True";
            
            [self.checkShipping_btn setImage:[UIImage imageNamed:@"click_new.png"] forState:UIControlStateNormal];

        }
        
    }
    self.title_lbl_fr_popup.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.default_ship_addr_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    self.default_bill_addr_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
  //self.ok_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
 //self.close_cancel_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    
    //address_check_view.hidden=NO;
    [self show_popup_address];
    updatecheck=1;
}

-(void)updateAddressService{
    NSString *str_updateaddressService;
    
    str_updateaddressService = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/customer/address/update/?addressId=%d&fname=%@&lname=%@&street1=%@&street2=%@&city=%@&countryid=%@&reagion=%@&reagionid=%@&postalcode=%@&telephone=%@&defaultbilling=%@&defaultshipping=%@",[tmpaddressid intValue],self.firstname_txtfld.text,self.lastname_txtfld.text,self.streetone_txtfld.text,self.streettwo_txtfld.text,self.city_txtfld.text,@"in",@"hyderabad",@"3",self.postalcode_txtfld.text,self.telephone_txtfld.text,deflt_bill_str,deflt_ship_str];
    str_updateaddressService = [str_updateaddressService stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"str_updateaddressService:%@",str_updateaddressService);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_updateaddressService]];
    
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
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
            NSLog(@"enter success block");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSString*result = [dict objectForKey:@"createResult"];
            
            if([result isEqualToString:@"true"]){
                //[self getlistAddressService];
                [self callSelfController];
            }
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }
    
    [self resignFirstResponder];
}
-(IBAction)removeAddressId:(id)sender{
    UIButton*tappedbtn = (UIButton*)sender;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";
    
    NSString *str_removeaddressService;
    
    
    
        str_removeaddressService = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/customer/address/delete/?addressid=%f",[[address_id_arr objectAtIndex:(long)tappedbtn.tag]doubleValue]];
    
    
    NSLog(@"str_removeaddressService:%@",str_removeaddressService);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_removeaddressService]];
    
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
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
            NSLog(@"enter success block");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSString*result = [dict objectForKey:@"createResult"];
            
            if([result isEqualToString:@"true"]){
                //[self getlistAddressService];
                
                [address_id_arr removeObjectAtIndex:tappedbtn.tag];
                [firstname_arr removeObjectAtIndex:tappedbtn.tag];
                [lastname_arr removeObjectAtIndex:tappedbtn.tag];
                [street_arr removeObjectAtIndex:tappedbtn.tag];
                [street_two_arr removeObjectAtIndex:tappedbtn.tag];
                [city_arr removeObjectAtIndex:tappedbtn.tag];
                [postalcode_arr removeObjectAtIndex:tappedbtn.tag];
                [telephone_arr removeObjectAtIndex:tappedbtn.tag];
                [countrycode_arr removeObjectAtIndex:tappedbtn.tag];
                myaddress_lbl.text =[[NSString alloc]initWithFormat:@"%lu SAVED ADDRESS",(unsigned long)[address_id_arr count]];
                [self.myaddrstableview reloadData];
                //[self callSelfController];
            }
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }
}

-(void)alertShow{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"All feilds are mandatory" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}
-(void)sendTransactionIDServer:(NSString*)trxtId{

    NSString*str_sendTxtIdService = [[NSString alloc]initWithFormat:@"https://www.dentistkart.com/webservice/orders/confirm/?transactionId=%@",@"transactionid"];
    NSMutableURLRequest*req = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_sendTxtIdService]];
    NSData*data = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString*returnresponse = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnRespose:%@",returnresponse);
    
    NSError*jsonError;
    
    NSDictionary*dictjson = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
    
    
    if (dictjson==nil||dictjson==NULL)
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else {
        
        NSString* statuscode = [dictjson objectForKey:@"statuscode"];
        NSString* message = [dictjson objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        
        
        NSLog(@"enter else");
        
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
            NSLog(@"enter success block");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSString*result = [dictjson objectForKey:@"createResult"];
            
            if([result isEqualToString:@"true"]){
                
            }
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }


}


-(void)postPaymentInfoToService{

    
    NSString*str_url = [NSString stringWithFormat:@"https://192.168.0.28/dentistkart/webservice/banktransaction/"];
    
    NSMutableURLRequest*req = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_url]];
    
    [req setHTTPMethod:@"POST"];
    
    NSMutableData*body = [[NSMutableData alloc]init];
    NSString*str_boundary=@"---------------------------14737809831466499882746641449";
    NSString*contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",str_boundary];
    
    [req addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", str_boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"parameter_1\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];

    NSDictionary*merchantInfo_dict = [paymentInfoDict objectForKey:@"merchantInfo"];
    NSDictionary*transactionInfo_dict = [paymentInfoDict objectForKey:@"transactionInfo"];
    
    NSString*json_str = [[NSString alloc]initWithFormat:@"{\"resCode\":\"%@\",\"resDesc\":\"%@\",\"wibmoCustomer\":\"%@\",\"registeredUas\":\"%@\",\"merchantInfo\":\"{\"merId\":\"%@\",\"merName\":\"%@\",\"merCountryCode\":\"%@\",\"merAppId\":\"%@\",\"merProgramID\":\"%@\"}"",\"transactionInfo\":\"{\"txnAmount\":\"%@\",\"txnCurrency\":\"%@\",\"txnFormattedAmount\":\"%@\",\"txnDesc\":\"%@\",\"supportedPaymentType\":\"%@\",\"restrictedPaymentType\":\"%@\",\"merAppData\":\"%@\",\"merTxnId\":\"%@\",\"txnAmtKnown\":\"%@\",\"merDataField\":\"%@\"}"",\"wibmoTxnId\":\"%@\",\"wibmoTxnToken\":\"%@\",\"webUrl\":\"%@\",\"msgHash\":\"%@\",\"specialMer\":\"%@\"}",[paymentInfoDict objectForKey:@"resCode"],[paymentInfoDict objectForKey:@"resDesc"],[paymentInfoDict objectForKey:@"wibmoCustomer"],[paymentInfoDict objectForKey:@"registeredUas"],[merchantInfo_dict objectForKey:@"merId"],[merchantInfo_dict objectForKey:@"merName"],[merchantInfo_dict objectForKey:@"merCountryCode"],[merchantInfo_dict objectForKey:@"merAppId"],[merchantInfo_dict objectForKey:@"merProgramID"],[transactionInfo_dict objectForKey:@"txnAmount"],[transactionInfo_dict objectForKey:@"txnCurrency"],[transactionInfo_dict objectForKey:@"txnFormattedAmount"],[transactionInfo_dict objectForKey:@"txnDesc"],[transactionInfo_dict objectForKey:@"supportedPaymentType"],[transactionInfo_dict objectForKey:@"restrictedPaymentType"],[transactionInfo_dict objectForKey:@"merAppData"],[transactionInfo_dict objectForKey:@"merTxnId"],[transactionInfo_dict objectForKey:@"txnAmtKnown"],[transactionInfo_dict objectForKey:@"merDataField"],[paymentInfoDict objectForKey:@"wibmoTxnId"],[paymentInfoDict objectForKey:@"wibmoTxnToken"],[transactionInfo_dict objectForKey:@"webUrl"],[paymentInfoDict objectForKey:@"msgHash"],[paymentInfoDict objectForKey:@"specialMer"]];
    
    [body appendData:[json_str dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", str_boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [req setHTTPBody:body];
    
    NSURLResponse *url_responce;
    NSError*error;
    
    NSData*responcedata = [NSURLConnection sendSynchronousRequest:req returningResponse:&url_responce error:&error];
    
    NSLog(@"responceData:%@",responcedata);
    
    NSString*returnStr = [[NSString alloc]initWithData:responcedata encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnStr:%@",returnStr);
    
    

}



-(void)postBankInfoToServer{

    
    NSLog(@"paymentInfoDict post:%@",paymentInfoDict);
    
  //  NSDictionary*merchantInfo_dict = [paymentInfoDict objectForKey:@"merchantInfo"];
    //NSDictionary*transactionInfo_dict = [paymentInfoDict objectForKey:@"transactionInfo"];
   // NSLog(@"merchantInfo_dict post:%@",merchantInfo_dict);
    //NSLog(@"transactionInfo_dict post:%@",transactionInfo_dict);
    /*
    NSString*postinfo_str = [[NSString alloc]initWithFormat:@"resCode=%@&resDesc=%@&wibmoCustomer=%@&registeredUas=%@&merId=%@&merName=%@&merCountryCode=%@&merAppId=%@&merProgramID=%@&txnAmount=%@&txnCurrency=%@&txnFormattedAmount=%@&txnDesc=%@&supportedPaymentType=%@&restrictedPaymentType=%@&merAppData=%@&merTxnId=%@&txnAmtKnown=%@&merDataField=%@&wibmoTxnId=%@&wibmoTxnToken=%@&webUrl=%@&msgHash=%@&specialMer=%@",[paymentInfoDict objectForKey:@"resCode"],[paymentInfoDict objectForKey:@"resDesc"],[paymentInfoDict objectForKey:@"wibmoCustomer"],[paymentInfoDict objectForKey:@"registeredUas"],[merchantInfo_dict objectForKey:@"merId"],[merchantInfo_dict objectForKey:@"merName"],[merchantInfo_dict objectForKey:@"merCountryCode"],[merchantInfo_dict objectForKey:@"merAppId"],[merchantInfo_dict objectForKey:@"merProgramID"],[transactionInfo_dict objectForKey:@"txnAmount"],[transactionInfo_dict objectForKey:@"txnCurrency"],[transactionInfo_dict objectForKey:@"txnFormattedAmount"],[transactionInfo_dict objectForKey:@"txnDesc"],[transactionInfo_dict objectForKey:@"supportedPaymentType"],[transactionInfo_dict objectForKey:@"restrictedPaymentType"],[transactionInfo_dict objectForKey:@"merAppData"],[transactionInfo_dict objectForKey:@"merTxnId"],[transactionInfo_dict objectForKey:@"txnAmtKnown"],[transactionInfo_dict objectForKey:@"merDataField"],[paymentInfoDict objectForKey:@"wibmoTxnId"],[paymentInfoDict objectForKey:@"wibmoTxnToken"],[transactionInfo_dict objectForKey:@"webUrl"],[paymentInfoDict objectForKey:@"msgHash"],[paymentInfoDict objectForKey:@"specialMer"]];
     */
    
    
    NSString*postinfo_str = [[NSString alloc]initWithFormat:@"resCode=%@&resDesc=%@&wibmoTxnId=%@&msgHash=%@&dataPickUpCode=%@&customerId=%@&transactionId=%@&merId=%@&merName=%@&merCountryCode=%@&merAppId=%@",[paymentInfoDict objectForKey:@"resCode"],[paymentInfoDict objectForKey:@"resDesc"],[paymentInfoDict objectForKey:@"wibmoTxnId"],[paymentInfoDict objectForKey:@"msgHash"],[paymentInfoDict objectForKey:@"dataPickUpCode"],logged_user_id,self.merchantTransactionID,self.merchant_id_str,[NSString stringWithFormat:MerchantName],[NSString stringWithFormat:CountryCode],self.merchant_app_id_str];
    
    NSLog(@"postinfo_str:%@",postinfo_str);

    NSData*data = [postinfo_str dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString*postlength =  [NSString stringWithFormat:@"%d",(int)[data length]];
    
    
    
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc]init];
    
    //[req setURL:[NSURL URLWithString:@"https://www.dentistkart.com/webservice/banktransaction/"]];
    [req setURL:[NSURL URLWithString:@"https://dentistkart.com/webservice/banktransaction/index.php"]];
    [req setHTTPMethod:@"POST"];
    [req setValue:postlength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody:data];
    
    NSURLResponse *url_responce;
    NSError*error;
    
    NSData*responcedata = [NSURLConnection sendSynchronousRequest:req returningResponse:&url_responce error:&error];
    
    NSLog(@"responceData Post payment Data:%@",responcedata);
    
    NSString*returnStr = [[NSString alloc]initWithData:responcedata encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnStr post payment data:%@",returnStr);
    
    NSDictionary*resultDict = [NSJSONSerialization JSONObjectWithData:responcedata options:kNilOptions error:&error];
    
    NSLog(@"resultDict:%@",resultDict);
    
    NSDictionary*statucDict = [resultDict objectForKey:@"result"];
    NSLog(@"statusDict:%@",statucDict);
    int statuscode = [[statucDict objectForKey:@"statuscode"] intValue];
    NSLog(@"int status code:%d",statuscode);
    if (statuscode==1) {
        NSLog(@"[self.merchantTransactionID intValue]:%d",[self.merchantTransactionID intValue]);
        orderid_intvalue = [self.merchantTransactionID intValue];
        [self removecart];
       //[self callOrdersView];
        /*
        NSLog(@"[statucDict objectForKey:image_url]:%@",[statucDict objectForKey:@"image_url"]);
        payment_confirm_img_str = [statucDict objectForKey:@"image_url"];
        NSLog(@"payment_confirm_img_str:%@",payment_confirm_img_str);
        payment_confirm_status_str = [statucDict objectForKey:@"payment_status"];
        NSLog(@"payment_confirm_status_str:%@",payment_confirm_status_str);
        payment_confirm_info_str = [statucDict objectForKey:@"payment_msg"];
        NSLog(@"payment_confirm_info_str:%@",payment_confirm_info_str);
        */
        
        PaymentConfirmVC*pvc = [[PaymentConfirmVC alloc]init];
        
        [self presentViewController:pvc animated:YES completion:nil];
        [pvc confirmPaymentResult:statucDict :[self.merchantTransactionID intValue]];
        
        
    }else if (statuscode==2){
    
        NSLog(@"payment confirm failed postBankInfoToServer");
    }
    

}

-(void)callOrdersView{
    OrderVC *ovc = [[OrderVC alloc]init];
    [self presentViewController:ovc animated:YES completion:nil];
}

-(void)removecart{
    
    
    sqlite3_stmt *stmt2;
    NSString *update;
    
    
    update=[[NSString alloc]initWithFormat:@"delete from cart;"];
    //update=[[NSString alloc]initWithFormat:@"DROP TABLE cart;"];
    
    NSLog(@"upadte:%@",update);
    int x = sqlite3_prepare_v2(database, [update UTF8String], -1, &stmt2, nil);
    NSLog(@"x=%d",x);
    if (sqlite3_step(stmt2) != SQLITE_DONE)
        NSLog(@"Deletion Error.");
    sqlite3_finalize(stmt2);
    cartcountvalue=0;
    cartid_check=nil;
//    [self getCartCountValue];
    
}


- (IBAction)clickPickerDone:(id)sender {
    type_select_str=[[NSString alloc]initWithFormat:@"%@",[types_list_arr objectAtIndex:select]];
    global_type = [[NSString alloc]initWithString:type_select_str];
    type_store_str = [NSString stringWithString:global_type];
    NSLog(@"global_type check:%@",global_type);
    [tyes_btn setTitle:global_type forState:UIControlStateNormal];
    CGRect frame = typespicker.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    frame.origin.y = 880;
    typespicker.frame = frame;
    [UIView commitAnimations];
    
}

- (IBAction)clickPickerCancel:(id)sender {
    
   // [tyes_btn setTitle:@"" forState:UIControlStateNormal];
   // global_type=@"";
  //  type_store_str=@"";
    CGRect frame = typespicker.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    frame.origin.y = 880;
    typespicker.frame = frame;
    [UIView commitAnimations];
    
    
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

- (IBAction)login_signup_click:(id)sender{
}


-(void)show_popup_address
{
    [address_check_view addSubview:leftmenulist_view];
    NSLog(@"show_popup_address enter");
    address_check_view.alpha=0.0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    address_check_view.alpha=1.0;
    [UIView commitAnimations];
}

-(void)close_popup_address
{
    [myaddress_view addSubview:leftmenulist_view];
    address_check_view.alpha=1.0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    address_check_view.alpha=0.0;
    [UIView commitAnimations];
}




-(void)show_popup_guestsignup
{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    //self.guestSignupview.frame = CGRectMake(0,self.checkout_lbl.frame.origin.y, [self screenSize].width, [self screenSize].height-(self.checkout_lbl.frame.origin.y));
    
    self.firstname_txt.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.lastname_txt.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.email_txt.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.guestname_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.submit_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.cancel_guest_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.cancel_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    
    
    
    [self.view addSubview:self.guestSignupview];
    [self.guestSignupview addSubview:leftmenulist_view];
    NSLog(@"show_popup_login enter");
    self.guestSignupview.alpha=0.0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    self.guestSignupview.alpha=1.0;
    [UIView commitAnimations];
}

-(void)close_popup_guestsignup
{
    self.guestSignupview.alpha=1.0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    self.guestSignupview.alpha=0.0;
    [UIView commitAnimations];
}

- (void)dealloc {
    [_guestSignupview release];
    [_firstname_txt release];
    [_lastname_txt release];
    [_email_txt release];
    [_address_list_scrollview release];
    [_firstname_txtfld release];
    [_lastname_txtfld release];
    [_streetone_txtfld release];
    [_streettwo_txtfld release];
    [_city_txtfld release];
    [_country_txtfld release];
    [_postalcode_txtfld release];
    [_telephone_txtfld release];
    [_checkShipping_btn release];
    [_checkBilling_btn release];
    [_address_scrollview release];
    [_address_innerview release];
    [_leftmenu_underview release];
    [_show_user_not_log_view release];
    [_dentistkartname_lbl release];
    [_delivery_addr_disview release];
    [_address_lbl release];
    [_username_delivery_lbl release];
    [_usr_delvry_ph_lbl release];
    [_total_amt_delivery_view release];
    [_totalcount_lbl release];
    [_price_display_lbl release];
    //[_addresstextView release];
    [_shippingprice_lbl release];
    [_grand_total_lbl release];
    [_proceedToPayBtn release];
    [_pleaseselect_lbl release];
    [_checkout_lbl release];
    [_guestname_lbl release];
    [_submit_btn release];
    [_cancel_btn release];
    [_total_display_view release];
    [_cancel_btn release];
    [_default_ship_addr_lbl release];
    [_default_bill_addr_lbl release];
    [_close_cancel_btn release];
    [_confirmyourorder_lbl release];
    [_order_subview release];
    [_gradtotal_view_bottom release];
    [_reviewproducts_scrollview release];
    [_totalprice_title_lbl release];
    [_qty_title_lbl release];
    [_shipping_title_lbl release];
    [_coupon_title_lbl release];
    [_grandtotal_title_lbl release];
    [_totalprice_lbl release];
    [_qty_lbl release];
    [_shipping_lbl release];
    [_coupon_lbl release];
    [_grand_total_lbl release];
    [_grandtotalprice_lbl release];
    [_paynow_btn release];
    [_grandtotalbottom_lbl release];
    [_confirmorderview release];
    [_grandtotalprice_btn release];
    [_grandtotal_title_lbl release];
    [_grandtotal_value_lbl release];
    [_cancel_guest_btn release];
    [_myaddrstableview release];
    [super dealloc];
}
/*
-(void)dismissKeyboardPopup{
    [pincode_txtfeild resignFirstResponder];
    [street_txtfeild resignFirstResponder];
    [mobile_txtfeild resignFirstResponder];
    [block_txtfeild resignFirstResponder];
    [comments_textview resignFirstResponder];
}
*/
- (IBAction)dissmisKeyboard:(id)sender {
    NSLog(@"dismisskeyboard called");
    CGRect frame = address_check_view.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    frame.origin.x = 0;
    frame.origin.y = 50;
    address_check_view.frame = frame;
    
    [UIView commitAnimations];
    
    [self dismissKeyboardPopup];
}

- (IBAction)ok_click:(id)sender {
    NSLog(@"ok button");
    
    [self validationfeilds];
    /*
    NSLog(@"check mani value=:%d",checkaddressvalue);
    if (checkaddressvalue==1) {
       
    [self uploadEditedAddress];
    }else if (checkaddressvalue==2){
        [self AddNewAddress];
        //[ok_btn setTitle:@"Save" forState:UIControlStateNormal];
    }
     */
    
}
-(void)callProductspage{
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    
    [self presentViewController:pvc animated:YES completion:nil];
    
    
}


- (IBAction)logoutUser:(id)sender {
    // [self logOut];
    [self callProductspage];
    [self logOut];
    
    
}
-(void)logOut{
    NSLog(@"Logout form cart");
    ProductsViewController *pcvout = [[ProductsViewController alloc]init];
    [pcvout logOut];
}

- (IBAction)promotions_btn_click:(id)sender {
}

- (IBAction)products_btn_click:(id)sender {
    [self callProductspage];
}

- (IBAction)orders_btn_click:(id)sender {
    MyOrdersVC *movc = [[MyOrdersVC alloc]init];
    [self presentViewController:movc animated:YES completion:nil];
}

- (IBAction)cart_btn_click:(id)sender {
    CartVC * cvc = [[[CartVC alloc]init]autorelease];
    [self presentViewController:cvc animated:YES completion:nil];
    [cvc release];
}

- (IBAction)more_btn_click:(id)sender {
}

- (IBAction)guestSingupbtn_click:(id)sender {
    if ([self.firstname_txt.text isEqualToString:@""]||[self.firstname_txt.text isEqualToString:@"(null)"]||self.firstname_txt.text==nil||self.firstname_txt.text==NULL)
    {
        
        NSLog(@"self.firstname_txt :%@",self.firstname_txt.text);
        
    }
    
    else if ([self.lastname_txt.text isEqualToString:@""]||[self.lastname_txt.text isEqualToString:@"(null)"]||self.lastname_txt.text==nil||self.lastname_txt.text==NULL)
    {
        NSLog(@"self.lastname_txt :%@",self.lastname_txt.text);
        
    }
    else if ([self.email_txt.text isEqualToString:@""]||[self.email_txt.text isEqualToString:@"(null)"]||self.email_txt.text==nil||self.email_txt.text==NULL)
    {
        [self emailValidationCheck];
        NSLog(@"self.email_txt :%@",self.email_txt.text);
    }else{
    [self setCustomerTypeService];
    }
}

-(void)alertValidation{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"All fields are mandatory" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];

}
-(void)emailValidationCheck{
    
    if ([self validateEmail:self.email_txt.text])
    {
                
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please use valid email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}


- (BOOL)validateEmail:(NSString *)candidate
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}

- (IBAction)closeusermenupop:(id)sender {
    drop_down_view.hidden=YES;
    [self close_click:sender];
}



- (IBAction)drop_down_click_user:(id)sender{
    UIButton*tappedButton =  (UIButton*)sender;
    NSLog(@"drop_down_click_user:%ld",(long)tappedButton.tag);
    if ([pageIdentify_str isEqualToString:@"MyAccountView"]) {
        [self callMyAccountPage];
    }else if ([pageIdentify_str isEqualToString:@"CartVC"]){
        pageIdentify_str=@"ProductsViewController";
        addcartcheckint=2;
        [self openCartPage];
        
    }
    /*
    if(tappedButton.tag ==1){
        //drop_down_view.hidden=NO;
        [drop_down_btn_pro setTag:2];
        leftmenulist_view.hidden=NO;

        
    }else if(tappedButton.tag ==2){
        [drop_down_btn_pro setTag:1];
        leftmenulist_view.hidden=YES;
        //drop_down_view.hidden=YES;
    }*/
}

- (IBAction)close_click:(id)sender {
    [sender resignFirstResponder];
    [self close_popup_address];
    
}

- (IBAction)modifyAddress_Click:(id)sender {
    /*
    [title_lbl_fr_popup setText:@"Modify Address"];
    [ok_btn setTitle:@"Update" forState:UIControlStateNormal];
    checkaddressvalue=1;
    [self show_popup_address];
     */
    
    MyAddressVC*mavc = [[MyAddressVC alloc]init];
    [self presentViewController:mavc animated:YES completion:nil];
}

- (IBAction)newAddress_Click:(id)sender {
    checkaddressvalue=2;
   // [ok_btn setTitle:@"Save" forState:UIControlStateNormal];
    //[title_lbl_fr_popup setText:@"Add NewAddress"];
    
    [self.title_lbl_fr_popup  setText:@"Add New Address"];
    [self.ok_btn.titleLabel setText:@"Save"];

    [self clickCheckBoxBill:0];
    [self clickCheckBoxShip:0];
    [self show_popup_address];
    //[self EmptyFeilds];
}
-(void)EmptyFeilds{
    [tyes_btn setTitle:@"" forState:UIControlStateNormal];
      type_store_str=@"";
      pincode_txtfeild.text=@"";
      street_txtfeild.text=@"";
      block_txtfeild.text=@"";
      comments_textview.text=@"";
}

- (IBAction)placeOrder_Click:(id)sender {
    checkaddressvalue=3;
   // [self PlaceOrderService];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn");
    if (textField==self.country_txtfld)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    else if (textField==street_txtfeild)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    else if (textField==self.postalcode_txtfld)  {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        address_check_view.frame = frame;
        [self getAddressByPostalCode];
        [UIView commitAnimations];
        
    }else if (textField==self.telephone_txtfld) {
        NSLog(@"textFieldShouldReturn telephone_txtfld");
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
        
    }
    
    return YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing");
    [self clickPickerCancel:nil];
    if (textField==self.country_txtfld)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        if ([self screenSize].width<500) {
            
            frame.origin.x = 0;
            frame.origin.y = -150;
            
       
        }else{
            
            frame.origin.x = 0;
            frame.origin.y = -200;
        }
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    /*
    else if (textField==street_txtfeild)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = -200;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }else if (textField==self.streetone_txtfld)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = -200;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }else if (textField==self.streettwo_txtfld)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = -200;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
     */
    else if (textField==self.city_txtfld)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        if ([self screenSize].width<500) {
            
            frame.origin.x = 0;
            frame.origin.y = -150;

            
                    }else{
                        
                        
                        frame.origin.x = 0;
                        frame.origin.y = -200;
        }
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    else if (textField==self.postalcode_txtfld)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        if ([self screenSize].width<500) {
            
            frame.origin.x = 0;
            frame.origin.y = -150;
            
        }else{
            
            frame.origin.x = 0;
            frame.origin.y = -200;
                    }        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    else if (textField==self.telephone_txtfld) {
        NSLog(@"textFieldShouldBeginEditing telephone_txtfld");
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        if ([self screenSize].width<500) {
            
            frame.origin.x = 0;
            frame.origin.y = -150;

                   }else{
           
                       
                       
                       frame.origin.x = 0;
                       frame.origin.y = -200;
        }
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    return YES;
}



-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    //[self clickPickerCancel:nil];
    /*
    if (textField==self.country_txtfld)
    {
        NSLog(@"entred cntry");
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    else if (textField==self.streetone_txtfld)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }else if (textField==self.streettwo_txtfld)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    else if (textField==self.city_txtfld)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    
    else if (textField==self.postalcode_txtfld)
    {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        NSLog(@"end editing postal:%@",self.postalcode_txtfld.text);
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
     */
     if (textField==self.telephone_txtfld) {
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    return YES;
}

- (BOOL)textViewShouldReturn:(UITextView *)textView{
    
    NSLog(@"textViewShouldReturn");
    if(textView==comments_textview){
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    [textView resignFirstResponder];
    
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSLog(@"textViewShouldEndEditing");
    
    if(textView==comments_textview){
        CGRect frame = address_check_view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = -100;
        address_check_view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    [textView resignFirstResponder];
    return YES;
}

- (IBAction)clickCheckBoxShip:(id)sender {
    UIButton*tappedBoxship = (UIButton*)sender;
    
    if (tappedBoxship.tag==0) {
    
        [self.checkShipping_btn setTag:1];
        deflt_ship_str =@"True";
        [self.checkShipping_btn setImage:[UIImage imageNamed:@"click_new.png"] forState:UIControlStateNormal];
    }else if (tappedBoxship.tag==1){
        [self.checkShipping_btn setTag:0];
        deflt_ship_str =@"False";
        [self.checkShipping_btn setImage:[UIImage imageNamed:@"unclick_new.png"] forState:UIControlStateNormal];
    }
    
}

- (IBAction)clickCheckBoxBill:(id)sender {
    UIButton*tappedBoxship = (UIButton*)sender;
    
    if (tappedBoxship.tag==0) {
        deflt_bill_str=@"True";
        [self.checkBilling_btn setTag:1];
        [self.checkBilling_btn setImage:[UIImage imageNamed:@"click_new.png"] forState:UIControlStateNormal];
    }else if (tappedBoxship.tag==1){
        deflt_bill_str=@"False";
        [self.checkBilling_btn setTag:0];
        [self.checkBilling_btn setImage:[UIImage imageNamed:@"unclick_new.png"] forState:UIControlStateNormal];
    }
}

-(IBAction)textfeildChanged:(id)sender{
    NSLog(@"value changed:%@",sender);
    [self textFieldShouldReturn:self.postalcode_txtfld];
}

- (IBAction)valuechangedPostalcode:(id)sender {
    NSLog(@"value changed postal code clicked");
    //[self getAddressByPostalCode];
    [self textFieldShouldReturn:self.postalcode_txtfld];
}

-(void)dismissKeyboardPopup{
    NSLog(@" entred dismisskeyboardpopup");
    [self.postalcode_txtfld resignFirstResponder];
    [self.telephone_txtfld resignFirstResponder];
    [self.country_txtfld resignFirstResponder];
    leftmenulist_view.hidden=YES;
}

-(void)login{
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [self presentViewController:lvc animated:YES completion:nil];
}


///////////////////////////////////////////////////////////////////////
- (IBAction)leftMenuHomeClick:(id)sender {
    ProductsViewController*pvc = [[ProductsViewController alloc]init];
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
- (IBAction)change_click:(id)sender {
    
    self.deliveryaddressView.hidden=YES;
    
    default_bill_str =@"false";
}
- (IBAction)proceedtopay_click:(id)sender {
    //[self generateMessageHash];
    [self orderCreationService];
}

- (IBAction)cartPageClick:(id)sender {
    cartpageopen_str=@"read";
     pageIdentify_str=@"MyAddressVC";
    addcartcheckint=2;
    [self openCartPage];
}

-(void)openCartPage{
    
    CartVC *cvclocal = [[[CartVC alloc]init]autorelease];
    [self presentViewController:cvclocal animated:YES completion:nil];
    [cvclocal release];
    
}
- (IBAction)searchBtnClick:(id)sender {
     pageIdentify_str=@"MyAddressVC";
    SearchVC*svc = [[SearchVC alloc]init];
    [self presentViewController:svc animated:YES completion:nil];
}




///////////////////////////////TableView delegate methods///////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [address_id_arr count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @try {
        
        
        NSLog(@"cellforrow");
        AddressViewCell * pcell;
        
        static NSString *cellIdentifier1 = @"cellIdentifieraddress";
        pcell = (AddressViewCell *)[self.myaddrstableview dequeueReusableCellWithIdentifier:cellIdentifier1];
        
        if (pcell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AddressViewCell"
                                                         owner:self options:nil];
            for (id oneObject in nib) if ([oneObject isKindOfClass:[AddressViewCell class]])
                pcell = (AddressViewCell *)oneObject;
        }
        pcell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSString *myaddrname_str=[[NSString alloc]initWithFormat:@"%@ %@",[firstname_arr objectAtIndex:[indexPath row]],[lastname_arr objectAtIndex:[indexPath row]]];
        
        // countRow=[[product_id_arr objectAtIndex:indexPath.row]intValue];
        //NSLog(@"countRow in cell:%d",countRow);
        NSLog(@"myaddrname_str:%@",myaddrname_str);
        // pcell.user_name.text =product_img_str;
        
        
        pcell.myaddrusername_lbl.text = myaddrname_str;
        pcell.myaddrusername_lbl.lineBreakMode = NSLineBreakByWordWrapping;
        pcell.myaddrusername_lbl.numberOfLines=0;
        
        
        
        NSLog(@"crossed 1");
        
        
        
               pcell.myaddraddress_txtview.text =[NSString stringWithFormat: @"%@,\n%@,\nIndia-%@",[street_arr objectAtIndex:indexPath.row],
                              [city_arr objectAtIndex:indexPath.row],[postalcode_arr objectAtIndex:indexPath.row]];
       
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedAddressTxtViewTapped:)];
        [pcell.myaddraddress_txtview addGestureRecognizer:tap];
        pcell.myaddraddress_txtview.tag = (int)indexPath.row;
        
               pcell.myaddrtelephone_lbl.text = [NSString  stringWithFormat:@"Telephone:%@",[telephone_arr objectAtIndex:indexPath.row]];
        
        
        
        NSLog(@"crossed 2");
        
        pcell.myaddredit_btn.tag = (int)indexPath.row;
        [pcell.myaddredit_btn addTarget:self action:@selector(editAddressList:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
       // pcell.myaddrremove_btn.tag = [[address_id_arr objectAtIndex:indexPath.row]intValue];
         pcell.myaddrremove_btn.tag = (int)indexPath.row;
        
        [pcell.myaddrremove_btn addTarget:self action:@selector(removeAddressId:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        pcell.myaddrusername_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        pcell.myaddraddress_txtview.font = [UIFont systemFontOfSize:[self screenSize].width/40];
        pcell.myaddrtelephone_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        pcell.myaddredit_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/50];
        pcell.myaddrremove_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/50];
        
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
    
    
    // prodid_global_str = [[NSString alloc]initWithFormat:@"%@",[product_id_arr objectAtIndex:[indexPath row]]];
    NSLog(@"indexPath:%ld",(long)indexPath.row);
    [self selectedAddressViewTapped:(int)indexPath.row];
    
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
    if ([self screenSize].width<769) {
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
        heightval=[self screenSize].height/3;
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

/*
//////////////////////////////////////////////////////Payment Methods//////////////////////////////////////////////////////////////

#pragma mark - NSURLConnectionDelegate Methods

- (void)connection:(NSURLConnection *)iConnection didReceiveData:(NSData *)iData {
    [self.responseData appendData:iData];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)iConnection {
    NSError *anError;
    NSDictionary* aJSONValue = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&anError];
    if (aJSONValue) {
        NSLog(@"aJSONValue: %@", aJSONValue);
        
        
        NSString *aMerTxnId = [aJSONValue valueForKey:@"merTxnId"];
        NSString *aMsgHash = [aJSONValue valueForKey:@"msgHash"];
        
        if (aMerTxnId && aMsgHash) {
            [self setMerchantTransactionID:aMerTxnId];
            [self setMessageHash:aMsgHash];
            [self initializePayment];
        }
    } else {
        NSString *aResponseString = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
        NSLog(@"aResponseString: %@", aResponseString);
    }
}


- (void)connection:(NSURLConnection *)iConnection didFailWithError:(NSError *)iError {
    NSLog(@"Error: %@", iError);
}

*/
#pragma mark - Private
/*
- (IBAction)payWithPayZapp:(id)iSender {
    [self generateMessageHash];
}
*/
/*

- (void)generateMessageHash {
    NSString *anAppData = @"AppDATA";
    NSString *anAmount = [NSString stringWithString:global_grandprice_str];
    
    NSString *anEndPoint = [NSString stringWithFormat:GET_MSG_HASH, anAmount, ENCODE_STRING(anAppData)];
    NSString *aHashAPI = [NSString stringWithFormat:@"%@%@", BASE_URL, anEndPoint];
    NSLog(@"HashAPI: %@", aHashAPI);
    
    NSURL *anURL = [NSURL URLWithString:aHashAPI];
    NSURLRequest *anURLRequest=[NSURLRequest requestWithURL:anURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    
    NSLog(@"URL: %@", anURL);
    self.responseData = [[NSMutableData alloc] init];
    self.urlConnection =[[NSURLConnection alloc] initWithRequest:anURLRequest delegate:self startImmediately:YES];
}


- (void)initializePayment {
    
    
    ///////////////Merchant Info//////////////////////////////////
    WSMerchantInfo *aMerchantInfo = [[WSMerchantInfo alloc] init];
   
    
    
    aMerchantInfo.merchantID = self.merchant_id_str;
    aMerchantInfo.merchantCountryCode = [NSString stringWithFormat:CountryCode];
    aMerchantInfo.merchantAppID = self.merchant_app_id_str;
    aMerchantInfo.merchantName = [NSString stringWithFormat:MerchantName];

    NSLog(@"merchant_app_id_str:%@",self.merchant_app_id_str);
    
    
    
    /////////////////////Transaction Info///////////////////////////////////
    WSTransactionInfo *aTransactionInfo = [[WSTransactionInfo alloc] init];

    
    aTransactionInfo.transactionCurrency = self.transaction_currency_str;

    //double transact_amt = [self.transaction_amt_str doubleValue];
   // self.transaction_amt_str = [NSString stringWithFormat:@"%.2f",transact_amt/100];
    //aTransactionInfo.transactionAmount = [NSString stringWithFormat:@"%.2f",[self.transaction_amt_str doubleValue]] ;
    aTransactionInfo.transactionAmount = self.transaction_amt_str;
     aTransactionInfo.merchantAppData = self.merchant_app_data_str;
    aTransactionInfo.transactionDescription = @"Dentistkart";
    //aTransactionInfo.transactionDescription = [NSString stringWithFormat:transactionDesc];
    //aTransactionInfo.supportedPaymentType = @[@"w.ds.pt.card_visa", @"w.ds.pt.card_mastercard"];
    aTransactionInfo.supportedPaymentType = @[@"*"];
     aTransactionInfo.messageHash = self.messageHash;
     NSLog(@"messageHash:%@",self.messageHash);
     aTransactionInfo.merchantTransactionId = self.merchantTransactionID;
     NSLog(@"merchantTransactionID:%@",self.merchantTransactionID);
    
    /////////////////////////Customer Info/////////////////////////////////////////////
    
    WSCustomerInfo *aCustomerInfo = [[WSCustomerInfo alloc] init];
    if ([customer_type_str isEqualToString:@"Guest"]) {
    
        NSLog(@"guestname_str in payment:%@",self.guestname_str);
        NSLog(@"guestemail payment:%@",self.guestemail_str);
        NSLog(@"guestphone_str in payment:%@",self.guestphone_str);
        
        
        aCustomerInfo.customerEmail = self.guestemail_str;
        aCustomerInfo.customerMobile = self.guestphone_str;
        //NSLog(@"firstname payment:%@",firstlastname);
        aCustomerInfo.customerName = self.guestname_str;
        
    }else{
    NSLog(@"global_email_store in payment:%@",global_email_store);
    aCustomerInfo.customerEmail = [NSString stringWithString:global_email_store];
    NSLog(@"paytelephonenum in payment:%@",paytelephonenum);
    aCustomerInfo.customerMobile = paytelephonenum;
    
    NSLog(@"username_delivery_lbl payment:%@",self.username_delivery_lbl.text);
    //NSLog(@"firstname payment:%@",firstlastname);
    aCustomerInfo.customerName = [NSString stringWithString:self.username_delivery_lbl.text];
    
    //aCustomerInfo.customerDateOfBirth = @"20010101";
    }
    WibmoSDK *aWibmoSDK = [[WibmoSDK alloc] init];
    [self presentViewController:aWibmoSDK animated:YES completion:^{
        [aWibmoSDK setTransactionInfo:aTransactionInfo];
        [aWibmoSDK setMerchantInfo:aMerchantInfo];
        [aWibmoSDK setCustomerInfo:aCustomerInfo];
        [aWibmoSDK setDelegate:self];
        
        [aWibmoSDK initializePayment];
    }];
    
}


#pragma mark - WibmoSDKDelegate

- (void)paymentSuccessfulWithTranscation:(NSDictionary *)iTransaction {
    
    
    NSLog(@"iTransaction:%@",iTransaction);
    NSString *aTransactionID = [iTransaction valueForKey:@"wibmoTxnId"];
    [self dismissViewControllerAnimated:YES completion:^{
        NSString *aMessage = [NSString stringWithFormat:@"Your payment was made successfuly.\n\nTransaction ID: %@", aTransactionID];
        if ([iTransaction valueForKey:@"dataPickUpCode"]) {
            aMessage = [aMessage stringByAppendingFormat:@"\n\nPickUp Code: %@", [iTransaction valueForKey:@"dataPickUpCode"]];
        }
        
        [[[UIAlertView alloc] initWithTitle:@"Congratulations!" message:aMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }];
    
    paymentInfoDict = [[NSDictionary alloc]initWithDictionary:iTransaction];
    NSLog(@"paymentInfoDict success method:%@",paymentInfoDict);
    //[self postPaymentInfoToService];
    [self postBankInfoToServer];
    
}


- (void)paymentFailedWithError:(NSError *)iError {
    [self dismissViewControllerAnimated:NO completion:^{
        if ([iError.userInfo valueForKey:@"Message"]) {
            NSString *aMessage = [iError.userInfo valueForKey:@"Message"];
            [[[UIAlertView alloc] initWithTitle:@"Failed!" message:aMessage delegate:self
                              cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
        }
    }];
}


- (void)paymentCancelled {
    [self dismissViewControllerAnimated:YES completion:^{
        NSString *aMessage = [NSString stringWithFormat:@"Your payment was cancelled."];
        [[[UIAlertView alloc] initWithTitle:@"Failed!" message:aMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }];
}


- (void)paymentTimedOut {
    [self dismissViewControllerAnimated:YES completion:^{
        NSString *aMessage = [NSString stringWithFormat:@"Your payment was timed out."];
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:aMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }];
}
*/

- (IBAction)paynowClick:(id)sender {
    [self orderCreationService];
}
@end



// Bypass SSL Domain Errors.

@implementation NSURLRequest(DataController)

+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host {
    return YES;
}

@end
////////////////////////////////////////////////////Payment End///////////////////////////////////////////////////////////