//
//  MyOrdersVC.m
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 03/01/15.
//  Copyright (c) 2015 Google Inc. All rights reserved.
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
#import "MyOrdersCell.h"
@interface MyOrdersVC ()

@end

@implementation MyOrdersVC
@synthesize left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro,left_menu_brand_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
     //[self.view addSubview:order_scrollview];
    
    
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
        
        left_menu_profile_name.text = logged_username;
        left_menu_profile_email_lbl.text = global_email_store;
        left_menu_profile_name.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        left_menu_profile_email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/23];

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
    
    
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    
    
    ///////////////////////////////////////////Array Allocation////////////////////////////
    
    orderid_arr = [[NSMutableArray alloc]init];
    orderstatus_arr = [[NSMutableArray alloc]init];
    createddate_arr = [[NSMutableArray alloc]init];
    orderqty_arr = [[NSMutableArray alloc]init];
    ordergrandtotal_arr = [[NSMutableArray alloc]init];
    //orderid_arr = [[NSMutableArray alloc]init];
    
    
    ///////////////////////////////////////////////////////////////////////////////////////
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";
     [self performSelector:@selector(listOfOrdersService) withObject:nil afterDelay:0.1];
}

-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}


-(void)listOfOrdersService{

    NSString *str_url;
    
    str_url = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/orders/history/?customer_id=%@",logged_user_id];
    
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
            if (resultdict.count!=0) {
                
            
            for (NSDictionary*localdict in resultdict) {
                
                NSString*orderid_str = [localdict objectForKey:@"increment_id"];
                if ([orderid_str isEqualToString:@""]||[orderid_str isEqualToString:@"<null>"]||[orderid_str isEqualToString:@"null"]||[orderid_str isEqualToString:@"(null)"]||orderid_str ==nil||orderid_str==NULL)
                {
                    orderid_str=@"Not Available";
                }
                [orderid_arr addObject:orderid_str];
                
                NSLog(@"increment id:%@",orderid_str);
                NSString*orderstatus_str = [localdict objectForKey:@"status"];
                if ([orderstatus_str isEqualToString:@""]||[orderstatus_str isEqualToString:@"<null>"]||[orderstatus_str isEqualToString:@"null"]||[orderstatus_str isEqualToString:@"(null)"]||orderstatus_str ==nil||orderstatus_str==NULL)
                {
                    orderstatus_str=@"Not Available";
                }
                NSLog(@"orderstatus_str id:%@",orderstatus_str);
                
                [orderstatus_arr addObject:orderstatus_str];
                
                NSString*orderdate_str = [localdict objectForKey:@"created_at"];
                if ([orderdate_str isEqualToString:@""]||[orderdate_str isEqualToString:@"<null>"]||[orderdate_str isEqualToString:@"null"]||[orderdate_str isEqualToString:@"(null)"]||orderdate_str ==nil||orderdate_str==NULL)
                {
                    orderdate_str=@"";
                }
                
                NSLog(@"orderdate_str id:%@",orderdate_str);
                [createddate_arr addObject:orderdate_str];
                
                NSString*orderqty_str = [localdict objectForKey:@"total_qty_ordered"];
                if ([orderqty_str isEqualToString:@""]||[orderqty_str isEqualToString:@"<null>"]||[orderqty_str isEqualToString:@"null"]||[orderqty_str isEqualToString:@"(null)"]||orderqty_str ==nil||orderqty_str==NULL)
                {
                    orderqty_str=@"Not Available";
                }
                NSLog(@"orderqty_str id:%@",orderqty_str);
                
                [orderqty_arr addObject:orderqty_str];
                
                NSString*ordertotal_str = [localdict objectForKey:@"base_grand_total"];
                if ([ordertotal_str isEqualToString:@""]||[ordertotal_str isEqualToString:@"<null>"]||[ordertotal_str isEqualToString:@"null"]||[ordertotal_str isEqualToString:@"(null)"]||ordertotal_str ==nil||ordertotal_str==NULL)
                {
                    ordertotal_str=@"Not Available";
                }
                
                NSLog(@"ordertotal_str id:%@",ordertotal_str);
                
                [ordergrandtotal_arr addObject:ordertotal_str];
                
                [self.myorderstblview reloadData];
                
                /*
                
                ////////////////////////////////////Dynamic UI///////////////////////////////////////////
                
                UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(0,20+([self screenSize].height/4)* countRow, [self screenSize].width,[self screenSize].height/4-10)];
                NSLog(@"check1");
                NSLog(@"20+([self screenSize].height/4)* countRow:%f",20+([self screenSize].height/4)* countRow);
                UITapGestureRecognizer*tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openOrderDetails:)];
                [viewarrive setTag:[orderid_str intValue]];
                [viewarrive addGestureRecognizer:tapgesture];
                
                
                [viewarrive setBackgroundColor:[UIColor colorWithWhite:03 alpha:1.0f]];
                
                
                UILabel *lblorderIDTemp = [[UILabel alloc] init];
                lblorderIDTemp.text = [NSString stringWithFormat:@"#%@", orderid_str];
                lblorderIDTemp.adjustsFontSizeToFitWidth = YES;
                lblorderIDTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
                [lblorderIDTemp setTranslatesAutoresizingMaskIntoConstraints:NO];

                
                UILabel *lblstatustitleTemp = [[UILabel alloc] init];
                lblstatustitleTemp.text = @"Status:";
                lblstatustitleTemp.adjustsFontSizeToFitWidth = YES;
                lblstatustitleTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/25];
                [lblstatustitleTemp setTranslatesAutoresizingMaskIntoConstraints:NO];

                
                
                
                UILabel *lblstatusTemp = [[UILabel alloc] init];
                lblstatusTemp.text = [NSString stringWithFormat:@"%@", orderstatus_str];
                lblstatusTemp.adjustsFontSizeToFitWidth = YES;
                lblstatusTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/30];
                [lblstatusTemp setTranslatesAutoresizingMaskIntoConstraints:NO];

                
                
                UILabel *lbldatetitleTemp = [[UILabel alloc] init];
                lbldatetitleTemp.text = @"Date:";
                lbldatetitleTemp.adjustsFontSizeToFitWidth = YES;
                lbldatetitleTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/25];
                [lbldatetitleTemp setTranslatesAutoresizingMaskIntoConstraints:NO];

                
                UILabel *lbldateTemp = [[UILabel alloc] init];
                lbldateTemp.text = [NSString stringWithFormat:@"%@", orderdate_str];
                lbldateTemp.adjustsFontSizeToFitWidth = YES;
                lbldateTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
                [lbldateTemp setTranslatesAutoresizingMaskIntoConstraints:NO];

                
                
                UILabel *lblqtytitleTemp = [[UILabel alloc] init];
                lblqtytitleTemp.text = @"Quantity:";
                lblqtytitleTemp.adjustsFontSizeToFitWidth = YES;
                lblqtytitleTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/25];
                [lblqtytitleTemp setTranslatesAutoresizingMaskIntoConstraints:NO];

                
                UILabel *lblqtyTemp = [[UILabel alloc] init];
                lblqtyTemp.text = [NSString stringWithFormat:@"%1.0f", [orderqty_str doubleValue]];
                lblqtyTemp.adjustsFontSizeToFitWidth = YES;
                lblqtyTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/30];
                [lblqtyTemp setTranslatesAutoresizingMaskIntoConstraints:NO];

                
                UILabel *lbltotaltitleTemp = [[UILabel alloc] init];
                lbltotaltitleTemp.text = @"Order Total:";
                lbltotaltitleTemp.adjustsFontSizeToFitWidth = YES;
                lbltotaltitleTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/25];
                [lbltotaltitleTemp setTranslatesAutoresizingMaskIntoConstraints:NO];

                
                UILabel *lblgrandtotalTemp = [[UILabel alloc] init];
                lblgrandtotalTemp.text = [NSString stringWithFormat:@"%1.2f", [ordertotal_str doubleValue]];
                lblgrandtotalTemp.adjustsFontSizeToFitWidth = YES;
                lblgrandtotalTemp.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/30];
                [lblgrandtotalTemp setTranslatesAutoresizingMaskIntoConstraints:NO];


                
                UIButton *btnClickOrderTemp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                
                btnClickOrderTemp.tag = [orderid_str intValue];
                [btnClickOrderTemp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [btnClickOrderTemp setImage:[UIImage imageNamed:@"rightarrowicon"] forState:UIControlStateNormal];
                [btnClickOrderTemp addTarget:self action:@selector(selectedOrderID:) forControlEvents:UIControlEventTouchUpInside];
                [btnClickOrderTemp setTranslatesAutoresizingMaskIntoConstraints:NO];

                
                
                
                [viewarrive addSubview:lblorderIDTemp];
                [viewarrive addSubview:lbldatetitleTemp];
                [viewarrive addSubview:lblstatusTemp];
                [viewarrive addSubview:lblstatustitleTemp];
                [viewarrive addSubview:lblqtyTemp];
                [viewarrive addSubview:lblqtytitleTemp];
                [viewarrive addSubview:lbldateTemp];
                [viewarrive addSubview:lbltotaltitleTemp];
                [viewarrive addSubview:lblgrandtotalTemp];
                [viewarrive addSubview:btnClickOrderTemp];
                
                
                
                NSLayoutConstraint*leadingorderidlbl = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lblorderIDTemp attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
                
                NSLayoutConstraint*toporderidlbl = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblorderIDTemp attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
                
                NSLayoutConstraint*trailingordebtnlbl = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:btnClickOrderTemp attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
                
                NSLayoutConstraint*trailingorderstatusvalue = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:lblstatusTemp attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
                
                NSLayoutConstraint*trailingordertotalvalue = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:lblgrandtotalTemp attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
                
                NSLayoutConstraint*trailingorderbtnClickOrderTemp = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:btnClickOrderTemp attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];

                NSLayoutConstraint*centeryordervalue = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:btnClickOrderTemp attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
                [viewarrive addConstraints:@[leadingorderidlbl,toporderidlbl,trailingorderstatusvalue,trailingordebtnlbl,trailingordertotalvalue,trailingorderbtnClickOrderTemp,centeryordervalue]];
                
                
                
                NSDictionary*newviews= @{@"lblorderIDTemp":lblorderIDTemp,@"lbldatetitleTemp":lbldatetitleTemp,@"lblstatusTemp":lblstatusTemp,@"lblstatustitleTemp":lblstatustitleTemp,@"lblqtyTemp":lblqtyTemp,@"lblqtytitleTemp":lblqtytitleTemp,@"lbldateTemp":lbldateTemp,@"lbldatetitleTemp":lbldatetitleTemp,@"lblgrandtotalTemp":lblgrandtotalTemp,@"lbltotaltitleTemp":lbltotaltitleTemp,@"btnClickOrderTemp":btnClickOrderTemp};

                NSString* viewarrivewidth_str = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.width/4)];
                NSString* viewarriveheight_str = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.height)/2];

                NSDictionary*newmetrics = @{@"width":viewarrivewidth_str,@"height":viewarriveheight_str};
                
                
                
                
                
                
                   /////////////////////////////Horizontal constraints////////////////////////////////
                if ([self screenSize].width<500) {
                    
                    NSArray *firstrowhorizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblorderIDTemp(width)]-20-[lblstatustitleTemp(40)]-2-[lblstatusTemp(60)]-10-|" options:0 metrics:newmetrics views:newviews];
                    
                    NSArray *secondrowhorizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbldatetitleTemp(50)]-2-[lbldateTemp(50)]" options:0 metrics:newmetrics views:newviews];
                    
                    NSArray *thirdrowhorizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblqtytitleTemp(50)]-2-[lblqtyTemp(50)]-10-[lbltotaltitleTemp(60)]-2-[lblgrandtotalTemp(50)]-10-|" options:0 metrics:newmetrics views:newviews];
                    
                    
                    [viewarrive addConstraints:firstrowhorizontalConstraints];
                    [viewarrive addConstraints:secondrowhorizontalConstraints];
                    [viewarrive addConstraints:thirdrowhorizontalConstraints];
                }else
                { NSArray *firstrowhorizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblorderIDTemp(width)]-20-[lblstatustitleTemp(100)]-2-[lblstatusTemp(100)]-10-|" options:0 metrics:newmetrics views:newviews];
                    
                    NSArray *secondrowhorizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbldatetitleTemp(150)]-2-[lbldateTemp(200)]" options:0 metrics:newmetrics views:newviews];
                    
                    NSArray *thirdrowhorizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblqtytitleTemp(150)]-2-[lblqtyTemp(150)]-20-[lbltotaltitleTemp(100)]-2-[lblgrandtotalTemp(100)]-10-|" options:0 metrics:newmetrics views:newviews];
                    
                    
                    [viewarrive addConstraints:firstrowhorizontalConstraints];
                    [viewarrive addConstraints:secondrowhorizontalConstraints];
                    [viewarrive addConstraints:thirdrowhorizontalConstraints];
                }
                //////////////////////////////////end horizontal////////////////////////////////////////
               ////////////////////////////////////Verticular Constraints//////////////////////////////
                
                if([self screenSize].width<500)
                {
                    NSArray *verticalConstraintsPrice =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblorderIDTemp(30)]-20-[lbldatetitleTemp(15)]-5-[lblqtytitleTemp(15)]" options:0 metrics:newmetrics views:newviews];
                    
                    [viewarrive addConstraints:verticalConstraintsPrice];
                    
                    NSArray *verticalConstraintsQty =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[lblstatustitleTemp(15)]-30-[btnClickOrderTemp(15)]-30-[lbltotaltitleTemp(15)]-5-|" options:0 metrics:newmetrics views:newviews];
                    [viewarrive addConstraints:verticalConstraintsQty];
                    
                    
                    
                    NSArray *verticalConstraintsvalues =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblorderIDTemp(30)]-20-[lbldateTemp(15)]-5-[lblqtyTemp(15)]" options:0 metrics:newmetrics views:newviews];
                    
                    [viewarrive addConstraints:verticalConstraintsvalues];
                    
                    
                    NSArray *verticalConstraintsrgtvalues =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[lblstatusTemp(15)]-30-[btnClickOrderTemp(15)]-30-[lblgrandtotalTemp(15)]-5-|" options:0 metrics:newmetrics views:newviews];
                    [viewarrive addConstraints:verticalConstraintsrgtvalues];
                }
                else
                {
                    NSArray *verticalConstraintsPrice =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblorderIDTemp(30)]-30-[lbldatetitleTemp(30)]-5-[lblqtytitleTemp(30)]" options:0 metrics:newmetrics views:newviews];
                    
                    [viewarrive addConstraints:verticalConstraintsPrice];
                    
                    NSArray *verticalConstraintsQty =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblstatustitleTemp(30)]-30-[btnClickOrderTemp(30)]-30-[lbltotaltitleTemp(40)]-10-|" options:0 metrics:newmetrics views:newviews];
                    [viewarrive addConstraints:verticalConstraintsQty];
                    
                    
                    
                    NSArray *verticalConstraintsvalues =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblorderIDTemp(30)]-30-[lbldateTemp(30)]-5-[lblqtyTemp(30)]" options:0 metrics:newmetrics views:newviews];
                    
                    [viewarrive addConstraints:verticalConstraintsvalues];
                    
                    
                    NSArray *verticalConstraintsrgtvalues =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblstatusTemp(30)]-30-[btnClickOrderTemp(30)]-30-[lblgrandtotalTemp(30)]-10-|" options:0 metrics:newmetrics views:newviews];
                    [viewarrive addConstraints:verticalConstraintsrgtvalues];                }
                
                
                //////////////////////////////////end vertical constraints//////////////////////////////////
                
                
                
                
                */
                
                /*
                /////////////////////////////Horizontal constraints////////////////////////////////
                
                NSArray *firstrowhorizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblorderIDTemp(width)]-20-[lblstatustitleTemp(100)]-2-[lblstatusTemp(100)]-10-|" options:0 metrics:newmetrics views:newviews];

                NSArray *secondrowhorizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lbldatetitleTemp(150)]-2-[lbldateTemp(200)]" options:0 metrics:newmetrics views:newviews];

                NSArray *thirdrowhorizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lblqtytitleTemp(150)]-2-[lblqtyTemp(150)]-20-[lbltotaltitleTemp(100)]-2-[lblgrandtotalTemp(100)]-10-|" options:0 metrics:newmetrics views:newviews];
                
                
                [viewarrive addConstraints:firstrowhorizontalConstraints];
                [viewarrive addConstraints:secondrowhorizontalConstraints];
                [viewarrive addConstraints:thirdrowhorizontalConstraints];
                //////////////////////////////////end horizontal////////////////////////////////////////
                
                
                
                
                
                
                ////////////////////////////////////Verticular Constraints//////////////////////////////
                
                NSArray *verticalConstraintsPrice =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblorderIDTemp(30)]-30-[lbldatetitleTemp(30)]-5-[lblqtytitleTemp(30)]" options:0 metrics:newmetrics views:newviews];
                
                [viewarrive addConstraints:verticalConstraintsPrice];
                
                NSArray *verticalConstraintsQty =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblstatustitleTemp(30)]-30-[btnClickOrderTemp(30)]-30-[lbltotaltitleTemp(30)]-10-|" options:0 metrics:newmetrics views:newviews];
                [viewarrive addConstraints:verticalConstraintsQty];
                
                
                
                NSArray *verticalConstraintsvalues =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblorderIDTemp(30)]-30-[lbldateTemp(30)]-5-[lblqtyTemp(30)]" options:0 metrics:newmetrics views:newviews];
                
                [viewarrive addConstraints:verticalConstraintsvalues];

                
                NSArray *verticalConstraintsrgtvalues =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[lblstatusTemp(30)]-30-[btnClickOrderTemp(30)]-30-[lblgrandtotalTemp(30)]-10-|" options:0 metrics:newmetrics views:newviews];
                [viewarrive addConstraints:verticalConstraintsrgtvalues];


                //////////////////////////////////end vertical constraints//////////////////////////////////
                 */
                
                
               // NSLog(@"screen height:%f",[self screenSize].height);
                //NSLog(@"Y axis of view:%f",viewarrive.frame.origin.y);
                /*
                if ([self screenSize].height<viewarrive.frame.origin.y) {
                    NSLog(@"enter in if");
                    [self.scrollview_orders setContentSize:CGSizeMake([self screenSize].width,([self screenSize].height/4)*countRow)];
                }else{
                    NSLog(@"enter in else");
                }
                */
                
              //  [self.scrollview_orders addSubview:viewarrive];
                
                
                
                ////////////////////////////////////////////////////////////////////////////////////////
                
                countRow++;
            }
            
           // [self.scrollview_orders setContentSize:CGSizeMake([self screenSize].width,([self screenSize].height/4)*countRow)];
            }else{
                UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Your Order History is empty" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"cancel", nil];
                [alert show];

            }
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }else if(status==2){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response from Server" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"cancel", nil];
            [alert show];

        
        }
    
    
    
    }

}

-(void)callMyAccountPage{
    MyAccountView*mmyacct = [[MyAccountView alloc]init];
    [self presentViewController:mmyacct animated:YES completion:nil];
}

-(void)openOrderDetails:(UITapGestureRecognizer*)gestureRecognizer{
    pageIdentify_str=@"MyOrdersVC";
    UIView*tempView = (UIView*)gestureRecognizer.view;
    NSLog(@"tempViewOrder:%@",tempView);
    NSLog(@"tempView.tag:%d",(int)tempView.tag);
    orderid_intvalue = (int)tempView.tag;
    NSLog(@"orderid_intvalue:%d",orderid_intvalue);
    
    [self orderDetailsPage];
}


- (IBAction)selectedOrderID:(id)sender{
    
        tappedButton_addorder_btn = (UIButton*)sender;
        orderid_intvalue = (int)tappedButton_addorder_btn.tag;
        NSLog(@"view order ID:%ld",(long)tappedButton_addorder_btn.tag);
        [self orderDetailsPage];
}
-(void)orderDetailsPage{
       OrderVC *ovc = [[OrderVC alloc]init];
       [self presentViewController:ovc animated:YES completion:nil];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"response:%@",response);
}


- (IBAction)drop_down_click_user:(id)sender{
    UIButton*tappedButton =  (UIButton*)sender;
    NSLog(@"drop_down_click_user:%ld",(long)tappedButton.tag);
    [self callMyAccountPage];
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
    //addcartcheckint=2;
    //cartpageopen_str=@"read";
    addcartcheckint=2;
     pageIdentify_str=@"MyOrdersVC";
    [self openCartPage];
}
-(void)openCartPage{
    
    CartVC *cvclocal = [[CartVC alloc]init];
    [self presentViewController:cvclocal animated:YES completion:nil];
    
}
- (IBAction)searchBtnClick:(id)sender {
     pageIdentify_str=@"MyOrdersVC";
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


///////////////////////////////TableView delegate methods///////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [orderid_arr count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @try {
        
        
        NSLog(@"cellforrow");
        MyOrdersCell * pcell;
        
        static NSString *cellIdentifier1 = @"cellIdentifierMyOrder";
        pcell = (MyOrdersCell *)[self.myorderstblview dequeueReusableCellWithIdentifier:cellIdentifier1];
        
        if (pcell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyOrdersCell"
                                                         owner:self options:nil];
            for (id oneObject in nib) if ([oneObject isKindOfClass:[MyOrdersCell class]])
                pcell = (MyOrdersCell *)oneObject;
        }
        pcell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSString *orderid_str=[[NSString alloc]initWithFormat:@"#%@",[orderid_arr objectAtIndex:[indexPath row]]];
        
        pcell.orderid_lbl.text = orderid_str;
        
        NSLog(@"orderid_str Check:%@",orderid_str);
        // pcell.user_name.text =product_img_str;
        
        NSLog(@"crossed 1");
        
        NSString *orderdate_str=[[NSString alloc]initWithFormat:@":%@",[createddate_arr objectAtIndex:[indexPath row]]];
        
        pcell.orderdatevalue_lbl.text=orderdate_str;
        
        NSLog(@"orderdate_str Check:%@",orderdate_str);
        
        
        NSString *orderqty_str=[[NSString alloc]initWithFormat:@":%@",[orderqty_arr objectAtIndex:[indexPath row]]];
        
        pcell.orderqtyvalue_lbl.text=orderqty_str;
        
        NSLog(@"orderqty_str Check:%@",orderqty_str);
        
        
        NSString *orderstatus_str=[[NSString alloc]initWithFormat:@"%@",[orderstatus_arr objectAtIndex:[indexPath row]]];
        
        pcell.status_value_lbl.text=orderstatus_str;
        
        NSLog(@"orderstatus_str Check:%@",orderstatus_str);
        
        
        NSString *ordertotal_str=[[NSString alloc]initWithFormat:@"INR %0.2f",[[ordergrandtotal_arr objectAtIndex:[indexPath row]]doubleValue]];
        
        pcell.ordertotalvalue_lbl.text=ordertotal_str;
        
        NSLog(@"ordertotal_str Check:%@",ordertotal_str);
        
        
        NSLog(@"crossed 2");
        
        
        pcell.orderbtn.tag = [[orderid_arr objectAtIndex:[indexPath row]]intValue];
        [pcell.orderbtn addTarget:self action:@selector(selectedOrderID:) forControlEvents:UIControlEventTouchUpInside];

        pcell.orderid_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];
        pcell.orderdate_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        pcell.orderdatevalue_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        pcell.orderqty_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        pcell.orderqtyvalue_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        pcell.status_title_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        pcell.status_value_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        pcell.ordertotaltitle_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        pcell.ordertotalvalue_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/35];
        
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
    pageIdentify_str=@"MyOrdersVC";
    
    //NSLog(@"tempViewOrder:%@",tempView);
    //NSLog(@"tempView.tag:%d",(int)tempView.tag);
    orderid_intvalue = [[orderid_arr objectAtIndex:indexPath.row]intValue];
    NSLog(@"orderid_intvalue:%d",orderid_intvalue);
    
    [self orderDetailsPage];

    //[self loadProductDetailsView];
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
    [_scrollview_orders release];
    [_myorderstblview release];
    [super dealloc];
}
@end
