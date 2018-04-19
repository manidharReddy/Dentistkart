//
//  LoginViewController.m
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 23/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import "LoginViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"
#import "ProductsViewController.h"
#import "MyAddressVC.h"
#import "CartVC.h"
#import "CategoriesViewController.h"
#import "CategoryProductsView.h"
#import "ProductDetails.h"
#import "ForgotPassVC.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize login_view,scrollslogin,scroll_underview,login_bar_lbl,forgotpass_link_btn,signup_link_btn,login_btn,username_txtfield,pass_txtfield,show_pass_btn,tab_view,login_lbl,login_subtitl_lbl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   /*
    scrollslogin.scrollEnabled=YES;
    scrollslogin.userInteractionEnabled=YES;
    scrollslogin.pagingEnabled = YES;
    scrollslogin.showsHorizontalScrollIndicator = NO;
    scrollslogin.showsVerticalScrollIndicator = NO;
    scrollslogin.scrollsToTop = NO;
    //scrollsignup.delegate = self;
    
    //scrollsignup.contentSize = scroll_underview.frame.size;
    // scrollsignup.contentSize = CGSizeMake(150, 1200);
    
    [self.view addSubview:scrollslogin];
    [scrollslogin addSubview:scroll_underview];
    */
    //tab_view.frame=CGRectMake(0,520, 320, 50);
    //[self.view addSubview:tab_view];
    
    
    //[login_bar_lbl setBackgroundColor:[UIColor colorWithRed:39/255.0 green:180/255.0 blue:245/255.0 alpha:1]];
    //login_bar_lbl.font = [UIFont fontWithName:@"Santor" size:22.0f];
    
    //[login_lbl setTextColor:[UIColor colorWithRed:115/255.0 green:8/255.0 blue:6/255.0 alpha:1]];
    //login_lbl.font = [UIFont fontWithName:@"Santor" size:30.0f];
    
    //[login_subtitl_lbl setTextColor:[UIColor colorWithRed:115/255.0 green:8/255.0 blue:6/255.0 alpha:1]];
  //  login_subtitl_lbl.font = [UIFont fontWithName:@"Santor" size:10.0f];
    
    //[forgotpass_link_btn setBackgroundColor:[UIColor colorWithRed:115/255.0 green:8/255.0 blue:6/255.0 alpha:1] ];
    
    //[signup_link_btn setBackgroundColor:[UIColor colorWithRed:115/255.0 green:8/255.0 blue:6/255.0 alpha:1] ];
    
    //[login_btn setBackgroundColor:[UIColor colorWithRed:79/255.0 green:194/255.0 blue:234/255.0 alpha:1]];

    //forgotpass_link_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:15.0f];
    //signup_link_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:15.0f];
  //login_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:25.0f];
    
    //[scroll_underview setBackgroundColor:[UIColor colorWithRed:250/255.0 green:241/250.0 blue:140/250.0 alpha:1]];
    
    self.show_passwrd_lbl.font =[UIFont systemFontOfSize:[self screenSize].width/25];
    self.dentistkart_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/10];
    self.dentalmegastore_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    
    self.login_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/15];
    self.login_subtitl_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    
    self.username_txtfield.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.pass_txtfield.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.forgotpass_link_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.signup_link_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    self.login_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    
    
    
}

-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
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


-(void)dismissKeyboardPopup{
    [username_txtfield resignFirstResponder];
    [pass_txtfield resignFirstResponder];
     
    
}
- (IBAction)dissmisKeyboard:(id)sender {
    
    [self dismissKeyboardPopup];
    // [sender resignFirstResponder];
}


-(void)login_call{
    
    //[self dismissKeyboardPopup];
    
    //[self logOut];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"logging....";
    
    
    //
    
    NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/login/?email=%@&password=%@",global_email_store,pass_txtfield.text];
    
    NSLog(@"str_country:%@",str_country);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    
    // NSDictionary *dict=[returnString JSONValue];
    NSError *jsonError;
    NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:kNilOptions
                                                           error:&jsonError];
    NSLog(@"Dict value:%@",dict);
    
    if (dict==nil||dict==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else {
        NSDictionary *create_result_dict;
        NSString *statuscode;
        NSString *message;
        
        statuscode = [dict objectForKey:@"statuscode"];
        message = [dict objectForKey:@"message"];
        NSLog(@"info:%@",[dict objectForKey:@"createResult"]);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"123klk");
            create_result_dict = [dict objectForKey:@"createResult"];
            NSLog(@"status 1 looo:%@",create_result_dict);
            logged_user_id  = [create_result_dict objectForKey:@"customer_id"];
            
            
            NSLog(@"check one 123");
            //loggedOrNot=1;
            [self profileView];
            NSLog(@"check one 12356");
            
            NSLog(@"check one 123wsde");
            
            //global_user_logedin_status=@"Yes";
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            //[self checkUserUpdated];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}

-(void)profileView{
    
    NSLog(@"profileView Enter");
    
    // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //hud.labelText = @"Loading.....";
    
    
    //
    
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
        NSLog(@"info:%@",[dict objectForKey:@"createResult"]);
        
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."])
            
        {
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            
            
            
            @try {
                
                user_profile_dic = [dict objectForKey:@"createResult"];
                NSString  *cid_string=[user_profile_dic objectForKey:@"customer_id"];
                NSLog(@"cid_string mani:%@",cid_string);
                logged_user_id = [[NSString alloc]initWithString:cid_string];
                
                
                NSString  *firstname_string=[user_profile_dic objectForKey:@"firstname"];
                NSLog(@"firstname_string mani:%@",firstname_string);
                
                logged_username= [[NSString alloc]initWithString:firstname_string];
                NSString  *lastname_string=[user_profile_dic objectForKey:@"lastname"];
                NSLog(@"lastname_string mani:%@",lastname_string);
                
                
                //logged_name_str =[[NSString alloc]initWithFormat:@"%@+%@",firstname_string,lastname_string];
                NSString  *password_hash=[user_profile_dic objectForKey:@"password_hash"];
                NSLog(@"password_str mani:%@",password_hash);
                login_pass_str = [[NSString alloc]initWithString:password_hash];
                
                NSString  *email_str=[user_profile_dic objectForKey:@"email"];
                NSLog(@"email mani:%@",email_str);
                global_email_store = [[NSString alloc]initWithString:email_str];
                
                
                NSString  *midlename_str=[user_profile_dic objectForKey:@"middlename"];
                NSLog(@"middle_str mani:%@",midlename_str);
                
                NSString  *gender_str=[user_profile_dic objectForKey:@"gender"];
                NSLog(@"gender_str mani:%@",gender_str);
                
                NSString  *dod_str=[user_profile_dic objectForKey:@"dob"];
                NSLog(@"dob_str mani:%@",dod_str);
                
                [self insertlogin_db];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                /*
                if ([customer_type_str isEqualToString:@"Customer"]) {
                    [self cartPage];
                }else{
                [self homePageCall];
                }
                 */
            }
            @catch (NSException *exception) {
                NSLog(@"Exception:%@",exception);
            }
            @finally {
                NSLog(@"finnaly block");
            }
            
            
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Failed to get Profile 400" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        
    }
    
    /*
     if (loggedOrNot==1) {
     NSLog(@"profileView Enter123");
     loggedOrNot=0;
     
     [pvc userProfileViewService];
     
     }else if(loggedOrNot==0){
     NSLog(@"profileView Entererdff");
     }
     */
    
}
-(void)addressPage{
    MyAddressVC*addrvc = [[MyAddressVC alloc]init];
    [self presentViewController:addrvc animated:YES completion:nil];
}
-(void)cartPage{
    CartVC* cvc = [[[CartVC alloc]init]autorelease];
    [self presentViewController:cvc animated:YES completion:nil];
    [cvc release];
}
-(void)CategoriesViewControllerPage{
    CategoriesViewController*cartvc = [[CategoriesViewController alloc]init];
    [self presentViewController:cartvc animated:YES completion:nil];
}
-(void)CategoryProductsViewPage{
    CategoryProductsView*cpv = [[CategoryProductsView alloc]init];
    [self presentViewController:cpv animated:YES completion:nil];
}
-(void)ProductDetailsPage{
    ProductDetails*pd = [[ProductDetails alloc]init];
    [self presentViewController:pd animated:YES completion:nil];
}
-(void)homePageCall{
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    [self presentViewController:pvc animated:YES completion:nil];
}

-(void)checkUserloginin{
    
    if ([username_txtfield.text isEqualToString:@""]||[username_txtfield.text isEqualToString:@"(null)"]||username_txtfield.text==nil||username_txtfield.text==NULL)
    {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter username " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }
    
    else if ([pass_txtfield.text isEqualToString:@""]||[pass_txtfield.text isEqualToString:@"(null)"]||pass_txtfield.text==nil||pass_txtfield.text==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter password " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else if([pass_txtfield.text length]>=6){
        
       global_email_store = username_txtfield.text;
        [self login_call];
       // [self close_popup_login];
       // NSLog(@"checkuserloginin:%d",addcartvalue);
    }else if ([pass_txtfield.text length]<6){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Password must contain at least 6 characters" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
}

-(void)checkUserlogininDB{
    
    if ([username_txtfield.text isEqualToString:@""]||[username_txtfield.text isEqualToString:@"(null)"]||username_txtfield.text==nil||username_txtfield.text==NULL)
    {
        
        NSLog(@"login username db :%@",username_txtfield.text);
        
    }
    
    else if ([pass_txtfield.text isEqualToString:@""]||[pass_txtfield.text isEqualToString:@"(null)"]||pass_txtfield.text==nil||pass_txtfield.text==NULL)
    {
        NSLog(@"login password db :%@",username_txtfield.text);
        
    }else{
        
        //[self login_call];
        NSLog(@"entred in db check");
        //global_user_logedin_status=@"Yes";
        //left_menu_profile_name.text = [NSString stringWithString:logged_username];
        //left_menu_profile_email_lbl.text = [NSString stringWithString:global_email_store];
        
        
        
        
    }
    
}

-(void)insertlogin_db
{
    sqlite3_stmt *stmt3;
    //char *errorMsg4;
    char *update4 = "insert into login values (?,?,?,?,?);";
    NSLog(@"Insert query:%s",update4);
    int x1 = sqlite3_prepare_v2(database, update4, -1, &stmt3, nil);
    NSLog(@"x1:%d",x1);
    if (x1 == SQLITE_OK)
    {
        sqlite3_bind_text(stmt3, 1, NULL,-1, NULL);
        sqlite3_bind_text(stmt3, 2, [logged_user_id UTF8String],-1, NULL);
        sqlite3_bind_text(stmt3, 3, [logged_username UTF8String],-1, NULL);
        sqlite3_bind_text(stmt3, 4, [login_pass_str UTF8String],-1, NULL);
        sqlite3_bind_text(stmt3, 5,[global_email_store UTF8String], -1, NULL);
       
        [self readlogin];
    }
    //logged_user_id = [[NSString alloc]initWithFormat:@"%@",user_id_str];
    //logged_username=[[NSString alloc]initWithFormat:@"%@",firstname_str];
    if (sqlite3_step(stmt3) != SQLITE_DONE){
        NSLog(@"login insertion in db failed");
    }else{
    [self readlogin];
    }
 //       [self readlogin];
        //NSLog(@"Error: %",errorMsg4);
        sqlite3_finalize(stmt3);
    
   // user_id_str=Nil;
    //firstname_str=Nil;
    login_pass_str=Nil;
    logged_name_str=Nil;
    
    // callMessageByTimer = [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(callMessage) userInfo:nil repeats:YES];
    
    
}


-(void)readlogin
{
    NSLog(@"Entered in read login");
    NSString *query = [[NSString alloc] initWithFormat:@"select * from login;"];
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
                
                NSString *loginid_str = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 1)];
                NSLog(@"loginstr:%@",loginid_str);
                logged_user_id = [[NSString alloc]initWithFormat:@"%@",loginid_str];
                
                NSString *loginstr = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 2)];
                NSLog(@"loginstr:%@",loginstr);
                logged_username=[[NSString alloc]initWithFormat:@"%@",loginstr];
                
                logged_name_str = [[NSString alloc]initWithFormat:@"%@",loginstr];
                NSString *loginpassstr = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 3)];
                
                logged_user_pass = [[NSString alloc]initWithFormat:@"%@",loginpassstr];
                NSLog(@"loginpass:%@",loginpassstr);
                
                global_email_store = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 4)];
                NSLog(@"global_email_store:%@",global_email_store);
        
            NSLog(@"login global_page_id:%@",global_page_id);
               /*
                if ([global_page_id isEqualToString:@"CartVC"]) {
                    NSLog(@" if login global_page_id:%@",global_page_id);
                     [self cartPage];
                }
                */
                /*
                else if ([global_page_id isEqualToString:@"MyAddressVC"]) {
                    NSLog(@" if login global_page_id:%@",global_page_id);
                     [self addressPage];
                } else if ([global_page_id isEqualToString:@"CategoriesViewController"]) {
                    NSLog(@" if login global_page_id:%@",global_page_id);
                    [self CategoriesViewControllerPage];
                } else if ([global_page_id isEqualToString:@"CategoryProductsView"]) {
                    NSLog(@" if login global_page_id:%@",global_page_id);
                    [self CategoryProductsViewPage];
                } else if ([global_page_id isEqualToString:@"ProductDetails"]) {
                    NSLog(@" if login global_page_id:%@",global_page_id);
                     [self ProductDetailsPage];
                } 
                 */
                 //else if ([global_page_id isEqualToString:@"ProductsViewController"]){
                    NSLog(@"home call");
                    [self homePageCall];
                //}
            
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
    
}




- (IBAction)forgot_pass_click:(id)sender {
    
    ForgotPassVC *fpvc = [[ForgotPassVC alloc]init];
    [self presentViewController:fpvc animated:YES completion:nil];
    
}

- (IBAction)signup_link_click:(id)sender {
    
    RootViewController *signup_view = [[RootViewController alloc]init];
    [self presentViewController:signup_view animated:YES completion:nil];
}

- (IBAction)login_btn_click:(id)sender {
     [self performSelector:@selector(checkUserloginin) withObject:nil afterDelay:0.5];
}

- (IBAction)show_pass_btn_click:(id)sender {
    UIButton *tappedButton = (UIButton*)sender;
    NSLog(@"show_pass_btn_click");
    if (tappedButton.tag==1)
    {
        NSLog(@"show_pass_btn_click 1");
        tappedButton.tag=2;
        [show_pass_btn setImage:[UIImage imageNamed:@"click_new.png"] forState:UIControlStateNormal];
        pass_txtfield.secureTextEntry=NO;
        
    }
    else if (tappedButton.tag==2)
    {
        NSLog(@"show_pass_btn_click 2");
        tappedButton.tag=1;
        [show_pass_btn setImage:[UIImage imageNamed:@"unclick_new.png"] forState:UIControlStateNormal];
        
        pass_txtfield.secureTextEntry=YES;
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn");
    CGRect frame = self.view.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    
    frame.origin.x = 0;
    frame.origin.y = 0;
    self.view.frame = frame;
    
    [UIView commitAnimations];
    
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing");
    
    if (textField==username_txtfield)
    {
        CGRect frame = self.view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        if ([self screenSize].width<500) {
            
            frame.origin.x = 0;
            frame.origin.y = -150;
            
            
        }else{
            
            frame.origin.x = 0;
            frame.origin.y = -200;
        }
        self.view.frame = frame;
        
        [UIView commitAnimations];
        
    }else if (textField==pass_txtfield)
    {
        CGRect frame = self.view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        if ([self screenSize].width<500) {
            
            frame.origin.x = 0;
            frame.origin.y = -150;
            
            
        }else{
            
            frame.origin.x = 0;
            frame.origin.y = -200;
        }
        self.view.frame = frame;
        
        [UIView commitAnimations];
        
    }
    
    return YES;
    
    
    
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    NSLog(@"textFieldShouldEndEditing");
    CGRect frame = self.view.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    
    frame.origin.x = 0;
    frame.origin.y = 0;
    self.view.frame = frame;
    
    [UIView commitAnimations];
    
    //[textField resignFirstResponder];
    return YES;
}




- (void)dealloc {
    [_dentistkart_lbl release];
    [_dentalmegastore_lbl release];
    [_show_passwrd_lbl release];
[super dealloc];
}
@end
