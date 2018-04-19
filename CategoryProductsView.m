//
//  CategoryProductsView.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 19/10/15.
//  Copyright © 2015 Google Inc. All rights reserved.
//

#import "CategoryProductsView.h"
#import "MBProgressHUD.h"
#import "ProductTblCell.h"

#import "AppDelegate.h"
#import "ProductDetails.h"
#import "CategoriesViewController.h"
#import "ProductsViewController.h"
#import "LoginViewController.h"

#import "MyAccountView.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "SearchVC.h"
#import "URLImageView.h"
#if (IPHONE_OS_VERSION_MIN_REQUIRED >= IPHONE_6_0)
# define ALIGN_CENTER NSTextAlignmentCenter
#else
# define ALIGN_CENTER UITextAlignmentCenter
#endif
//#import "MNMBottomPullToRefreshManager.h"
@interface CategoryProductsView ()

@end

@implementation CategoryProductsView
@synthesize tableView,left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro,left_menu_brand_btn;


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
  //[self loadTable];
}

//////////////////////////Pull To Refresh tableview//////////////////////////////

#pragma mark -
#pragma mark Aux view methods

/*
 * Loads the table
 */
/*
- (void)loadTable {
    
    //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //hud.labelText = @"Loading....";
    
    
    NSLog(@"reload loadtable:%d",reloads_);
    NSLog(@"countRow loadtable:%d",countRow);
    if (((product_id_arr.count-countRow)<10) && (countRow<product_id_arr.count)) {
        NSLog(@"entred into last products");
       // countRow=(int)product_id_arr.count;
        if (countRow==product_id_arr.count) {
            NSLog(@"if if loadtable");
        }else if(scrolloff==0){
        [self lastRemainedProducts];
        [self.tableView reloadData];
        
        //scrolloff=0;
        [pullToRefreshManager_ tableViewReloadFinished];
        countRow=(int)product_id_arr.count;
        NSLog(@"countrow check:%d",countRow);
            endoftheproducts=@"end";
        }

        //[pullToRefreshManager_ tableViewReleased];
    }else if(scrolloff==0){
        if (countRow==product_id_arr.count) {
            NSLog(@"else if loadtable");
            //endoftheproducts=@"end";
            
        }else{
         
    reloads_++;
   for (int val=countRow; val<(countRow*2); val++) {
       NSLog(@"val:%d",val);
        //endofrow=val;
        [self getListOfProductsDetails:[product_id_arr objectAtIndex:val]];
       
    }
            [self.tableView reloadData];
        }
        
        //scrolloff=0;
        [pullToRefreshManager_ tableViewReloadFinished];
    }else{
        NSLog(@"end point");
    endoftheproducts=@"end";
    }
    [pullToRefreshManager_ tableViewReloadFinished];
    
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
  [pullToRefreshManager_ relocatePullToRefreshView];
}
*/

////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    endoftheproducts=@"run";
    global_page_id=@"CategoryProductsView";
    ///////////////////////Side Menu///////////////////////
    //leftmenulist_view.frame = CGRectMake(0, 0, 200, 600);
    leftmenulist_view.frame = CGRectMake(0, 50, ([self screenSize].width/2)+[self screenSize].width/3, [self screenSize].height-50);

    [self.view addSubview:leftmenulist_view];
    
    left_menu_profile_img.layer.cornerRadius=10;
    left_menu_profile_img.clipsToBounds=YES;
    countRow=0;
    leftmenulist_view.hidden=YES;

            cvc = [[CartVC alloc]init];
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
    self.activityindicatorroll.hidden=YES;
    //[self.tableView addSubview:self.activityindicatorroll];
    self.dentistkartname_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/12];
   [self.activityindicatorroll stopAnimating];
    
    //self.loaderview_display.hidden=YES;
    //self.tableView.tableFooterView = self.loaderview_display;
    
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

    product_id_arr = [[NSMutableArray alloc]init];
    product_name_arr  = [[NSMutableArray alloc]init];
    product_short_arr  = [[NSMutableArray alloc]init];
    product_desc_arr  = [[NSMutableArray alloc]init];
    product_image_arr  = [[NSMutableArray alloc]init];
    product_price_arr  = [[NSMutableArray alloc]init];
    tempproduct_id_arr = [[NSMutableArray alloc]init];
    product_available_arr = [[NSMutableArray alloc]init];
    product_special_price_arr = [[NSMutableArray alloc]init];
    
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
    
    //pageIdentify_str = @"CategoriesViewController";
    
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    
    
    
    //pullToRefreshManager_ = [[MNMBottomPullToRefreshManager alloc] initWithPullToRefreshViewHeight:60.0f tableView:self.tableView withClient:self];
    tableView.delegate=self;
    //reloads_ = 0;
   
    //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //hud.labelText = @"Loading....";
    /*
    if ([pageIdentify_str isEqualToString:@"CategoriesViewController"]) {
        pageIdentify_str=@"";
    }
     */
    
    if (switchpage==1) {
       pageIdentify_str = @"ProductsViewController";
    }else if (switchpage==2){
    
        pageIdentify_str = @"CategoriesViewController";
    }
    //pageIdentify_str=@"";
  //  [self performSelector:@selector(callListOfProducts) withObject:nil afterDelay:0.1];
    
    
    scrollon=2;
    [self loadMoreView];
    if([global_clicked_more isEqualToString:@"latest"] || [global_clicked_more isEqualToString:@"recent"]){
      //  [self latestHomeProducts];
        NSLog(@"latest clikl");
        [self performSelector:@selector(latestHomeProducts) withObject:nil afterDelay:0.1];
    }else{
        [self performSelector:@selector(callCategoriesProducts) withObject:nil afterDelay:0.1];
    }
    
    
    
    
}




-(void)callCategoriesProducts{
 [self getCategoreyProducts:0];

}

-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}


/*
-(void)callListOfProducts{
    
    
    if ([global_clicked_more isEqualToString:@"Clicked"]) {
        NSLog(@"Clicked");
        product_id_arr = [[NSMutableArray alloc]initWithArray:global_productid_arr];
       // for (int i=0; i<product_id_arr.count; i++) {
 
        if (product_id_arr.count==0) {
            
        }else{
            for (int i=0; i<product_id_arr.count; i++){
                if (product_id_arr.count<10) {
                    NSLog(@"entred in below 10");
                    scrolloff=1;
                    // reloads_=-1;
                    NSLog(@"scrolloff below:%d",scrolloff);
                    [self getListOfProductsDetails:[product_id_arr objectAtIndex:i]];
                }else if((i<10)&&(product_id_arr.count>10)){
                    [self getListOfProductsDetails:[product_id_arr objectAtIndex:i]];
                }
                
            }
            
        }
        
        
        //[global_productid_arr removeAllObjects];
    }else{
        NSLog(@"Not Clicked");
        global_clicked_more=@"NotClicked";
        [self getListOfProducts];
    }
    
    [tableView reloadData];
    
}
*/
-(void)callMyAccountPage{
    MyAccountView*mmyacct = [[MyAccountView alloc]init];
    [self presentViewController:mmyacct animated:YES completion:nil];
}
/*
-(void)getListOfProducts{
    
    NSString *str_getlistCategoryProducts;
    
    str_getlistCategoryProducts = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/product/iOS/?type=categoryProduct&category_id=%@",child_catid_str];
    
    NSLog(@"str_getlistCategoryProducts:%@",str_getlistCategoryProducts);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_getlistCategoryProducts]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    NSError *jsonError;
    // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    NSLog(@"dict:%@",dict);
    
    if (dict==nil||dict==NULL){
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }else {
        NSDictionary*creat_result_dict;
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
            
            NSArray*arry_list = [dict objectForKey:@"createResult"];
            
            
            //for (int i=0; i<arry_list.count; i++) {
            
            if (arry_list.count==0) {
                
            }else{
            for (int i=0; i<arry_list.count; i++){
                creat_result_dict = [arry_list objectAtIndex:i];
                
                NSString  *product_id_str=[creat_result_dict objectForKey:@"product_id"];
                NSLog(@"product_id_str mani:%@",product_id_str);
                [product_id_arr addObject:product_id_str];
                if (arry_list.count<10) {
                    NSLog(@"entred in below 10");
                    scrolloff=1;
                   // reloads_=-1;
                    NSLog(@"scrolloff below:%d",scrolloff);
                    [self getListOfProductsDetails:[product_id_arr objectAtIndex:i]];
                }else if((i<10)&&(arry_list.count>10)){
                [self getListOfProductsDetails:[product_id_arr objectAtIndex:i]];
                }
                
                }
                
            }
            
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }
}



*/


/*
-(void)getListOfProductsDetails:(NSString*)id_str{
    
    
    NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/product/iOS/?type=product&product_id=%@",
                             id_str];
    
    NSLog(@"getListOfProductsDetails:%@",str_country);
    
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
            
            NSMutableArray * jsoninarr;
            
            jsoninarr = [[NSMutableArray alloc]initWithArray:[dict objectForKey:@"createResult"]];
            NSLog(@"jsoninarr:%@",jsoninarr);
            NSDictionary*createresultdict = [jsoninarr objectAtIndex:0];
            NSLog(@"details:%@",[createresultdict objectForKey:@"image"]);
            NSDictionary*dictprodname  = [createresultdict objectForKey:@"details"];
            
            NSString*product_id_str = [dictprodname objectForKey:@"product_id"];
            NSLog(@"product id:%@",product_id_str);
            //[product_id_arr addObject:product_id_str];
            [tempproduct_id_arr addObject:product_id_str];
            NSString*product_name_str = [dictprodname objectForKey:@"name"];
            
            if ([product_name_str isEqualToString:@""]||[product_name_str isEqualToString:@"<null>"]||[product_name_str isEqualToString:@"null"]||[product_name_str isEqualToString:@"(null)"]||product_name_str ==nil||product_name_str==NULL)
            {
                product_name_str=@"Not Available";
            }
            NSLog(@"product name:%@",product_name_str);
            [product_name_arr addObject:product_name_str];
            
            NSString*product_desc_str = [dictprodname objectForKey:@"description"];
            
            if ([product_desc_str isEqualToString:@""]||[product_desc_str isEqualToString:@"<null>"]||[product_desc_str isEqualToString:@"null"]||[product_desc_str isEqualToString:@"(null)"]||product_desc_str ==nil||product_desc_str==NULL)
            {
                product_desc_str=@"Not Available";
            }
            NSLog(@"product_desc_str:%@",product_desc_str);
            [product_desc_arr addObject:product_desc_str];
            
            
            
            NSString*product_short_str = [dictprodname objectForKey:@"short_description"];
            
            if ([product_short_str isEqualToString:@""]||[product_short_str isEqualToString:@"<null>"]||[product_short_str isEqualToString:@"null"]||[product_short_str isEqualToString:@"(null)"]||product_short_str ==nil||product_short_str==NULL)
            {
                product_short_str=@"Not Available";
            }
            NSLog(@"product_short_str:%@",product_short_str);
            [product_short_arr addObject:product_short_str];
            
 
            NSString*available_stock_check;
            if ([[createresultdict objectForKey:@"prod_available"] intValue]>0) {
                
                
                NSString*avialable_stock_str = [createresultdict objectForKey:@"prod_available"];
                
                                available_stock_check=@"In Stock";
                prodavailability_glb_str = [NSString stringWithFormat:@"%@ %@",avialable_stock_str,available_stock_check];
                
                
            }else{
                available_stock_check=@"Out of Stock";
                prodavailability_glb_str = [NSString stringWithFormat:@"%@",available_stock_check];
                
            }
            
            [product_available_arr addObject:prodavailability_glb_str];
            
            
            
            NSString*product_price_str = [dictprodname objectForKey:@"price"];
            
            if ([product_price_str isEqualToString:@""]||[product_price_str isEqualToString:@"<null>"]||[product_price_str isEqualToString:@"null"]||[product_price_str isEqualToString:@"(null)"]||product_price_str ==nil||product_price_str==NULL)
            {
                product_price_str=@"Not Avialable";
            }
            NSLog(@"product_price_str:%@",product_price_str);
            [product_price_arr addObject:product_price_str];
            
            
            NSString*product_sprice_str = [dictprodname objectForKey:@"special_price"];
            
            if ([product_sprice_str isEqualToString:@""]||[product_sprice_str isEqualToString:@"<null>"]||[product_sprice_str isEqualToString:@"null"]||[product_sprice_str isEqualToString:@"(null)"]||product_sprice_str ==nil||product_sprice_str==NULL)
            {
                product_sprice_str=@"";
            }
            NSLog(@"product_sprice_str:%@",product_sprice_str);
            [product_special_price_arr addObject:product_sprice_str];
            
            
            
            NSMutableArray*arr = [createresultdict objectForKey:@"image"];
            NSDictionary*imgdict = [arr objectAtIndex:0];
            NSLog(@"imageurlpath:%@",[imgdict objectForKey:@"url"]);
            
            
            NSString*url = [imgdict objectForKey:@"url"];
            
            if ([url isEqualToString:@""]||[url isEqualToString:@"<null>"]||[url isEqualToString:@"null"]||[url isEqualToString:@"(null)"]||url ==nil||url==NULL)
            {
                url=@"Not Avialable";
            }
            [product_image_arr addObject:url];
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }

}
 */
/*
// Somewhere in your implementation file:
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"Will begin dragging");
    if (scrollView==self.tableView) {
        NSLog(@"Table scroll begin");
    }
   
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"Did Scroll");
    
    if (scrollView==self.tableView) {
        
        NSLog(@"Table did scroll begin");
        
        for (int index=countRow; index<(countRow+10); index++) {
            [self getListOfProductsDetails:[product_id_arr objectAtIndex:index]];
        }
        
        [self.tableView reloadData];

    }
    

}
*/

/*

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"Did Scroll");
    
    if ([global_clicked_more isEqualToString:@"latest"]||[global_clicked_more isEqualToString:@"recent"]) {
        
    }else{
        NSLog(@"countRow in scrollViewDidEndDragging:%d",countRow);
        
        NSLog(@"[product_id_arr count]:%lu",(unsigned long)[[product_id_arr objectAtIndex:([product_id_arr count]-1)]intValue]);
        if ((countRow)==[[product_id_arr objectAtIndex:([product_id_arr count]-1)]intValue]) {
            // countRow++;
            // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            //hud.labelText = @"Loading....";
            
            self.activityindicatorroll.hidden=NO;
            //self.loaderview_display.hidden=NO;
            NSLog(@"countRow:%d",countRow);
            //[self.activityindicatorroll startAnimating];
           
            NSLog(@"reloads else:%d",reloads_);
            
            //scrollon=2;
            //[self.tableView reloadData];
            reloads_++;
            [self getCategoreyProducts:reloads_*10];

        }else{
            //countRow=0;
            
        }
    }
    
    
}
 */
/*
-(void)callServiceScroll{
 reloads_++;
[self getCategoreyProducts:reloads_*10];

}
 */
/*

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scroll end dragging");
    //[MBProgressHUD hideHUDForView:self.view animated:YES];
    
    // [pullToRefreshManager_ tableViewReleased];
    
   // scrollon=0;
   
    if ([global_clicked_more isEqualToString:@"latest"]||[global_clicked_more isEqualToString:@"recent"]) {
        
    }else{
    NSLog(@"countRow in scrollViewDidEndDragging:%d",countRow);
        
    NSLog(@"[product_id_arr count]:%lu",(unsigned long)[[product_id_arr objectAtIndex:([product_id_arr count]-1)]intValue]);
    if ((countRow)==[[product_id_arr objectAtIndex:([product_id_arr count]-1)]intValue]) {
       // countRow++;
       // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        //hud.labelText = @"Loading....";
        
       self.activityindicatorroll.hidden=NO;
        //self.loaderview_display.hidden=NO;
        NSLog(@"countRow:%d",countRow);
        //[self.activityindicatorroll startAnimating];
        reloads_++;
        NSLog(@"reloads else:%d",reloads_);
        
        //scrollon=2;
        //[self.tableView reloadData];
        [self getCategoreyProducts:reloads_*10];
        //[self.activityindicatorroll stopAnimating];
        //self.activityindicatorroll.hidden=YES;
    }else{
        //countRow=0;
        
    }
    }
}
*/


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"Did Scroll end dragging....");
    if ([global_clicked_more isEqualToString:@"latest"]||[global_clicked_more isEqualToString:@"recent"]) {
        
    }else{
        NSLog(@"countRow in scrollViewDidEndDragging:%d",countRow);
        
        NSLog(@"[product_id_arr count]:%lu",(unsigned long)[[product_id_arr objectAtIndex:([product_id_arr count]-1)]intValue]);
        if ((countRow)==[[product_id_arr objectAtIndex:([product_id_arr count]-1)]intValue]) {
            // countRow++;
            // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            //hud.labelText = @"Loading....";
            if (scrollon==0) {
                
                
                [self loadMoreView];
               // self.activityLoader.hidden = NO;
                //[self.activityLoader startAnimating];
                self.activityindicatorroll.hidden=NO;
                //self.loaderview_display.hidden=NO;
                NSLog(@"countRow:%d",countRow);
                //[self.activityindicatorroll startAnimating];
                
                NSLog(@"reloads else:%d",reloads_);
                
                //scrollon=2;
                //[self.tableView reloadData];
                //reloads_++;
                //[self getCategoreyProducts:reloads_*10];
                //[self performSelectorInBackground:@selector(callNextProducts) withObject:nil];
                //[self performSelectorOnMainThread:@selector(callNextProducts) withObject:nil waitUntilDone:YES];
                [self performSelector:@selector(callNextProducts) withObject:nil afterDelay:0.5];
            }else{
                NSLog(@"else scroll end dragging.......:%d",scrollon);
            }
            
        }else{
            //countRow=0;
            
        }
    }
}

-(void)callNextProducts{
        reloads_++;
        [self getCategoreyProducts:reloads_*10];
}


-(void)loadMoreView{
    NSLog(@"entred in load more");
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    hud.labelText = @"Loading....";
    
}

///////////////////////////////TableView delegate methods///////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"count username:%ld",(long)tempproduct_id_arr.count);
 /*
    
    if (10 + (10 * reloads_)==[tempproduct_id_arr count]) {
        countRow = 10 + (10 * reloads_);
        NSLog(@"countRow in numberOfRowsInSection:%d",countRow);
    return [tempproduct_id_arr count];
    }else if ([tempproduct_id_arr count]<10 + (10 * reloads_)){
    return [tempproduct_id_arr count];
    }else if ([tempproduct_id_arr count]>10 + (10 * reloads_)){
        countRow = 10 + (10 * reloads_);
    return [tempproduct_id_arr count];
    }
  */
    /*
    if ((10 + (10 * reloads_)<=[product_id_arr count]) || (tempproduct_id_arr.count<10)) {
        countRow = 10 + (10 * reloads_);
        NSLog(@"countRow in numberOfRowsInSection:%d",countRow);
        return [tempproduct_id_arr count];
    }
    */
    //return 5 + (5 * reloads_);
    
    
    //return [tempproduct_id_arr count];
    //return nil;
    
    return [product_id_arr count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @try {
        
    
    NSLog(@"cellforrow");
    ProductTblCell * pcell;
    
    static NSString *cellIdentifier1 = @"cellIdentifier1";
    pcell = (ProductTblCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier1];
    
    if (pcell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProductTblCell"
                                                     owner:self options:nil];
        for (id oneObject in nib) if ([oneObject isKindOfClass:[ProductTblCell class]])
            pcell = (ProductTblCell *)oneObject;
    }
    pcell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSString *product_img_str=[[NSString alloc]initWithFormat:@"%@",[product_image_arr objectAtIndex:[indexPath row]]];
    
        countRow=[[product_id_arr objectAtIndex:indexPath.row]intValue];
        NSLog(@"countRow in cell:%d",countRow);
    NSLog(@"Product Image Check:%@",product_img_str);
    // pcell.user_name.text =product_img_str;
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:product_img_str]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        pcell.product_img.image = [UIImage imageWithData:data];
    }];
    product_img_str=nil;
    
    /*
    URLImageView *iconbtn = [[URLImageView alloc] initWithFrame:CGRectMake(10, 10, pcell.cellfirstview.frame.size.width-20, pcell.cellfirstview.frame.size.height-20)];
    [iconbtn startLoading:product_img_str];
    [pcell.cellfirstview addSubview:iconbtn];
    */
    NSString *name_str=[[NSString alloc]initWithFormat:@"%@",[product_name_arr objectAtIndex:[indexPath row]]];
    pcell.product_name.text = name_str;
    pcell.product_name.font = [UIFont systemFontOfSize:[self screenSize].width/40];
   pcell.product_name.lineBreakMode = NSLineBreakByWordWrapping;
    pcell.product_name.numberOfLines=0;

        
    name_str=nil;
   NSString *price_str=[[NSString alloc]initWithFormat:@"Rs.%.2f",[[product_price_arr objectAtIndex:[indexPath row]] doubleValue]];
    
    NSString*sppricestr = [[NSString alloc]initWithFormat:@"(Rs.%.2f)",[[product_special_price_arr objectAtIndex:indexPath.row] doubleValue]];
    
    if ([sppricestr isEqualToString:@"(Rs.0.00)"]) {
        
        NSLog(@"enter in if Rs.0.00");
        pcell.product_price.text = price_str;
        pcell.product_price.font = [UIFont systemFontOfSize:[self screenSize].width/40];
        pcell.specialprice_lbl.text=@"";
        
    }else{
        
        NSString *price_else_str=[[NSString alloc]initWithFormat:@"(Rs.%.2f)",[[product_price_arr objectAtIndex:[indexPath row]] doubleValue]];
        NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:price_else_str];
        
        
        // making text property to strike text- NSStrikethroughStyleAttributeName
        [titleString addAttribute: NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range: NSMakeRange(0, [titleString length])];
        
        
        pcell.product_price.text = [[NSString alloc]initWithFormat:@"Rs.%.2f",[[product_special_price_arr objectAtIndex:indexPath.row] doubleValue]];
        pcell.product_price.font = [UIFont systemFontOfSize:[self screenSize].width/40];
        
        
        [pcell.specialprice_lbl setAttributedText:titleString];
        
        pcell.specialprice_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/40];
        price_else_str=nil;
        titleString=nil;
        
    }
    price_str=nil;
    sppricestr=nil;
    
    
    
    
    pcell.addcart_btn.tag = indexPath.row;
    
    NSString*product_desc_str = [[NSString alloc]initWithFormat:@"%@",[product_short_arr objectAtIndex:[indexPath row]]];
    pcell.productdesc_txtview.editable=NO;
    [pcell.productdesc_txtview setValue:product_desc_str forKey:@"contentToHTMLString"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedCellViewTapped:)];
    [pcell.productdesc_txtview addGestureRecognizer:tap];
    [pcell.productdesc_txtview setTag:indexPath.row];
    pcell.productdesc_txtview.font = [UIFont systemFontOfSize:[self screenSize].width/45];
    pcell.product_desc_title.font = [UIFont systemFontOfSize:[self screenSize].width/40];
   // pcell.stock_data.text = prodavailability_glb_str;
    
    product_desc_str=nil;
    // pcell.stock_data.text = [product_available_arr objectAtIndex:indexPath.row];
    pcell.stock_data.text=@"";
    
    //pcell.productdesc_txtview.text = product_desc_str;
    
    //    pcell.qtytxtfeild.text
    
    
    // NSLog(@"text Value:%@",pcell.qtytxtfeild.text);
    
    
   
    
    //UIButton *repeateBtn = [[UIButton alloc]initWithFrame:CGRectMake(190, 55, 30, 30)];
   // UIButton *repeateBtn = [[UIButton alloc]initWithFrame:CGRectMake(pcell.product_price.frame.origin.x,pcell.product_price.frame.origin.y+pcell.product_price.frame.size.height+5, [self screenSize].width/4,30)];
        
        /*
    UIButton *repeateBtn;
    if ([self screenSize].width<500) {
        repeateBtn = [[UIButton alloc]initWithFrame:CGRectMake(pcell.product_price.frame.origin.x,([self screenSize].width/4), [self screenSize].width/4,20)];
    
    }else{
    repeateBtn = [[UIButton alloc]initWithFrame:CGRectMake(pcell.product_price.frame.origin.x,([self screenSize].height/4)-45, [self screenSize].width/4,35)];
    }
   */
        
        
   // [repeateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   // repeateBtn.titleLabel.font = [UIFont fontWithName:@"Santor" size:[self screenSize].width/30];
     pcell.addtocart_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    //repeateBtn.titleLabel.text = @"Add Cart";
    //[repeateBtn setTitle:@"Add to cart" forState:UIControlStateNormal];
    
    //[repeateBtn setBackgroundColor:[UIColor blueColor]];
    //repeateBtn.titleLabel.text = @"Add to Cart";
    //repeateBtn.titleLabel.textColor=[[UIColor alloc]initWithWhite:1.0f alpha:1.0f];
    // [repeateBtn setTitle:@"Add Cart" forState:UIControlStateNormal];
   // [repeateBtn setImage:[UIImage imageNamed:@"CartButtonBlue"] forState:UIControlStateNormal];
    //repeateBtn.titleLabel.textColor = [UIColor whiteColor];
    NSLog(@"product_available_arr:%@",product_available_arr);
    if ([[product_available_arr objectAtIndex:indexPath.row] isEqual:@"Out of Stock"]) {
        NSLog(@"entred in out of stock");
        pcell.addtocart_btn.enabled=NO;
         [pcell.addtocart_btn setBackgroundColor:[UIColor colorWithRed:79/255.0 green:194/255.0 blue:234/255.0 alpha:0.5]];
       // repeateBtn.alpha=0.5;

    }else{
        NSLog(@"entred in stock");
        pcell.addtocart_btn.enabled=YES;
        NSLog(@"1");
        //repeateBtn.alpha=1.0;
        [pcell.addtocart_btn setBackgroundColor:[UIColor colorWithRed:79/255.0 green:194/255.0 blue:234/255.0 alpha:1.0]];
        NSLog(@"2");
    }
    NSLog(@"3");
    
    pcell.addtocart_btn.tag = [[product_id_arr objectAtIndex:indexPath.row] integerValue];
        NSLog(@"4");
    //repeateBtn.layer.borderWidth=1.0;
    //repeateBtn.layer.cornerRadius=2.0;
    //repeateBtn.layer.borderColor = [UIColor clearColor].CGColor;
        NSLog(@"5");
    [pcell.addtocart_btn addTarget:self action:@selector(addToCartPage:) forControlEvents:UIControlEventTouchUpInside];
        NSLog(@"6");
    //[pcell.cellsecondview addSubview:repeateBtn];
    //pcell.addtocart_btn=nil;
   // countRow++;
    
    // countRow = countRow + 1;
    endofrow= (int)indexPath.row;
        //scrollon=1;
        
    
    return pcell;
    }
    @catch (NSException *exception) {
        
        scrollon=1;
        NSLog(@"exception cell:%@",exception);
    }
    @finally {
        [self.activityindicatorroll stopAnimating];
        self.activityindicatorroll.hidden=YES;
        NSLog(@"final");
    }
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    pageIdentify_str = @"CategoryProductsView";
    NSLog(@"didselect");
    prodimages_glb_arr=nil;
    
   // prodid_global_str = [[NSString alloc]initWithFormat:@"%@",[product_id_arr objectAtIndex:[indexPath row]]];
    NSLog(@"indexPath:%ld",(long)indexPath.row);
    global_product_id = [[product_id_arr objectAtIndex:[indexPath row]] intValue];
    NSLog(@"product_id_arr:%@",product_id_arr);
    NSLog(@"global_product:%d",global_product_id);
    
    
    /*
    prodname_glb_str =[[NSString alloc]initWithFormat:@"%@",[product_name_arr objectAtIndex:[indexPath row]]];
    
    prodprice_glb_str = [[NSString alloc]initWithFormat:@"$%@",[product_price_arr objectAtIndex:[indexPath row]]];
    
    
    prodimages_glb_arr = [[NSMutableArray alloc]init];
    
    [prodimages_glb_arr addObject:[product_image_arr objectAtIndex:indexPath.row]];
    
    prodavailability_glb_str=@"Avialble in stock";
    
    prodshort_glb_str = [[NSString alloc]initWithFormat:@"%@",[product_short_arr objectAtIndex:indexPath.row]];
    
    prodlongdesc_glb_str = [[NSString alloc]initWithFormat:@"%@",[product_desc_arr objectAtIndex:[indexPath row]]];
    */
    
   [self loadProductDetailsView];
}

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
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //}
    //self.tableView.tableFooterView = self.loaderview_display;
   // [self.activityindicatorroll startAnimating];

    return 0.00f;
}

/*
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    NSLog(@"viewForFooterInSection");
    NSLog(@"scrollon value:%d",scrollon);
    
    if([global_clicked_more isEqualToString:@"latest"] || [global_clicked_more isEqualToString:@"recent"]){
    
        self.activityindicatorroll.hidden=YES;
        return self.activityindicatorroll;
    
    }else{
        if (scrollon==1) {
            NSLog(@"scroll entred");
           self.activityindicatorroll.hidden=YES;
            
            UILabel*end_lbl = [[UILabel alloc]init];
            end_lbl.text=@"end of products";
            return end_lbl;
        }else if(scrollon==2){
    //if (scrollon==1) {
        NSLog(@"scrollon value if:%d",scrollon);
    self.activityindicatorroll = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.activityindicatorroll startAnimating];
    //self.activityindicatorroll.hidden=NO;
        return self.activityindicatorroll;
        }
        
        else if(scrollon==0){
            self.activityindicatorroll.hidden=NO;
            return self.activityindicatorroll;
        }
        
    }
    //}else{
      //  NSLog(@"scrollon value else:%d",scrollon);
        //return nil;
    //}
    
    return self.activityindicatorroll;
}
 */

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    NSLog(@"viewForFooterInSection");
    NSLog(@"scrollon value:%d",scrollon);
    UILabel*end_lbl = nil;
    
    if([global_clicked_more isEqualToString:@"latest"] || [global_clicked_more isEqualToString:@"recent"]){
        
        
    }else{
        if (scrollon==1) {
            NSLog(@"scroll entred");
            //self.activityindicatorroll.hidden=YES;
            
            end_lbl = [[UILabel alloc]init];
            end_lbl.text=@"End Of Products";
            end_lbl.textColor = [UIColor blueColor];
            end_lbl.textAlignment = ALIGN_CENTER;
            //return end_lbl;
        }else if (scrollon==0){
            end_lbl = [[UILabel alloc]init];
            end_lbl.text=@"Pull To Load More Products..";
            end_lbl.textColor = [UIColor blueColor];
            end_lbl.textAlignment = ALIGN_CENTER;
            
        }
    }
    
    
    return end_lbl;
}
-(void)loadProductDetailsView{
    ProductDetails *pd = [[ProductDetails alloc]init];
    [self presentViewController:pd animated:YES completion:nil];
}

#pragma mark -
#pragma mark MNMBottomPullToRefreshManagerClient

/**
 * This is the same delegate method as UIScrollView but required in MNMBottomPullToRefreshManagerClient protocol
 * to warn about its implementation. Here you have to call [MNMBottomPullToRefreshManager tableViewScrolled]
 *
 * Tells the delegate when the user scrolls the content view within the receiver.
 *
 * @param scrollView: The scroll-view object in which the scrolling occurred.
 */
/*
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollviewdidscroll enter");
    NSLog(@"endofrow:%d",endofrow);
        NSLog(@"reloads_ value:%d",reloads_);
    NSLog(@"countrow:%d",countRow);
    NSLog(@"tempproduct_id count:%d",(int)tempproduct_id_arr.count);
    
   [pullToRefreshManager_ tableViewScrolled];
}
*/
/**
 * This is the same delegate method as UIScrollView but required in MNMBottomPullToRefreshClient protocol
 * to warn about its implementation. Here you have to call [MNMBottomPullToRefreshManager tableViewReleased]
 *
 * Tells the delegate when dragging ended in the scroll view.
 *
 * @param scrollView: The scroll-view object that finished scrolling the content view.
 * @param decelerate: YES if the scrolling movement will continue, but decelerate, after a touch-up gesture during a dragging operation.
 */
/*
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scroll end dragging");
    //[MBProgressHUD hideHUDForView:self.view animated:YES];
    
  // [pullToRefreshManager_ tableViewReleased];
    
}
*/

/**
 * Tells client that refresh has been triggered
 * After reloading is completed must call [MNMBottomPullToRefreshManager tableViewReloadFinished]
 *
 * @param manager PTR manager
 */
/*
- (void)bottomPullToRefreshTriggered:(MNMBottomPullToRefreshManager *)manager {
    NSLog(@"bottomPullToRefreshTriggered entered");
    NSLog(@"endofrow:%d",endofrow);
    NSLog(@"products count:%lu",(unsigned long)product_id_arr.count);
    NSLog(@"(product_id_arr.count-countRow):%d",((int)product_id_arr.count-countRow));
    NSLog(@"count of value:%d",countRow);
        [self performSelector:@selector(loadTable) withObject:nil afterDelay:1.0f];
}
 */

/*
-(void)lastRemainedProducts{
    NSLog(@"lastRemainedProducts");
    for (int i = countRow;i<product_id_arr.count; i++) {
        NSLog(@"i value in loooppp:%d",i);
        [self getListOfProductsDetails:[product_id_arr objectAtIndex:i]];
    }
    
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cartPageClick:(id)sender {
    NSLog(@"cartPageClick: clicked");
    cartpageopen_str=@"read";
     pageIdentify_str=@"CategoryProductsView";
   // addcartcheckint=2;
    NSLog(@"addcartcheckint:%d",addcartcheckint);
    [self openCartPage];
}

-(void)openCartPage{
    NSLog(@"openCartPage:");
   //CartVC *cvclocal = [[CartVC alloc]init];
    addcartcheckint=2;
    [self presentViewController:cvc animated:YES completion:nil];
    [cvc release];
    
}


-(void)getCartCountValue{
    [cvc countOfCartItems];
    // [self performSelectorInBackground:@selector(countOfCartItems) withObject:nil];
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
    [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
    
    if (cartcountvalue==0) {
        NSLog(@"cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=YES;
       
    }else{
        NSLog(@" else cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=NO;
        
    }
    
    //self.cartitemscount_btn.hidden=NO;
}

- (IBAction)addToCartPage:(id)sender{
    cartcountvalue=0;
    NSLog(@"add cart ID");
    quantity_str=@"1";
    tappedButton_addcart_btn = (UIButton*)sender;
    [cvc cartCreateIfNotExist];
    //[cvc countOfCartItems];
    [self getCartCountValue];

    //CartVC *cartview = [[CartVC alloc]initWithNibName:@"CartVC" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:cartview animated:YES];
}


- (IBAction)drop_down_click_user:(id)sender{
    UIButton*tappedButton =  (UIButton*)sender;
    NSLog(@"drop_down_click_user:%ld",(long)tappedButton.tag);
    NSLog(@"pageIdentify_str:%@",pageIdentify_str);
    if ([pageIdentify_str isEqualToString:@"CategoriesViewController"]) {
        [self callCategoriesPage];
    }else if ([pageIdentify_str isEqualToString:@"ProductsViewController"]) {
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
    CategoriesViewController*cvcv = [[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:cvcv animated:NO];
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
     pageIdentify_str=@"CategoryProductsView";
    SearchVC*svc = [[SearchVC alloc]init];
    [self presentViewController:svc animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

////////////////////////////////////////////////////Entire Bussiness Logic Changed New Req////////////////////////////////////


-(void)getCategoreyProducts:(int) countproducts{
   // NSString *str_category_product_url = [NSString stringWithFormat:@"https://www.https://dentistkart.com/webservice/product/iOS/?type=categoryProduct&category_id=%@&result=%d",
                             //child_catid_str,countproducts];

    
    @try{
    NSString *str_category_product_url = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/product/iOS/?type=categoryTypeProduct&category_id=%@&result=%d",
                                          child_catid_str,countproducts];
    
    //https://dentistkart.com/webservice/product/iOS/?type=categoryTypeProduct&category_id=43&result=0
    
    NSLog(@"str_category_product_url:%@",str_category_product_url);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_category_product_url]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    
    
    NSString *returnStringCategorey = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnStringCategorey:*%@*",returnStringCategorey);
    
    NSError *jsonError;
    // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    
    NSLog(@"dict:%@",dict);
    
    if (dict==nil||dict==NULL)
    {
        [MBProgressHUD hideHUDForView:self.tableView animated:YES];
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
        
        if (status==1)
            
        {
            NSLog(@"enter success block");
            
            [self.activityindicatorroll stopAnimating];
            self.loaderview_display.hidden=YES;
            
             [MBProgressHUD hideHUDForView:self.tableView animated:YES];
            NSLog(@"entred one");
            NSLog(@"create result:%@",[dict objectForKey:@"createResult"]);
            NSArray*arryrsult = [dict objectForKey:@"createResult"];
            
            if (arryrsult.count!=0) {
                arryrsult = nil;
                NSLog(@"arrresult:%lu",(long)arryrsult.count);
                NSDictionary*createresultdict = [dict objectForKey:@"createResult"];
                NSDictionary*product_details_dic = [createresultdict objectForKey:@"product_details"];
                NSDictionary*product_img_dic = [createresultdict objectForKey:@"product_image"];
                NSDictionary*product_stock_dic = [createresultdict objectForKey:@"product_stock"];
                NSLog(@"createresultdict value:%@",createresultdict);
                NSLog(@"coutn dic:%lu",(unsigned long)createresultdict.count);
                
            for (NSDictionary*dictprodname in product_details_dic) {
                
            
            
            
            NSString*product_id_str = [dictprodname objectForKey:@"product_id"];
            NSLog(@"product id:%@",product_id_str);
            [product_id_arr addObject:product_id_str];
           // [tempproduct_id_arr addObject:product_id_str];
            NSString*product_name_str = [dictprodname objectForKey:@"name"];
            
            if ([product_name_str isEqualToString:@""]||[product_name_str isEqualToString:@"<null>"]||[product_name_str isEqualToString:@"null"]||[product_name_str isEqualToString:@"(null)"]||product_name_str ==nil||product_name_str==NULL)
            {
                product_name_str=@"Not Available";
            }
            NSLog(@"product name:%@",product_name_str);
            [product_name_arr addObject:product_name_str];
            
            NSString*product_desc_str = [dictprodname objectForKey:@"description"];
            
            if ([product_desc_str isEqualToString:@""]||[product_desc_str isEqualToString:@"<null>"]||[product_desc_str isEqualToString:@"null"]||[product_desc_str isEqualToString:@"(null)"]||product_desc_str ==nil||product_desc_str==NULL)
            {
                product_desc_str=@"Not Available";
            }
            NSLog(@"product_desc_str:%@",product_desc_str);
            [product_desc_arr addObject:product_desc_str];
            
            
            
            NSString*product_short_str = [dictprodname objectForKey:@"short_description"];
            
            if ([product_short_str isEqualToString:@""]||[product_short_str isEqualToString:@"<null>"]||[product_short_str isEqualToString:@"null"]||[product_short_str isEqualToString:@"(null)"]||product_short_str ==nil||product_short_str==NULL)
            {
                product_short_str=@"Not Available";
            }
            NSLog(@"product_short_str:%@",product_short_str);
            [product_short_arr addObject:product_short_str];
            
            
            NSString*product_price_str = [dictprodname objectForKey:@"price"];
            
            if ([product_price_str isEqualToString:@""]||[product_price_str isEqualToString:@"<null>"]||[product_price_str isEqualToString:@"null"]||[product_price_str isEqualToString:@"(null)"]||product_price_str ==nil||product_price_str==NULL)
            {
                product_price_str=@"Not Avialable";
            }
            NSLog(@"product_price_str:%@",product_price_str);
            [product_price_arr addObject:product_price_str];
            
            
          NSString*product_sprice_str = [dictprodname objectForKey:@"special_price"];
            // NSString*product_sprice_str = @"120.00";
            if ([product_sprice_str isEqualToString:@""]||[product_sprice_str isEqualToString:@"<null>"]||[product_sprice_str isEqualToString:@"null"]||[product_sprice_str isEqualToString:@"(null)"]||product_sprice_str ==nil||product_sprice_str==NULL)
            {
                product_sprice_str=@"";
            }
            NSLog(@"product_sprice_str:%@",product_sprice_str);
            [product_special_price_arr addObject:product_sprice_str];
            
            
            
            }
            
            
            NSLog(@"product_img_dic:%@",product_img_dic);
            
            for (NSDictionary*productimgdict in product_img_dic) {
            NSLog(@"productimgdict:%@",productimgdict);
            
                for (NSDictionary*innnerdic in productimgdict) {
                    NSString*url = [innnerdic objectForKey:@"url"];
                    NSLog(@"url:%@",url);
                    if ([url isEqualToString:@""]||[url isEqualToString:@"<null>"]||[url isEqualToString:@"null"]||[url isEqualToString:@"(null)"]||url ==nil||url==NULL)
                    {
                        url=@"Not Avialable";
                    }
                    [product_image_arr addObject:url];

                }
                       }
            
            
            
            NSLog(@"product_stock_dic:%@",product_stock_dic);
            
            for (NSDictionary*productstock in product_stock_dic) {
                NSLog(@"productstock:%@",productstock);
            for (NSDictionary*innnerdic in productstock) {
            NSString*available_stock_check;
                NSLog(@"[productstock objectForKey:is_in_stock:%@",[innnerdic objectForKey:@"is_in_stock"]);
            if ([[innnerdic objectForKey:@"is_in_stock"] intValue]>0) {
                
                NSLog(@"entred");
                NSString*avialable_stock_str = [innnerdic objectForKey:@"qty"];
                
                available_stock_check=@"In Stock";
                prodavailability_glb_str = [NSString stringWithFormat:@"%@ %@",avialable_stock_str,available_stock_check];
                
                
            }else{
                available_stock_check=@"Out of Stock";
                prodavailability_glb_str = [NSString stringWithFormat:@"%@",available_stock_check];
                
            }
            
            [product_available_arr addObject:prodavailability_glb_str];
            }
            
            }
                scrollon=0;
            self.tableView.hidden=NO;
            [self.tableView reloadData];
           
            }else{
                arryrsult=nil;
                NSLog(@"empty check");
                scrollon=1;
            [self.tableView reloadData];
                //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"End of Products" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                //[alert show];

            }
            [MBProgressHUD hideHUDForView:self.tableView animated:YES];
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            [MBProgressHUD hideHUDForView:self.tableView animated:YES];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"exception cell:%@",exception);
    }
    @finally {
      // scrollon=0;
        NSLog(@"final");
    }
    
    [MBProgressHUD hideHUDForView:self.tableView animated:YES];
    
   // [self.tableView reloadData];
}




/////////////////////////////////For Home More Button Images/////////////////////////////////////////////////////////

/////////////////////////////////////////New Arrivals & Featured ////////////////////////////////////
-(void)latestHomeProducts{
    @try{
        
       // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        //hud.labelText = @"Loading.......";
        
        // NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/product/homepage/"];
        
        NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/product/homepage/all/"];
        NSLog(@"str_country:%@",str_country);
        
      //  NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country]];
        NSMutableURLRequest*request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];
        
        
        NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
        // NSLog(@"returnData:%@",returnData);
        
        NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
        
        NSLog(@"returnString:*%@*",returnString);
        
        
        //NSDictionary *dict=[returnString JSONValue];
        
        //NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:nil];
        
        NSError *jsonError;
        //NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                             options:kNilOptions
                                                               error:&jsonError];
        
        //NSString*val = [NSString stringWithFormat:@"%@",[dict objectForKey:@"statuscode"]];
        //NSLog(@"val check:%@",val);
        NSLog(@"dict:%@",dict);
        
        if ([returnString isEqualToString:@"**"]) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }else{
        if (dict==nil||dict==NULL)
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            //[alert show];
            //[alert release];
        }else {
            NSString* statuscode = [dict objectForKey:@"statuscode"];
            NSString* message = [dict objectForKey:@"message"];
            
            NSLog(@"statuscode:%@",statuscode);
            NSLog(@"enter else");
            
            NSLog(@"check1");
            NSLog(@"statuscode check:%@",statuscode);
            int status = [statuscode intValue];
            
            if (status==1){
                
                NSLog(@"enter success block");
                //[MBProgressHUD hideHUDForView:self.view animated:YES];
                
                
                
                NSDictionary*tempDict = [dict objectForKey:@"createResult"];
                //NSDictionary*recentDict = [dict objectForKey:@"recentProduct"];
                
                NSLog(@"");
                
                
                NSLog(@"tempDict:%@",tempDict);
                
                
                NSDictionary*latestnormaldict;
                if([global_clicked_more isEqualToString:@"latest"]){
               
                latestnormaldict =[tempDict objectForKey:@"LatestProducts"];
                
                
                NSLog(@"latestnormaldict:%@",latestnormaldict);
                }else if([global_clicked_more isEqualToString:@"recent"]){
                
                latestnormaldict =[tempDict objectForKey:@"RecentlyBrought"];
                
                
                NSLog(@"RecentlyBrought dict:%@",latestnormaldict);
                
                }
                
                
                
                
               // int i=0;
                if (latestnormaldict.count!=0) {
                    
                    
                    for(NSDictionary*locldict in latestnormaldict){
                        
                        [product_id_arr addObject:[locldict objectForKey:@"product_id"]];
                        NSLog(@"locldictlatest:%@",locldict);
                        NSString*product_name_str = [locldict objectForKey:@"name"];
                        NSLog(@"product_name_str:%@",product_name_str);
                        if ([product_name_str isEqualToString:@""]||[product_name_str isEqualToString:@"<null>"]||[product_name_str isEqualToString:@"null"]||[product_name_str isEqualToString:@"(null)"]||product_name_str ==nil||product_name_str==NULL)
                        {
                            product_name_str=@"Not Available";
                        }
                        [product_name_arr addObject:product_name_str];
                        product_name_str=nil;
                        
                        
                        NSString*product_url_str = [locldict objectForKey:@"imgurl"];
                        NSLog(@"imgurl:%@",product_url_str);
                        if ([product_url_str isEqualToString:@""]||[product_url_str isEqualToString:@"<null>"]||[product_url_str isEqualToString:@"null"]||[product_url_str isEqualToString:@"(null)"]||product_url_str ==nil||product_url_str==NULL)
                        {
                            product_url_str=@"Not Available";
                        }
                        [product_image_arr addObject:product_url_str];
                        product_url_str=@"";
                        
                        NSString*product_price_str = [locldict objectForKey:@"price"];
                        if ([product_price_str isEqualToString:@""]||[product_price_str isEqualToString:@"<null>"]||[product_price_str isEqualToString:@"null"]||[product_price_str isEqualToString:@"(null)"]||product_price_str ==nil||product_price_str==NULL)
                        {
                            product_price_str=@"Not Available";
                        }
                        [product_price_arr addObject:product_price_str];
                        product_price_str=nil;
                        
                        NSString*product_specialprice_str = [locldict objectForKey:@"special_price"];
                        
                        
                        NSLog(@"specail price check:%@",product_specialprice_str);
                        
                         if ([product_specialprice_str isEqualToString:@""]||[product_specialprice_str isEqualToString:@"<null>"]||[product_specialprice_str isEqualToString:@"null"]||[product_specialprice_str isEqualToString:@"(null)"]||product_specialprice_str ==nil||product_specialprice_str==NULL || [product_specialprice_str isKindOfClass:[NSNull class]]|| product_specialprice_str == (NSString *)[NSNull null] ||[product_specialprice_str isEqualToString:@"\"<null>\""])
                         {
                         product_specialprice_str=@"";
                         }
                        
                        [product_special_price_arr addObject:product_specialprice_str];
                        product_specialprice_str=nil;
                        
                        NSString*product_short_str = [locldict objectForKey:@"short_description"];
                        
                        if ([product_short_str isEqualToString:@""]||[product_short_str isEqualToString:@"<null>"]||[product_short_str isEqualToString:@"null"]||[product_short_str isEqualToString:@"(null)"]||product_short_str ==nil||product_short_str==NULL)
                        {
                            product_short_str=@"Not Available";
                        }
                        NSLog(@"product_short_str:%@",product_short_str);
                        [product_short_arr addObject:product_short_str];
                        product_short_str=nil;
                        
                        NSString*available_stock_check;
                        if ([[locldict objectForKey:@"stock_status"] intValue]>0) {
                            
                            
                            NSString*avialable_stock_str = [locldict objectForKey:@"qty"];
                            
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
                            
                            
                        }else{
                            available_stock_check=@"Out of Stock";
                            prodavailability_glb_str = [NSString stringWithFormat:@"%@",available_stock_check];
                            
                        }
                        
                        [product_available_arr addObject:prodavailability_glb_str];
                        prodavailability_glb_str=nil;
                        
                        
                        
                        /*
                         NSString*short_desc_str = [dictprodname objectForKey:@"short_description"];
                         if ([short_desc_str isEqualToString:@""]||[short_desc_str isEqualToString:@"<null>"]||[short_desc_str isEqualToString:@"null"]||[short_desc_str isEqualToString:@"(null)"]||short_desc_str ==nil||short_desc_str==NULL)
                         {
                         short_desc_str=@"Not Available";
                         }
                         [latest_product_short_desc_arr addObject:short_desc_str];
                         
                         NSString*long_desc_str = [dictprodname objectForKey:@"description"];
                         if ([long_desc_str isEqualToString:@""]||[long_desc_str isEqualToString:@"<null>"]||[long_desc_str isEqualToString:@"null"]||[long_desc_str isEqualToString:@"(null)"]||long_desc_str ==nil||short_desc_str==NULL)
                         {
                         long_desc_str=@"Not Available";
                         }
                         [latest_product_long_desc_arr addObject:long_desc_str];
                         
                         */
                        
                        
                        
                        
                    }
                    self.tableView.hidden=NO;
                    [self.tableView reloadData];
                    [MBProgressHUD hideHUDForView:self.tableView animated:YES];
                }else{
                    [MBProgressHUD hideHUDForView:self.tableView animated:YES];
                }
                
                
                [MBProgressHUD hideHUDForView:self.tableView animated:YES];
                
            }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"exception home category call:%@",exception);
    }
    @finally {
        NSLog(@"final");
    }
}






////////////////////////////////////////////////////////end//////////////////////////////////////////////////////////////////////////

- (void)dealloc {
    [_leftmenu_underview release];
    [_show_user_not_log_view release];
    [_dentistkartname_lbl release];
    [_activityindicatorroll release];
    [_loaderview_display release];
    [super dealloc];
}
@end
