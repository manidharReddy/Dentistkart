//
//  MyAccountEditVC.m
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 30/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import "MyAccountEditVC.h"
#import "MBProgressHUD.h"
//#import "ASIHTTPRequest.h"
//#import "ASIFormDataRequest.h"
//#import"JSON1.h"
#import "AppDelegate.h"
#import "ProductsViewController.h"
#import "CartVC.h"

#import "CategoriesViewController.h"
#import "LoginViewController.h"

#import "MyAccountView.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "SearchVC.h"
@interface MyAccountEditVC ()

@end

@implementation MyAccountEditVC
@synthesize tab_view,modify_account_view,modify_account_bar_lbl,modify_btn,drop_down_btn_pro,drop_down_view,login_or_signup_btn,cancel_or_return_bnt,whishlist_btn,myorders_btn,profile_btn,myaddress_btn,policies_btn,cantactus_btn,myprofile_lbl,firstname_txtfeild,lastname_txtfeild,password_txtfeild,mobile_txtfeild,street_txtfeild,pincode_txtfeild,promotions_lbl,products_down_lbl,orders_down_lbl,cart_down_lbl,more_down_lbl,logoutimgicon_imgview,profile_dropdw_imgview,usernme_imgicon_imgview,logout_btn,scrollsignup,cancel_btn,logged_usrname_show_lbl,left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,left_menu_brand_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    firstname_txtfeild.delegate=self;
    lastname_txtfeild.delegate=self;
    password_txtfeild.delegate=self;
    
    scrollsignup.scrollEnabled=YES;
    scrollsignup.userInteractionEnabled=YES;
    scrollsignup.pagingEnabled = YES;
    scrollsignup.showsHorizontalScrollIndicator = NO;
    scrollsignup.showsVerticalScrollIndicator = NO;
    scrollsignup.scrollsToTop = NO;
    scrollsignup.delegate = self;
    
    //scrollsignup.contentSize = scroll_underview.frame.size;
    // scrollsignup.contentSize = CGSizeMake(150, 1200);
    
    [self.view addSubview:scrollsignup];
    [scrollsignup addSubview:modify_account_view];
    
    //scrollsignup.contentSize = scroll_underview.frame.size;
    // scrollsignup.contentSize = CGSizeMake(150, 1200);
    drop_down_view.frame = CGRectMake(150, 70, 200, 150);
    [self.view addSubview:drop_down_view];
    
    self.modify_btn.enabled=NO;
    ///////////////////////Side Menu///////////////////////
   // leftmenulist_view.frame = CGRectMake(0, 0, 200, 600);
    leftmenulist_view.frame = CGRectMake(0, 50, ([self screenSize].width/2)+[self screenSize].width/3, [self screenSize].height-50);

    [modify_account_view addSubview:leftmenulist_view];
    
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
        //self.cartitemscount_btn.hidden=NO;
        //self.cartitemscount_btn.layer.cornerRadius=8.0f;
        //NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        //[self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
        
        left_menu_profile_name.text = logged_username;
        left_menu_profile_email_lbl.text = global_email_store;
        self.email_lbl.text = logged_username;
        self.mobile_lbl.text = global_email_store;
        self.email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        self.mobile_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/28];

        
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

    
    //left_menu_profile_name.text = logged_username;
    //left_menu_profile_email_lbl.text = global_email_store;
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
    
    self.firstname_txtfeild.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.lastname_txtfeild.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading.....";
    
    [self performSelector:@selector(userProfileViewService) withObject:nil afterDelay:0.1];

}

-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}
-(void)callMyAccountPage{
    NSLog(@"entred");
    MyAccountView*mmyacct = [[[MyAccountView alloc]init]autorelease];
    [self presentViewController:mmyacct animated:YES completion:nil];
    [mmyacct release];
    NSLog(@"after ent");
}


-(void)updateUserProfileService{

    
    
    //
    
    NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/customer/update/?customer=%@&firstname=%@&lastname=%@",logged_user_id,firstname_txtfeild.text,lastname_txtfeild.text];
    
    NSLog(@"str_country:%@",str_country);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    
    NSError *jsonError;
    NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:kNilOptions
                                                           error:&jsonError];
    
    NSLog(@"dict:%@",dict);
    
    
    if (dict==nil||dict==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else {
        
        NSString *user_profile_str;
        NSString *statuscode;
        NSString *message;
        
            statuscode = [dict objectForKey:@"statuscode"];
            message = [dict objectForKey:@"message"];
            NSLog(@"dict:%@",[dict objectForKey:@"createResult"]);
            
        int status = [statuscode intValue];
        
        /*
        if ([statuscode isEqualToString:@"(null)"]||[statuscode isEqualToString:@""]||statuscode==nil||statuscode==NULL)
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Failed to get Profile 400" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else 
         
         */
         if (status==1)
            
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            user_profile_str = [dict objectForKey:@"createResult"];
            
           
            @try {
                NSLog(@"ened");
                
                if([user_profile_str intValue]==0){
                    updated=1;
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Updated Succesfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                    [self userProfileViewService];
                    
                }else if ([user_profile_str intValue]==1){
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Updation failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                }
           /*
                NSString  *cid_string=[user_profile_dic objectForKey:@"customer_id"];
                NSLog(@"cid_string mani:%@",cid_string);
                cidvalue_store = [cid_string intValue];
                NSLog(@"cid value check:%d",cidvalue_store);
                
                NSString  *firstname_string=[user_profile_dic objectForKey:@"firstname"];
                NSLog(@"firstname_string mani:%@",firstname_string);
                firstname_txtfeild.text = [[NSString alloc]initWithString:firstname_string];
                
                NSString  *lastname_string=[user_profile_dic objectForKey:@"lastname"];
                NSLog(@"lastname_string mani:%@",lastname_string);
                lastname_txtfeild.text = [[NSString alloc]initWithString:lastname_string];
                
                
               // NSString  *password_str=[user_profile_dic objectForKey:@"password"];
                //NSLog(@"password_str mani:%@",password_str);
                
                
                NSString  *email_str=[user_profile_dic objectForKey:@"email"];
                NSLog(@"email mani:%@",email_str);
                global_email_store = [[NSString alloc]initWithString:email_str];
                password_txtfeild.text = [[NSString alloc]initWithString:email_str];
              */
                /*
                NSString  *mobile_str=[user_profile_dic objectForKey:@"middlename"];
                NSLog(@"mobile_str mani:%@",mobile_str);
                
                mobile_txtfeild.text =[[NSString alloc]initWithString:mobile_str];
                
                
                NSString  *street_str=[user_profile_dic objectForKey:@"gender"];
                NSLog(@"street_str mani:%@",street_str);
                street_txtfeild.text = [[NSString alloc]initWithString:street_str];
                
                
                NSString  *postal_str=[user_profile_dic objectForKey:@"dob"];
                NSLog(@"postal_str mani:%@",postal_str);
                pincode_txtfeild.text = [[NSString alloc]initWithString:postal_str];
                */
            
                 //[self updateloginDB];
                
                }
            @catch (NSException *exception) {
                NSLog(@"Exception:%@",exception);
            }
            @finally {
                NSLog(@"finnaly block");
            }
            
            
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Updation failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        
    }
}
-(void)userProfileViewService{
    
    
    //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //hud.labelText = @"Loading.....";
    
    NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/customer/info/?customer=%@",logged_user_id];
    
    NSLog(@"str_country:%@",str_country);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    
    NSError *jsonError;
    NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:kNilOptions
                                                           error:&jsonError];
    
    NSLog(@"dict:%@",dict);
    
    
    if (dict==nil||dict==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    
    else {
        
        NSDictionary *user_profile_dic;
        NSString *statuscode;
        NSString *message;
        
        
            statuscode = [dict objectForKey:@"statuscode"];
            message = [dict objectForKey:@"message"];
            NSLog(@"CreateResult View:%@",[dict objectForKey:@"createResult"]);
        
        int status = [statuscode intValue];
        
       /*
        if ([statuscode isEqualToString:@"(null)"]||[statuscode isEqualToString:@""]||statuscode==nil||statuscode==NULL)
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Failed to get Profile 400" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else
        */
        if (status==1&&[message isEqualToString:@"Authentication Success."])
            
        {
           // [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            
            
            @try {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                user_profile_dic = [dict objectForKey:@"createResult"];
                
                NSString  *cid_string=[user_profile_dic objectForKey:@"customer_id"];
                NSLog(@"cid_string mani:%@",cid_string);
                
                NSString  *firstname_string=[user_profile_dic objectForKey:@"firstname"];
                NSLog(@"firstname_string mani:%@",firstname_string);
                firstname_txtfeild.text = [[NSString alloc]initWithString:firstname_string];
                
                NSString  *lastname_string=[user_profile_dic objectForKey:@"lastname"];
                NSLog(@"lastname_string mani:%@",lastname_string);
                lastname_txtfeild.text = [[NSString alloc]initWithString:lastname_string];
                left_menu_profile_name.text = firstname_txtfeild.text;
                
                logged_username = [NSString stringWithFormat:@"%@",[firstname_string stringByAppendingFormat:@"%@ %@",@" ",lastname_string]];
                NSLog(@"Logged User Name Service:%@",logged_username);
                self.email_lbl.text = logged_username;
              // NSString  *password_str=[user_profile_dic objectForKey:@"password_hash"];
                //NSLog(@"password_str mani:%@",password_str);
                //logged_user_pass = [[NSString alloc]initWithString:password_str];
                
                NSString  *email_str=[user_profile_dic objectForKey:@"email"];
                NSLog(@"email mani:%@",email_str);
                global_email_store = [[NSString alloc]initWithString:email_str];
                //password_txtfeild.text = [[NSString alloc]initWithString:email_str];
                left_menu_profile_email_lbl.text = global_email_store;
                /*
                NSString  *mobile_str=[user_profile_dic objectForKey:@"middlename"];
                NSLog(@"mobile_str mani:%@",mobile_str);
                
                 mobile_txtfeild.text =[[NSString alloc]initWithString:mobile_str];
                
                
                NSString  *street_str=[user_profile_dic objectForKey:@"gender"];
                NSLog(@"street_str mani:%@",street_str);
                street_txtfeild.text = [[NSString alloc]initWithString:street_str];
                
                
                NSString  *postal_str=[user_profile_dic objectForKey:@"dob"];
                NSLog(@"postal_str mani:%@",postal_str);
                pincode_txtfeild.text = [[NSString alloc]initWithString:postal_str];
               
         */
                if (updated==1) {
                    NSLog(@"update db");
                    [self updateloginDB];
                }else{
                    [self readlogin];
                }
         }
            @catch (NSException *exception) {
                NSLog(@"Exception:%@",exception);
            }
            @finally {
                NSLog(@"finnaly block");
            }
        }else if(status==2&&[message isEqualToString:@"Error in Authentication."]){
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Failed to get Profile 400" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        
    }
    
}



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"response:%@",response);
}

#pragma mark Database Path
- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"dentistkart.sqlite"];
    return writableDBPath;
}

-(void)updateloginDB{
    
    NSLog(@"enter in updated login db");
    
    //bool success;
   // sqlite3_stmt *statement = NULL;
    /*
   // const char *dbpath = [database UTF8String];
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database) != SQLITE_OK)
    {
                   NSLog(@"Exitsing data, Update Please");
        if (statement==nil) {
            const char *sql = "UPDATE login set login = ?, passwd = ?, email = ?, WHERE userid = ?";
            if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
                NSAssert1(0, @"error while creating update statement. '%s'", sqlite3_errmsg(database));
            
        }
        
                sqlite3_bind_text(statement, 1, [logged_username UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(statement, 2, [logged_user_pass UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(statement, 3, [global_email_store UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(statement, 4, [logged_user_id UTF8String], -1, SQLITE_TRANSIENT);
        [self readlogin];
        if (SQLITE_DONE != sqlite3_step(statement))
             NSAssert1(0, @"error while  updating data. '%s'", sqlite3_errmsg(database));
             else
                 //Reset the update statement
                 sqlite3_reset(statement);
                sqlite3_close(database);
               statement=nil;
        updated=0;
        
            //}
            
    }else{
        sqlite3_close(database);
    }
    
    
    
    */
    
    
    sqlite3_stmt *updateStmt;
    const char *dbpath = [[self dataFilePath] UTF8String];
    if(sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        const char *sql = "update login Set login = ?, passwd = ?, email = ? Where userid=?";
        if(sqlite3_prepare_v2(database, sql, -1, &updateStmt, NULL)==SQLITE_OK){
            sqlite3_bind_text(updateStmt, 1, [logged_username UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(updateStmt, 2, [logged_user_pass UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(updateStmt, 3, [global_email_store UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(updateStmt, 4, [logged_user_id UTF8String], -1, SQLITE_TRANSIENT);
            
        }
    }
    char* errmsg;
    sqlite3_exec(database, "COMMIT", NULL, NULL, &errmsg);
    
    if(SQLITE_DONE != sqlite3_step(updateStmt)){
        NSLog(@"Error while updating. %s", sqlite3_errmsg(database));
    }
    else{
       // [self clearClick:nil];
    }
    sqlite3_finalize(updateStmt);
    sqlite3_close(database);
    
    [self readlogin];
    
    

}

-(void)readlogin
{
    NSLog(@"Entered in read login");
    NSString *query = [[NSString alloc] initWithFormat:@"select * from login;"];
    sqlite3_stmt *stmt;
    int x = sqlite3_prepare_v2(database,[query UTF8String],-1, &stmt, nil);
    if (x == SQLITE_OK)
    {
        @try {
            
            // Loop through the results and add them to the feeds array
            while(sqlite3_step(stmt) == SQLITE_ROW)
            {
                
                NSString *loginid_str = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 1)];
                NSLog(@"loginstr:%@",loginid_str);
                logged_user_id = [[NSString alloc]initWithFormat:@"%@",loginid_str];
                
                NSString *loginstr = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 2)];
                NSLog(@"loginstr:%@",loginstr);
                logged_username=[[NSString alloc]initWithFormat:@"%@",loginstr];
                
               // NSString *loginpassstr = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 3)];
                logged_user_pass = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 3)];
               // logged_password=[[NSString alloc]initWithFormat:@"%@",loginpassstr];
                
                global_email_store = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 4)];
                NSLog(@"global_email_store:%@",global_email_store);
                NSLog(@"loginpass:%@",logged_user_pass);
            }
           // logged_usrname_show_lbl.text = logged_username;
            self.email_lbl.text = logged_username;
            self.mobile_lbl.text = global_email_store;
        }
        @catch (NSException *exception) {
            NSLog(@"Exception DB:%@",exception);
        }
        @finally {
            NSLog(@"entered in final block");
        }
        
    }
    sqlite3_finalize(stmt);
    //global_user_logedin_status=@"Yes";
    
}
- (IBAction)login_signup_click:(id)sender{
}

- (IBAction)cancel_return_click:(id)sender{
}

- (IBAction)whishlist_click:(id)sender{
}
- (IBAction)myorders_click:(id)sender{
}

- (IBAction)profile_click:(id)sender{
}
- (IBAction)myaddress_click:(id)sender{
}
- (IBAction)policies_click:(id)sender{
}
- (IBAction)contactus_click:(id)sender{
}
- (IBAction)drop_down_click_user:(id)sender{
    //UIButton*tappedButton =  (UIButton*)sender;
    
   // MyAccountView
    NSLog(@"cliked");
    [self callMyAccountPage];
    NSLog(@"After Cliked");
    /*
    if(tappedButton.tag ==1){
        //drop_down_view.hidden=NO;
        leftmenulist_view.hidden=NO;
        [drop_down_btn_pro setTag:2];
        
    }else if(tappedButton.tag ==2){
        leftmenulist_view.hidden=YES;
        [drop_down_btn_pro setTag:1];
        //drop_down_view.hidden=YES;
    }
     */
    
    NSLog(@"user name:%@",logged_username);
}

- (BOOL)validateEmail:(NSString *)candidate
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}

-(void)emailValidationCheck{
    
    if ([self validateEmail:password_txtfeild.text])
    {
        
        //[self check_user];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please use valid email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}


-(void)validationfeilds{
    if ([firstname_txtfeild.text isEqualToString:@""]||[firstname_txtfeild.text isEqualToString:@"(null)"]||firstname_txtfeild.text==nil||firstname_txtfeild.text==NULL||[firstname_txtfeild.text isEqualToString:@""]||[firstname_txtfeild.text isEqualToString:@"(null)"]||firstname_txtfeild==nil||firstname_txtfeild.text==NULL||[lastname_txtfeild.text isEqualToString:@""]||[lastname_txtfeild.text isEqualToString:@"(null)"]||lastname_txtfeild.text==nil||lastname_txtfeild.text==NULL||[lastname_txtfeild.text isEqualToString:@""]||[lastname_txtfeild.text isEqualToString:@"(null)"]||lastname_txtfeild.text==nil||lastname_txtfeild.text==NULL)
    {
      [self alertShow];
        NSLog(@"login username db :%@",lastname_txtfeild.text);
        
    }
    /*
    else if ([password_txtfeild.text isEqualToString:@""]||[password_txtfeild.text isEqualToString:@"(null)"]||password_txtfeild.text==nil||password_txtfeild.text==NULL)
    {
        //[self emailValidationCheck];
        NSLog(@"login email db :%@",password_txtfeild.text);
    }
     */
     else{
        //[self createAccount];
        [self updateUserProfileService];
    }
    
}


-(void)alertShow{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"All feilds are mandatory" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}


- (IBAction)Modify_user_account_click:(id)sender {
    
    NSLog(@"Modify Btn Clicked");
    //update_check=1;
    //[self updateUserProfile];
    [self validationfeilds];
    
}



- (IBAction)products_btn_click:(id)sender {
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    
    [self presentViewController:pvc animated:YES completion:nil];
}


- (IBAction)cart_btn_click:(id)sender {
    CartVC * cvc = [[[CartVC alloc]init]autorelease];
    [self presentViewController:cvc animated:YES completion:nil];
    [cvc release];
    
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

- (IBAction)closeusermenupop:(id)sender {
    drop_down_view.hidden=YES;
}
- (IBAction)dissmisKeyboard:(id)sender {
    NSLog(@"entered in dissmisskeyboard");
    CGRect frame = scrollsignup.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    frame.origin.x = 0;
    frame.origin.y = 50;
    scrollsignup.frame = frame;
    
    [UIView commitAnimations];
    
    [self dismissKeyboardPopup];
}
-(void)dismissKeyboardPopup{
    
    [firstname_txtfeild resignFirstResponder];
    [lastname_txtfeild resignFirstResponder];
    [password_txtfeild resignFirstResponder];
    [pincode_txtfeild resignFirstResponder];
    [street_txtfeild resignFirstResponder];
    [mobile_txtfeild resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (textField==firstname_txtfeild)
    {
        [firstname_txtfeild resignFirstResponder];
        NSLog(@" should return enter in pincode");
        CGRect frame = scrollsignup.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        scrollsignup.frame = frame;
        
        [UIView commitAnimations];
        
        
    }
    
    
    else if (textField==lastname_txtfeild)
    {
        [lastname_txtfeild resignFirstResponder];
        CGRect frame = scrollsignup.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        scrollsignup.frame = frame;
        
        [UIView commitAnimations];
        
    }else if (textField==password_txtfeild) {
        
        CGRect frame = scrollsignup.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 50;
        scrollsignup.frame = frame;
        
        [UIView commitAnimations];
        
        
    }
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.modify_btn.enabled=YES;
    NSLog(@"textFieldShouldBeginEditing");
    
    if (textField==firstname_txtfeild)
    {
        NSLog(@"enter in pincode");
        /*
        CGRect frame = scrollsignup.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 0;
        scrollsignup.frame = frame;
        
        [UIView commitAnimations];
         */
        
    }
    
    
    else if (textField==lastname_txtfeild)
    {
        NSLog(@"enter in street_txtfeild");
        /*
        CGRect frame = scrollsignup.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 0;
        scrollsignup.frame = frame;
        
        [UIView commitAnimations];
         */
        
    }
    else if (textField==password_txtfeild) {
       /*
        NSLog(@"enter in mobile_txtfeild");
        CGRect frame = scrollsignup.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        frame.origin.y = 0;
        scrollsignup.frame = frame;
        
        [UIView commitAnimations];
        */
        
    }
    
    
    return YES;
    
    
    
}
- (void)viewDidUnload
{
    
    
    
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

-(void)callDentistKartInfo{
    DeintistkartInfoVC *hpi = [[DeintistkartInfoVC alloc]initWithNibName:@"DeintistkartInfoVC" bundle:[NSBundle mainBundle]];
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
     pageIdentify_str=@"MyAccountEditVC";
    addcartcheckint=2;
    [self openCartPage];
}

-(void)openCartPage{
    
    CartVC *cvclocal = [[[CartVC alloc]init]autorelease];
    [self presentViewController:cvclocal animated:YES completion:nil];
    [cvclocal release];
    
}

- (IBAction)searchBtnClick:(id)sender {
     pageIdentify_str=@"MyAccountEditVC";
    SearchVC*svc = [[[SearchVC alloc]init]autorelease];
    [self presentViewController:svc animated:YES completion:nil];
    [svc release];
}



- (void)dealloc {
    [_profile_icon release];
    [_email_lbl release];
    [_mobile_lbl release];
    [_leftmenu_underview release];
    [_show_user_not_log_view release];
    [_dentistkartname_lbl release];
    [super dealloc];
}
@end
