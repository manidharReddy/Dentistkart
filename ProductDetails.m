//
//  ProductDetails.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 21/10/15.
//  Copyright © 2015 Google Inc. All rights reserved.
//

#import "ProductDetails.h"
#import "AppDelegate.h"
#import "ProductsViewController.h"
#import "CategoriesViewController.h"
#import "CartVC.h"
#import "LoginViewController.h"

#import "MyAccountView.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "SearchVC.h"
#import "CategoryProductsView.h"
#import "OrderVC.h"
@interface ProductDetails ()

@end

@implementation ProductDetails
@synthesize left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro,left_menu_brand_btn;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    global_page_id=@"ProductDetails";
    
    
    
    ///////////////////ScrollProduct ////////////////////////////////
    self.mainscrollview.scrollEnabled=YES;
    self.mainscrollview.userInteractionEnabled=YES;
    self.mainscrollview.pagingEnabled = YES;
    self.mainscrollview.showsHorizontalScrollIndicator = NO;
    self.mainscrollview.showsVerticalScrollIndicator = NO;
    self.mainscrollview.scrollsToTop = NO;
    ////////////////////////////////////////////////////////////////
   self.mainscrollview.delegate = self;
    
    
    self.spprice_lbl.text = @"";
    self.price_lbl.text=@"";
    self.availability_lbl.text=@"";
    
    //////////////////Scroll vertically////////////////////////////////////
    /*
    self.mainscrollview.translatesAutoresizingMaskIntoConstraints=NO;
   
    NSDictionary *views = @{@"display_view":self.display_view};
    NSString*strnum = [[NSString alloc]initWithFormat:@"%f",self.display_view.frame.size.height+self.prodct_long_desc_txtview.frame.size.height+100];
    NSLog(@"strnum:%@",strnum);
    NSDictionary *metrics = @{@"height" : strnum};
    [self.mainscrollview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[display_view(height)]|" options:kNilOptions metrics:metrics views:views]];
    //[self.scrollproduct addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[beeView(width)]|" options:kNilOptions metrics:metrics views:views]];
    */
    ///////////////////////////////////////////////////////////////////////////////////////////////
    
    
    ///////////////////////Side Menu///////////////////////
    //leftmenulist_view.frame = CGRectMake(0, 50, 200, 600);
    leftmenulist_view.frame = CGRectMake(0, 50, ([self screenSize].width/2)+[self screenSize].width/3, [self screenSize].height-50);

    [self.view addSubview:leftmenulist_view];
    
    left_menu_profile_img.layer.cornerRadius=10;
    left_menu_profile_img.clipsToBounds=YES;
    
    leftmenulist_view.hidden=YES;
    
    //self.subviewinimg.frame = CGRectMake(0, self.product_brand_name_lbl.frame.origin.y+self.product_brand_name_lbl.frame.size.height+5, self.display_view.frame.size.width, 100);
    //[self.display_view addSubview:self.subviewinimg];
    //imgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.subviewinimg.frame.size.width, self.subviewinimg.frame.size.height)];
    //[self.subviewinimg addSubview:imgview];
    
    cvc = [[CartVC alloc]init];
    
    if ([logged_name_str isEqualToString:@""]||[logged_name_str isEqualToString:@"(null)"]||logged_name_str==nil||logged_name_str==NULL) {
        left_menu_profile_name.hidden=YES;
        left_menu_profile_email_lbl.hidden=YES;
        [left_menu_logout_btn setTag:1];
        [left_menu_logout_btn setTitle:@"Login" forState:UIControlStateNormal];
        self.dentistkartname_lbl.font = [UIFont boldSystemFontOfSize:[self screenSize].height/20];
        self.dentistkartname_lbl.adjustsFontSizeToFitWidth=YES;
        self.show_user_not_log_view.frame = CGRectMake(0, 0,([self screenSize].width/2)+[self screenSize].width/3 , self.leftmenu_underview.frame.size.height);
        [self.leftmenulist_view addSubview:self.show_user_not_log_view];
        //self.cartitemscount_btn.hidden=YES;
        

    }else{
        
        //self.cartitemscount_btn.hidden=NO;
        //[self getCartCountValue];
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

 /*
    NSDictionary *imgviews = @{@"imgview":imgview};
    NSDictionary *imgmetrics = @{@"height" : @200};
    [self.subviewinimg addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imgview(height)]|" options:kNilOptions metrics:imgmetrics views:imgviews]];
   */
    /*
    self.display_view.translatesAutoresizingMaskIntoConstraints=NO;
    self.product_big_imageview.translatesAutoresizingMaskIntoConstraints=NO;
    [self.display_view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-[product_big_imageview(>=200)]-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(self.product_big_imageview)]];
    
    [self.display_view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:[product_big_imageview(==200)]-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(self.product_big_imageview)]];
     */
    
    //left_menu_profile_name.text = logged_username;
    //left_menu_profile_email_lbl.text = global_email_store;
    //////////////////////////////////////////////////////////
    
    
    //[self loadProductInfoToView];
    
   // [self.prodct_long_desc_txtview setFont:[UIFont fontWithName:@"System" size:[self screenSize].width/10]];
    
    
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
    
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";

    [self performSelector:@selector(getProductsDetails) withObject:nil afterDelay:0.0];
    
   //[self getProductsDetails:global_product_id];
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

-(void)loadProductInfoToView{

    int countRow=0;
    
    
    NSString*img_str;
    for (int i=0; i<prodimages_glb_arr.count; i++) {
        img_str=[prodimages_glb_arr objectAtIndex:i];
        
       //UIView *tmpview = [[UIView alloc]initWithFrame:CGRectMake(8 + (85 * countRow),0 , 80, 50)];
        //UIButton *iconbtn =[UIButton buttonWithType:UIButtonTypeSystem];
       // UIButton *iconbtn=[[UIButton alloc]initWithFrame:CGRectMake(8 + (([self screenSize].width/8) * countRow),0, ([self screenSize].width/8), ([self screenSize].width/5))];
        
         UIButton *iconbtn=[[UIButton alloc]initWithFrame:CGRectMake(8 + (85*countRow),0, 85, 85)];
        //[iconbtn setBackgroundColor:[UIColor colorWithRed:79/255.0 green:194/255.0 blue:234/255.0 alpha:1]];
        
        //iconbtn.titleLabel.font = [UIFont fontWithName:@"Santor" size:18.0f];
        //repeateBtn.titleLabel.text = @"Add Cart";
        //iconbtn.titleLabel.text = [[NSString alloc]initWithString:@"Add Cart"];
        // [repeateBtn setTitle:@"Add Cart" forState:UIControlStateNormal];
        
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:img_str]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
          //  self.product_big_imageview.image = [UIImage imageWithData:data];
            NSLog(@"iconbtn image set");
            [iconbtn setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
        }];
        
        
        //[repeateBtn setImage:[UIImage imageNamed:@"CartButtonBlue"] forState:UIControlStateNormal];
        
        //repeateBtn.titleLabel.textColor = [UIColor whiteColor];
        iconbtn.tag = i;
        iconbtn.layer.borderWidth=1.0;
        iconbtn.layer.cornerRadius=2.0;
       // iconbtn.layer.borderColor = [UIColor clearColor].CGColor;
        [iconbtn addTarget:self action:@selector(selectedImg:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        //[tmpview addSubview:iconbtn];
        //[self.scroll_addsmallimg addSubview:tmpview];
        [self.scroll_addsmallimg addSubview:iconbtn];
        countRow++;
    }
    
    
    self.share_btn.titleLabel.font = [UIFont boldSystemFontOfSize:[self screenSize].height/50];
    self.addtocart_btn.titleLabel.font = [UIFont boldSystemFontOfSize:[self screenSize].height/50];
    self.buy_btn.titleLabel.font = [UIFont boldSystemFontOfSize:[self screenSize].height/50];
    
    self.avialable_lbl.font =[UIFont systemFontOfSize:[self screenSize].height/40];
    //[UIFont systemFontOfSize:[self screenSize].height/50];
   // self.productdec_lbl.font = [UIFont fontWithName:@"Santor" size:[self screenSize].height/50];
    
    self.productdec_lbl.font = [UIFont boldSystemFontOfSize:[self screenSize].height/40];
    self.product_name_lbl.text = prodname_glb_str;
    self.product_name_lbl.font=[UIFont systemFontOfSize:[self screenSize].height/50];
    self.product_name_lbl.lineBreakMode = NSLineBreakByWordWrapping;
    self.product_name_lbl.numberOfLines=0;

    
    NSLog(@"prodshort_glb_str short desc:%@",prodshort_glb_str);
    prodshort_glb_str = [prodshort_glb_str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSLog(@"prodshort_glb_str short desc after:%@",prodshort_glb_str);
    self.short_desc_txtview.text = prodshort_glb_str;
    self.short_desc_txtview.font=[UIFont systemFontOfSize:[self screenSize].width/50];
     self.price_lbl.text = prodprice_glb_str;
    
    self.price_lbl.font=[UIFont systemFontOfSize:[self screenSize].height/45];
    self.availability_lbl.text=prodavailability_glb_str;
    
    self.avialable_lbl.font = [UIFont systemFontOfSize:[self screenSize].height/40];
    self.spprice_lbl.font = [UIFont systemFontOfSize:[self screenSize].height/45];
    self.availability_lbl.font=[UIFont systemFontOfSize:[self screenSize].height/40];
    
    if ([prodavailability_glb_str isEqualToString:@"0"]) {
        self.addtocart_btn.enabled = NO;
        self.buy_btn.enabled=NO;
    }
    
    //[self.prodct_long_desc_txtview setValue:prodlongdesc_glb_str forKey:@"contentToHTMLString"];
    
    self.prodct_long_desc_txtview.text=prodlongdesc_glb_str;
     //self.prodct_long_desc_txtview.font = [UIFont fontWithName:@"System" size:[self screenSize].height/20];
   // NSLog(@"prodct_long_desc_txtview:%@",prodct_long_desc_txtview);
    self.prodct_long_desc_txtview.font=[UIFont systemFontOfSize:[self screenSize].width/40];
    
    [self selectedImg:0];
   //[self.mainscrollview setContentSize:CGSizeMake([self screenSize].width, self.display_view.frame.size.height*3)];
    
    NSLog(@" check view height %f ",self.display_view.frame.size.height+self.prodct_long_desc_txtview.frame.size.height*3);
    
    //[self.mainscrollview setContentSize:CGSizeMake([self screenSize].width, 800)];
    //[self.view addSubview:self.mainscrollview];
    //////////////////Scroll vertically////////////////////////////////////
    /*
     self.mainscrollview.translatesAutoresizingMaskIntoConstraints=NO;
     
     NSDictionary *views = @{@"display_view":self.display_view};
     NSString*strnum = [[NSString alloc]initWithFormat:@"%f",(self.display_view.frame.size.height+self.prodct_long_desc_txtview.frame.size.height)*2];
     NSLog(@"strnum:%@",strnum);
     NSDictionary *metrics = @{@"height" : strnum};
     [self.mainscrollview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[display_view(height)]|" options:kNilOptions metrics:metrics views:views]];
     //[self.scrollproduct addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[beeView(width)]|" options:kNilOptions metrics:metrics views:views]];
    */
    ///////////////////////////////////////////////////////////////////////////////////////////////
}

-(IBAction)selectedImg:(id)sender{
    UIButton*tappedbtn = (UIButton*)sender;
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[prodimages_glb_arr objectAtIndex:tappedbtn.tag]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        //self.product_big_imageview.image = [UIImage imageWithData:data];
        //[imgview setImage:[UIImage imageWithData:data]];
        //[self.product_big_imageview setContentMode:UIViewContentModeScaleAspectFit];
        //self.product_big_imageview.clipsToBounds=YES;
       // CGRect frame = [[UIScreen mainScreen] bounds];
        //CGRect frame = self.mainscrollview.bounds;
        [self.product_big_imageview setImage:[UIImage imageWithData:data]];
        
        //self.product_big_imageview.frame = frame;
        
    }];
    
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
    [_product_name_lbl release];
    [_product_brand_name_lbl release];
    [_product_big_imageview release];
    [_scroll_addsmallimg release];
    [_short_desc_txtview release];
    [_price_lbl release];
    [_availability_lbl release];
    [_share_btn release];
    [_addtocart_btn release];
    [_buy_btn release];
    [_prodct_long_desc_txtview release];
    [_mainscrollview release];
    [_display_view release];
    [_subimg_view release];
    [_subviewinimg release];
    [_leftmenu_underview release];
    [_show_user_not_log_view release];
    [_dentistkartname_lbl release];
    [_productdec_lbl release];
    [_avialable_lbl release];
    [_spprice_lbl release];
    [super dealloc];
}

-(void)getProductsDetails{
    NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/product/iOS/?type=product&product_id=%d",
                             global_product_id];
    
    NSLog(@"str_country:%@",str_country);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country]];
    
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
            NSLog(@"enter success block");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            //NSDictionary*createresultdict = [dict objectForKey:@"createResult"];
            
            prodimages_glb_arr = [[NSMutableArray alloc]init];
            
            
            
            NSMutableArray * jsoninarr;
            
            
            jsoninarr = [[NSMutableArray alloc]initWithArray:[dict objectForKey:@"createResult"]];
            NSLog(@"jsoninarr:%@",jsoninarr);
            NSDictionary*createresultdict = [jsoninarr objectAtIndex:0];
            NSLog(@"details:%@",[createresultdict objectForKey:@"image"]);
            NSDictionary*dictprodname  = [createresultdict objectForKey:@"details"];
            
            NSString*product_id_str = [dictprodname objectForKey:@"product_id"];
            NSLog(@"product id:%@",product_id_str);
            
            [self.addtocart_btn setTag:[product_id_str integerValue]];
            [self.buy_btn setTag:[product_id_str integerValue]];
            //[product_id_arr addObject:product_id_str];
           // [tempproduct_id_arr addObject:product_id_str];
            NSString*product_name_str = [dictprodname objectForKey:@"name"];
            
            if ([product_name_str isEqualToString:@""]||[product_name_str isEqualToString:@"<null>"]||[product_name_str isEqualToString:@"null"]||[product_name_str isEqualToString:@"(null)"]||product_name_str ==nil||product_name_str==NULL)
            {
                product_name_str=@"Not Available";
            }
            prodname_glb_str = [NSString stringWithString:product_name_str];
            NSLog(@"product name:%@",product_name_str);
            //[product_name_arr addObject:product_name_str];
            
            NSString*product_desc_str = [dictprodname objectForKey:@"description"];
            
            if ([product_desc_str isEqualToString:@""]||[product_desc_str isEqualToString:@"<null>"]||[product_desc_str isEqualToString:@"null"]||[product_desc_str isEqualToString:@"(null)"]||product_desc_str ==nil||product_desc_str==NULL)
            {
                product_desc_str=@"Not Available";
            }
            prodlongdesc_glb_str = [NSString stringWithString:product_desc_str];
            NSLog(@"product_desc_str:%@",product_desc_str);
            //[product_desc_arr addObject:product_desc_str];
            
            
            
            NSString*product_short_str = [dictprodname objectForKey:@"short_description"];
            
            if ([product_short_str isEqualToString:@""]||[product_short_str isEqualToString:@"<null>"]||[product_short_str isEqualToString:@"null"]||[product_short_str isEqualToString:@"(null)"]||product_short_str ==nil||product_short_str==NULL)
            {
                product_short_str=@"Not Available";
            }
            
            prodshort_glb_str = [NSString stringWithString:product_short_str];
            NSLog(@"product_short_str:%@",product_short_str);
           // [product_short_arr addObject:product_short_str];
            
            
            NSString*product_price_str = [dictprodname objectForKey:@"price"];
            
            if ([product_price_str isEqualToString:@""]||[product_price_str isEqualToString:@"<null>"]||[product_price_str isEqualToString:@"null"]||[product_price_str isEqualToString:@"(null)"]||product_price_str ==nil||product_price_str==NULL)
            {
                product_price_str=@"Not Avialable";
            }
            
            NSString*product_spprice_str = [dictprodname objectForKey:@"special_price"];
            NSLog(@"product_spprice_str:%@",product_spprice_str);
            if ([product_spprice_str isEqualToString:@""]||[product_spprice_str isEqualToString:@"<null>"]||[product_spprice_str isEqualToString:@"null"]||[product_spprice_str isEqualToString:@"(null)"]||product_spprice_str ==nil||product_spprice_str==NULL||[product_spprice_str isEqualToString:@" "])
            {
                NSLog(@"if");
                product_spprice_str=@"(Rs.0.00)";
            }else{
                NSLog(@"product_spprice_str else:%@",product_spprice_str);
            product_spprice_str =[[NSString alloc]initWithFormat:@"Rs.%.2f",[product_spprice_str doubleValue]];
                NSLog(@"product_spprice_str after:%@",product_spprice_str);
            }
            
            if ([product_spprice_str isEqualToString:@"(Rs.0.00)"]){
                NSLog(@"2nd if");
            prodprice_glb_str = [NSString stringWithFormat:@"Rs\t%.2f",[product_price_str doubleValue]];
            }else{
            product_price_str = [NSString stringWithFormat:@"(Rs.%.2f)",[product_price_str doubleValue]];
                
                NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:product_price_str];
                
                
                // making text property to strike text- NSStrikethroughStyleAttributeName
                [titleString addAttribute: NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range: NSMakeRange(0, [titleString length])];
                
                NSLog(@"product_spprice_str check:%@",product_spprice_str);
                prodprice_glb_str = [[NSString alloc]initWithFormat:@"%@",product_spprice_str];
                NSLog(@"prodprice_glb_str else:%@",prodprice_glb_str);
                //pcell.product_price.font = [UIFont systemFontOfSize:[self screenSize].width/40];
                
                [self.spprice_lbl setAttributedText:titleString];
                //[prodspprice_lbl setAttributedText:titleString];
                
                
                
            }
            
            NSLog(@"product_price_str:%@",product_price_str);
           // [product_price_arr addObject:product_price_str];
            
            
            NSString*url_share = [dictprodname objectForKey:@"url_path"];
            if ([url_share isEqualToString:@""]||[url_share isEqualToString:@"<null>"]||[url_share isEqualToString:@"null"]||[url_share isEqualToString:@"(null)"]||url_share ==nil||url_share==NULL)
            {
                url_share=@"Not Avialable";
            }else{
                url_path_share_str = [NSString stringWithString:url_share];
            }
            
            
            NSString*available_stock_check;
            
            if ([[createresultdict objectForKey:@"prod_available"] intValue]>0) {
                
            
            NSString*avialable_stock_str = [createresultdict objectForKey:@"prod_available"];
                
           /*
                if ([avialable_stock_str isEqualToString:@""]||[avialable_stock_str isEqualToString:@"<null>"]||[avialable_stock_str isEqualToString:@"null"]||[avialable_stock_str isEqualToString:@"(null)"]||avialable_stock_str ==nil||avialable_stock_str==NULL)
            {
                avialable_stock_str=@"Out of Stock";
                available_stock_check=@"";
            }else{
            available_stock_check=@"In Stock";
            }
            */
                available_stock_check=@"In Stock";
                 prodavailability_glb_str = [NSString stringWithFormat:@"%@ %@",avialable_stock_str,available_stock_check];
                self.addtocart_btn.enabled=YES;
                self.buy_btn.enabled=YES;
                
            
            }else{
               available_stock_check=@"Out of Stock";
                 prodavailability_glb_str = [NSString stringWithFormat:@"%@",available_stock_check];
                
                self.addtocart_btn.enabled=NO;
                self.buy_btn.enabled=NO;
                self.availability_lbl.textColor = [UIColor redColor];
                self.addtocart_btn.alpha=0.5;
                self.buy_btn.alpha=0.5;
            }
            
           
            
            NSMutableArray*arr = [createresultdict objectForKey:@"image"];
            NSDictionary*imgdict = [arr objectAtIndex:0];
            NSLog(@"imageurlpath:%@",[imgdict objectForKey:@"url"]);
            
           // prodavailability_glb_str=@"Availble in stock";
            
            NSString*url = [imgdict objectForKey:@"url"];
            
            if ([url isEqualToString:@""]||[url isEqualToString:@"<null>"]||[url isEqualToString:@"null"]||[url isEqualToString:@"(null)"]||url ==nil||url==NULL)
            {
                url=@"Not Avialable";
            }
           [prodimages_glb_arr addObject:url];
            [self loadProductInfoToView];
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
    
}




- (IBAction)shareClick:(id)sender {
    
    NSLog(@"shareClick enter");
    NSString *textToShare = @" click below link to view dentistkart product!";
    NSString*url_str = [NSString stringWithFormat:@"https://www.dentistkart.com/%@",url_path_share_str];
    NSURL *myWebsite = [NSURL URLWithString:url_str];
    
    NSArray *objectsToShare = @[textToShare, myWebsite];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    if ([activityVC respondsToSelector:@selector(popoverPresentationController)]) {
     
        activityVC.popoverPresentationController.sourceView = self.display_view;
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo,UIActivityTypePostToWeibo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [self presentViewController:activityVC animated:YES completion:nil];
    }
}

- (IBAction)addtocartClick:(id)sender {
    
    NSLog(@"add cart ID");
    [self showLoaderAddCart];
  //  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.display_view animated:YES];
    //hud.labelText = @"Loading....";
    
   // tappedButton_addcart_btn = [prodid_global_str intValue];
    
   // [tappedButton_addcart_btn setTag:[prodid_global_str integerValue]];
   // cartcountvalue=0;
    NSLog(@"add cart ID");
    quantity_str=@"1";
    
    tappedButton_addcart_btn = (UIButton*)sender;
    NSLog(@"tappedButton_addcart_btn:%@",tappedButton_addcart_btn);
    NSLog(@"tappedButton_addcart_btn tag:%ld",(long)tappedButton_addcart_btn.tag);
    addcartcheckint=1;
    [self performSelector:@selector(addingToCart) withObject:nil afterDelay:1.0f];
    
   
}

-(void)addingToCart{
    [cvc cartCreateIfNotExist];
    [cvc countOfCartItems];
    [self getCartCountValue];
    [MBProgressHUD hideHUDForView:self.view animated:YES];

}


-(void)showLoaderAddCart{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Adding....";
    
}

- (IBAction)cartPageClick:(id)sender {
    NSLog(@"cartpage entred click");
    cartpageopen_str=@"read";
    pageIdentify_str=@"ProductDetails";
    addcartcheckint=2;
    [self openCartPage];
    
}

-(void)openCartPage{
    NSLog(@"openCartPage entred click");
    CartVC *cvclocal = [[CartVC alloc]init];
    [self presentViewController:cvclocal animated:YES completion:nil];
    
}

- (IBAction)buyClick:(id)sender {
    quantity_str=@"1";
    addcartcheckint=2;
    [self addtocartClick:sender];
    [self performSelector:@selector(openCartPage) withObject:nil afterDelay:1.0];
}

- (IBAction)drop_down_click_user:(id)sender{
    
    UIButton*tappedButton =  (UIButton*)sender;
    NSLog(@"drop_down_click_user:%ld",(long)tappedButton.tag);
    NSLog(@"pageIdentify_str Productdetails:%@",pageIdentify_str);
    
    if ([pageIdentify_str isEqualToString:@"ProductsViewController"]||[pageIdentify_str isEqualToString:@"ProductDetails"]) {
        [self leftMenuHomeClick:nil];
    }else if ([pageIdentify_str isEqualToString:@"CategoryProductsView"]) {
        CategoryProductsView *cpv = [[CategoryProductsView alloc]init];
        [self presentViewController:cpv animated:YES completion:nil];
        
    }else if ([pageIdentify_str isEqualToString:@"SearchVC"]) {
        
        SearchVC *svc = [[SearchVC alloc]init];
        [self presentViewController:svc animated:YES completion:nil];
        
    }else if ([pageIdentify_str isEqualToString:@"OrderVC"]) {
        
        OrderVC *ovc = [[OrderVC alloc]init];
        [self presentViewController:ovc animated:YES completion:nil];
        
    }else if ([pageIdentify_str isEqualToString:@"CartVC"]) {
        
        CartVC *cvcl = [[CartVC alloc]init];
        [self presentViewController:cvcl animated:YES completion:nil];
        
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
-(void)login{
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:lvc animated:NO];
}

-(void)logOut{
    NSLog(@"Logout form cart");
    ProductsViewController *pcvout = [[ProductsViewController alloc]init];
    [pcvout logOut];
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
    CategoriesViewController*cvclocal = [[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:cvclocal animated:NO];
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

- (IBAction)searchBtnClick:(id)sender {
    pageIdentify_str=@"ProductDetails";
    SearchVC*svc = [[SearchVC alloc]init];
    [self presentViewController:svc animated:YES completion:nil];
}


-(void)getCartCountValue{
    
    // [self performSelectorInBackground:@selector(countOfCartItems) withObject:nil];
     self.cartitemscount_btn.hidden=NO;
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
    [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}






@end
