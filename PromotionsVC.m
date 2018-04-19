//
//  PromotionsVC.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 27/02/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import "PromotionsVC.h"
#import "ContactUsVC.h"
#import "AppDelegate.h"
#import "CategoryProductsView.h"
#import "ProductsViewController.h"
#import "LoginViewController.h"
#import "MyAccountView.h"
#import "CategoriesViewController.h"
#import "DeintistkartInfoVC.h"
#import "MBProgressHUD.h"
#import "SearchVC.h"
#import "ProductDetails.h"

@interface PromotionsVC ()

@end

@implementation PromotionsVC
@synthesize left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro,left_menu_brand_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    global_page_id=@"ContactUsVC";
    
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
        
       // self.cartitemscount_btn.hidden=NO;
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
    
    
    
    self.promotions_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/12];
    
    ///////////////////ScrollProduct ////////////////////////////////
    self.promotion_scrol_view.scrollEnabled=YES;
    self.promotion_scrol_view.userInteractionEnabled=YES;
    self.promotion_scrol_view.pagingEnabled = YES;
    self.promotion_scrol_view.showsHorizontalScrollIndicator = NO;
    self.promotion_scrol_view.showsVerticalScrollIndicator = NO;
    self.promotion_scrol_view.scrollsToTop = NO;
    ////////////////////////////////////////////////////////////////
    self.promotion_scrol_view.delegate = self;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";

    [self performSelector:@selector(promotionsServiceCall) withObject:nil afterDelay:0.0];
    
    
    
}

-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

-(void)promotionsServiceCall{
    
        
        NSString *str_country = [NSString stringWithFormat:@"https://dentistkart.com/webservice/promotions/"];
        
        NSLog(@"str_promotions:%@",str_country);
        
        NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country]];
        
        NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
        
        NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
        
        NSLog(@"returnString:*%@*",returnString);
        
        
        // NSDictionary *dict=[returnString JSONValue];
        NSError *jsonError;
        // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                             options:kNilOptions
                                                               error:&jsonError];
        NSLog(@"Dict value:%@",dict);
        
        if (dict==nil||dict==NULL)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        
        
        else {
            
            NSDictionary *create_result_dict;
            NSString *statuscode;
            NSString *message;
            
            statuscode = [dict objectForKey:@"statuscode"];
            message = [dict objectForKey:@"message"];
            NSLog(@"info:%@",[dict objectForKey:@"createResult"]);
            int status = [statuscode intValue];
            int countRow=0;
            if (status==1&&[message isEqualToString:@"Authentication Success."]){
                
                create_result_dict = [dict objectForKey:@"createResult"];
                NSDictionary*promotionsImgsDict = [create_result_dict objectForKey:@"promotionImages"];
                float heightOfScroll;
                NSLog(@"promotionsImgsDict:%@",promotionsImgsDict);
                for (NSDictionary*loaldict in promotionsImgsDict) {
                    
                    UIImageView *newImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8,8+([self screenSize].width/2)*countRow,[self screenSize].width-16, ([self screenSize].width/2)-16)];
                    
                    NSLog(@"screen width:%f",[self screenSize].width);
                    //UIImageView *newImageView = [[UIImageView alloc]initWithFrame:CGRectMake(8,20+([self screenSize].height/4)* countRow, [self screenSize].width,([self screenSize].width/2)-10)];
                    
                  //  UIImageView *newImageView = [[UIImageView alloc]initWithFrame:CGRectMake(8,20+([self screenSize].height/4)* countRow, 768.00,400)];
                    //[newImageView setBackgroundColor:[UIColor redColor]];
                    
                    newImageView.translatesAutoresizingMaskIntoConstraints=YES;
                    //newPageView.translatesAutoresizingMaskIntoConstraints=NO;
                    //NSLog(@"imageURL check:%@",[sliderimgs_arr objectAtIndex:j]);
                    //NSString*imgstr = [[NSString alloc]initWithString:@"https://www.dentistkart.com/webservice/sliderimages/img/image1.jpg"];
                    NSString*imgstr = [[NSString alloc]initWithFormat:@"%@",[loaldict objectForKey:@"image"]];
                    NSLog(@"imgstr:%@",imgstr);
                    
                    
                    
                    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imgstr]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                        newImageView.image = [UIImage imageWithData:data];
                        // NSLog(@"image ids:%@",[sliderimgIds_arr objectAtIndex:page]);
                        [newImageView setTag:[[loaldict objectForKey:@"productid"]intValue]];
                        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
                        //singleTap.numberOfTapsRequired = 1;
                        [newImageView setUserInteractionEnabled:YES];
                        [newImageView addGestureRecognizer:singleTap];
                        
                    }];
                    [self.promotion_scrol_view addSubview:newImageView];
                    
                    NSLayoutConstraint*leftimgconstr = [NSLayoutConstraint constraintWithItem:self.promotion_scrol_view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:newImageView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:8];
                    NSLayoutConstraint*rightimgconstr = [NSLayoutConstraint constraintWithItem:self.promotion_scrol_view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:newImageView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:8];
                    [self.promotion_scrol_view addConstraints:@[leftimgconstr,rightimgconstr]];

                    
                    
                    
                    
                    //[promotions_imgs_arr addObject:[imagedict objectForKey:@"image"]];
                    //[promotions_ids_arr addObject:[imageidsdict objectForKey:@"id"]];
                    
                   heightOfScroll= 15+([self screenSize].width/2)*countRow+[self screenSize].width/2;
                    
                    countRow++;
                }
                
                
                [self.promotion_scrol_view setContentSize:CGSizeMake([self screenSize].width,heightOfScroll)];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                
                NSLog(@"status 1 looo:%@",create_result_dict);
                
            }else if (status==2&&([message isEqualToString:@"Email and Password Authentication Error."]||[message isEqualToString:@"This customer email already exists"])){
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                //[self checkUserUpdated];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////


-(void)tapDetected:(UITapGestureRecognizer *)gestureRecognizer{
    NSLog(@"single Tap on imageview:%@",gestureRecognizer);
    UIImageView*imageview =(UIImageView*)gestureRecognizer.view;
    NSLog(@"imageview check:%@",imageview);
    int idvalue = (int)imageview.tag;
    NSLog(@"idValue:%d",idvalue);
   /*
    NSLog(@"sliderimgsIds values:%@",sliderimgIds_arr);
    idvalue= [[sliderimgIds_arr objectAtIndex:idvalue]intValue];
    NSLog(@"idValue second:%d",idvalue);
    */
    global_product_id=idvalue;
   
    ProductDetails*prddetails = [[ProductDetails alloc]init];
    [self presentViewController:prddetails animated:YES completion:nil];
    
    //[prddetails getProductsDetails:idvalue];
    
    
}



- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"rotated enter");
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    // [self loadVisiblePages];
    
     NSArray*arrpromotion_scrol_view = [self.promotion_scrol_view subviews];
     
     for (UIView*view in arrpromotion_scrol_view) {
     [view removeFromSuperview];
     }
     
    
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
            //[self leftMenuPromotionClick:nil];
            [self viewDidLoad];
            
        }else{
            //self.heightCon.constant = 350;
            [self viewDidLoad];
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
    [pvc release];
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
    //[self callDentistKartInfo];
    ContactUsVC * cuvc = [[ContactUsVC alloc]init];
    [self presentViewController:cuvc animated:YES completion:nil];
}

-(void)callDentistKartInfo{
    
    DeintistkartInfoVC *hpi = [[DeintistkartInfoVC alloc]init];
    [self.navigationController pushViewController:hpi animated:NO];
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
     pageIdentify_str=@"PromotionsVC";
    addcartcheckint=2;
    [self openCartPage];
}

-(void)openCartPage{
    
    CartVC *cvclocal = [[CartVC alloc]init];
    [self presentViewController:cvclocal animated:YES completion:nil];
    
}
- (IBAction)searchBtnClick:(id)sender {
    pageIdentify_str=@"PromotionsVC";
    SearchVC*svc = [[SearchVC alloc]init];
    [self presentViewController:svc animated:YES completion:nil];
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
    [_promotion_scrol_view release];
    [_promotions_lbl release];
    [super dealloc];
}
@end
