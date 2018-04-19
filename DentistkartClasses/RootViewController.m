//
//  RootViewController.m
//  iDate
//
//  Created by D M R on 07/08/12.
//  Copyright (c) 2012 iHubTechnologies. All rights reserved.
//

#import "RootViewController.h"

#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "ProductsViewController.h"
#import "LoginViewController.h"
#import "MyAddressVC.h"

//@class Search_list;

#define ASYNC_IMAGE_TAG 9999
#define FONT_SIZE 18.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

#ifdef __IPHONE_6_0
# define ALIGN_CENTER NSTextAlignmentCenter
# define LINE_BREAK_WORD_WRAP NSLineBreakByWordWrapping
#else
# define ALIGN_CENTER UITextAlignmentCenter
# define LINE_BREAK_WORD_WRAP UILineBreakModeWordWrap
#endif
@interface RootViewController ()

@end

@implementation RootViewController
@synthesize signup_view, scrollsignup,scroll_underview,username_txtfield,email_txtfield,pass_txtfield,signup_bar_lbl,usrname_txtfeild_icon,email_txtfeild_icon,pass_txtfeild_icon,register_btn,signup_lbl,cancel_btn,firstname_txtfield;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
    NSLog(@"viewwillAppera");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        NSLog(@"viewdidload");
    /*
    scrollsignup.scrollEnabled=YES;
    scrollsignup.userInteractionEnabled=YES;
    scrollsignup.pagingEnabled = YES;
    scrollsignup.showsHorizontalScrollIndicator = NO;
    scrollsignup.showsVerticalScrollIndicator = NO;
    scrollsignup.scrollsToTop = NO;
    scrollsignup.delegate = self;
    
    //scrollsignup.contentSize = scroll_underview.frame.size;
    //scrollsignup.contentSize = CGSizeMake(150, 1300);
    
    [self.view addSubview:scrollsignup];
    [scrollsignup addSubview:scroll_underview];
    */
    
    
    
    
    //[signup_bar_lbl setBackgroundColor:[UIColor colorWithRed:39/255.0 green:180/255.0 blue:245/255.0 alpha:1]];
    //signup_bar_lbl.font = [UIFont fontWithName:@"Santor" size:22.0f];
    
    //[cancel_btn setBackgroundColor:[UIColor colorWithRed:79/255.0 green:194/255.0 blue:234/255.0 alpha:1]];
    //cancel_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:25.0f];
    
    
    //[register_btn setBackgroundColor:[UIColor colorWithRed:79/255.0 green:194/255.0 blue:234/255.0 alpha:1]];
    
   
    
    register_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:25.0f];
    register_btn.layer.borderWidth=1.0;
    register_btn.layer.cornerRadius = 2.0;
    register_btn.layer.borderColor = [UIColor clearColor].CGColor;
    
    signup_lbl.font = [UIFont fontWithName:@"Santor" size:22.0f];
    //signup_lbl.textColor = [UIColor colorWithRed:115/255.0 green:8/255.0 blue:6/255.0 alpha:1] ;
    
   // [scroll_underview setBackgroundColor:[UIColor colorWithRed:250/255.0 green:241/250.0 blue:140/250.0 alpha:1]];
    
    
   // self.dentistkart_lbl.adjustsFontSizeToFitWidth=YES;
    
    
    self.dentistkart_lbl.font= [UIFont systemFontOfSize:[self screenSize].width/10];
    self.dentalmegastore_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.signup_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    
    self.username_txtfield.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.pass_txtfield.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.pass_txtfield.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.reenterpasswrd.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.firstname_txtfield.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.email_txtfield.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.login_here_lbl.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.already_login_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    self.register_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    
    //register_btn.userInteractionEnabled=FALSE;
    //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //hud.labelText = @"Signup....";
}
-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

/*
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"rotated enter");
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    // [self loadVisiblePages];
    
    
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
            [self.scrollsignup setContentSize:CGSizeMake([self screenSize].width, [self screenSize].width)];
            
            NSString* viewheight_str = [[NSString alloc]initWithFormat:@"%f",[self screenSize].width];
            
            NSDictionary *views = @{@"scroll_underview":scroll_underview};
            NSDictionary *metrics = @{@"height" : viewheight_str};
            [self.scrollsignup addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scroll_underview(height)]|" options:kNilOptions metrics:metrics views:views]];
            
            
        }else{
            //self.heightCon.constant = 350;
            
            NSLog(@"enter in portrait");
        }
        
        
        
        
        //[self.scrollproduct addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[beeView(width)]|" options:kNilOptions metrics:metrics views:views]];
        
        
        
        [self viewDidLoad];
        
    }];
}
*/

-(void)createAccount{

   MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Signup....";
    
    NSString*str_country;
    
    if ([pass_txtfield.text isEqualToString:self.reenterpasswrd.text]) {
    
    
        //
str_country=[NSString stringWithFormat:@"https://www.dentistkart.com/webservice/customer/create/?email=%@&firstname=%@&lastname=%@&password=%@",email_txtfield.text,firstname_txtfield.text,username_txtfield.text,pass_txtfield.text];
    str_country = [str_country stringByReplacingOccurrencesOfString:@" " withString:@""];
       str_country = [str_country stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
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
    NSLog(@"dict:%@",dict);
    
    
        if (dict==nil||dict==NULL)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        else {
            
           // NSString *create_result_str;
            NSString *statuscode;
            NSString *message;
                statuscode = [dict objectForKey:@"statuscode"];
                message = [dict objectForKey:@"message"];
                NSLog(@"info:%@",[dict objectForKey:@"createResult"]);
                
                    int status = [statuscode intValue];
            if (status==1)
            {
                NSLog(@"status 1 login");
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                                NSLog(@"status 2 login");
                /*
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Thank You for Signup" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                [alert release];
                 */
                    NSLog(@"status 3 login");
                logged_user_id = [dict objectForKey:@"createResult"];
                [self checkUserUpdated];
                [self callproductsPage];
                NSLog(@"status 4 login:%@",logged_user_id);
            }else if (status==2){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
                /*
                if ([UIAlertController class])
                {
                    
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert title" message:create_result_str preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:ok];
                    
                    [self presentViewController:alertController animated:YES completion:nil];
                    
                }
                else
                {
                 */
                    
                    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Alert title" message:[dict objectForKey:@"createResult"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alert show];
                    
                //}
                
                
                
                //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:create_result_str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                //[alert show];
                
            }
        }
    }else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Alert title" message:@"Password doesnt match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];

    }
}


-(void)emailValidationCheck{

    if ([self validateEmail:email_txtfield.text])
    {
        
        //[self check_user];
        
    }
    else
    {
        if ([UIAlertController class])
        {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert title" message:@"Please use valid email address" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
        else
        {
            
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Alert title" message:@"Please use valid email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }
        
        /*
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please use valid email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
         */
    }
}


-(void)validationfeilds{
    if ([firstname_txtfield.text isEqualToString:@""]||[firstname_txtfield.text isEqualToString:@"(null)"]||firstname_txtfield.text==nil||firstname_txtfield.text==NULL||[firstname_txtfield.text isEqualToString:@""]||[firstname_txtfield.text isEqualToString:@"(null)"]||firstname_txtfield.text==nil||firstname_txtfield.text==NULL||[username_txtfield.text isEqualToString:@""]||[username_txtfield.text isEqualToString:@"(null)"]||username_txtfield.text==nil||username_txtfield.text==NULL||[username_txtfield.text isEqualToString:@""]||[username_txtfield.text isEqualToString:@"(null)"]||username_txtfield.text==nil||username_txtfield.text==NULL||[pass_txtfield.text isEqualToString:@""]||[pass_txtfield.text isEqualToString:@"(null)"]||pass_txtfield.text==nil||pass_txtfield.text==NULL)
    {
        [self alertShow];
        NSLog(@"login username db :%@",username_txtfield.text);

    }else if ([email_txtfield.text isEqualToString:@""]||[email_txtfield.text isEqualToString:@"(null)"]||email_txtfield.text==nil||email_txtfield.text==NULL)
    {
        [self emailValidationCheck];
        NSLog(@"login password db :%@",email_txtfield.text);
    }else{
        [self createAccount];
    }

}

-(void)alertShow{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"All feilds are mandatory" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)signup:(id)sender {
    NSLog(@"Signup....");
    [self validationfeilds];
}

	
- (IBAction)dissmisKeyboard:(id)sender {
    
    CGRect frame = scrollsignup.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    frame.origin.x = 0;
    frame.origin.y = 0;
    scrollsignup.frame = frame;
    
    [UIView commitAnimations];
    
    [self dismissKeyboardPopup];
}

- (IBAction)products_btn_click:(id)sender {
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    [self presentViewController:pvc animated:YES completion:nil];
}



-(void)signin{
    [self dismissKeyboardPopup];
    NSLog(@"signin method");
   MBProgressHUD*hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Signup....";
    
    
    //
    if ([pass_txtfield.text isEqualToString:self.reenterpasswrd.text]) {
    NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/customer/create/?email=\"%@\"&firstname=\"%@\"&lastname=\"%@\"&password=\"%@\"",email_txtfield.text,firstname_txtfield.text,username_txtfield.text,pass_txtfield.text];
    
    NSLog(@"str_country: sigin%@",str_country);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country]];
    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    
    //NSDictionary *dict=[returnString JSONValue];
    
    NSError*error=nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
    
    if (dict==nil||dict==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    
    else {
        
        NSString *create_result_str;
        NSString *statuscode;
        NSString *message;
        for (NSDictionary *info in dict)
        {
            create_result_str = [info objectForKey:@"createResult"];
            statuscode = [info objectForKey:@"statuscode"];
            message = [info objectForKey:@"message"];
            NSLog(@"info:%@",[info objectForKey:@"createResult"]);
            
        }
    
        if ([statuscode isEqualToString:@"1"]&&[message isEqualToString:@"Authentication Success."])
            
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            /*
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Thank You for Signup" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
             */
            logged_user_id = [NSString stringWithString:create_result_str];
            [self checkUserUpdated];
            [self callproductsPage];
            
        }else if ([statuscode isEqualToString:@"2"]&&[message isEqualToString:@"Error in Authentication."]){
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"User with this email already exist" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        
    }
    }else{
        
    }

}

-(void)checkUserUpdated{
    NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/customer/list/"];
    
    NSLog(@"str_country:%@",str_country);
    
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
        create_result_dict = [dict objectForKey:@"createResult"];
        statuscode = [dict objectForKey:@"statuscode"];
        message = [dict objectForKey:@"message"];
        NSLog(@"info:%@",[dict objectForKey:@"createResult"]);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."])
            
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            NSString*strcheck = [create_result_dict objectForKey:@"login_information"];
            
            if([strcheck isEqualToString:@"Data Updated Successfully"]){
                //[self login_call];
                [self callloginPage];
                //[self callproductsPage];
            }else{
                
            }
            
            
        }else if (status==2&&[message isEqualToString:@"Email and Password Authentication Error."]){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
    }
    
}



-(void)dismissKeyboardPopup{
    [username_txtfield resignFirstResponder];
    [email_txtfield resignFirstResponder];
    [pass_txtfield resignFirstResponder];
}

- (BOOL)validateEmail:(NSString *)candidate
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}



- (IBAction)loginClick:(id)sender {
    //[self callproductsPage];
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [self presentViewController:lvc animated:YES completion:nil];
}

- (IBAction)cancel_btn_click:(id)sender {
    
    forgotpassback=@"1";
    [self callproductsPage];
    
    ProductsViewController *pvcobj = [[ProductsViewController alloc]init];
    [pvcobj show_popup_login];
    
}

-(void)callproductsPage{
    
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    
    [self presentViewController:pvc animated:YES completion:nil];
    
    //ProductsViewController *pvcobj = [[ProductsViewController alloc]init];
    //[pvcobj show_popup_login];
}
-(void)callloginPage{
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [lvc profileView];
    //[self callMyAddressPage];
}
-(void)callMyAddressPage{
    MyAddressVC*mvc = [[MyAddressVC alloc]init];
    [self presentViewController:mvc animated:YES completion:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
////////////////////////////////////Message Send In Background///////////////////////////
/*
-(void)sendMsgBackground{
    SKPSMTPMessage * skpsmsg = [[SKPSMTPMessage alloc]init];
    
    skpsmsg.fromEmail=@"noreply@dentistkart.com";
    skpsmsg.toEmail=self.email_txtfield.text;
    skpsmsg.relayHost=@"ssl://mail.dentistkart.com";
    skpsmsg.requiresAuth=YES;
    skpsmsg.login=@"noreply@dentistkart.com";
    skpsmsg.pass=@"noreply12345";
    skpsmsg.subject=@"Successfully registered in dentiskart";
    skpsmsg.wantsSecure=YES;
    skpsmsg.delegate=self;
    
    //////////////////////////////Message Body//////////////////////////
    
    NSString*data_str = [[NSString alloc]initWithFormat:@"Thanks for singuping in DentistkartApp using iOS. Your login details /n username:%@ and Password:%@",self.email_txtfield.text,self.pass_txtfield.text];
    
    NSString*messageBody = [NSString stringWithString:data_str];
    
    NSDictionary*plainMessage = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain", kSKPSMTPPartContentTypeKey,messageBody,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
    skpsmsg.parts = [NSArray arrayWithObjects:plainMessage, nil];
    
    [skpsmsg send];

}


-(void)messageSent:(SKPSMTPMessage *)message{
    NSLog(@"delegate - message sent");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message sent." message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}
// On Failure
-(void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error{
    // open an alert with just an OK button
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    NSLog(@"delegate - error(%ld): %@", (long)[error code], [error localizedDescription]);
}
*/

////////////////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if(interfaceOrientation == UIInterfaceOrientationPortrait)
    {
        return YES;
    }
    else if(interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        return YES;
    }
    else
    {
        return NO;
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
    
    if (textField==email_txtfield)
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
        
    }else if (textField==self.reenterpasswrd)
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

- (BOOL)textViewShouldReturn:(UITextView *)textView{

    NSLog(@"textViewShouldReturn");
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSLog(@"textViewShouldEndEditing");
    return YES;
}

- (void)dealloc {
    
    [_dentistkart_lbl release];
    [_dentalmegastore_lbl release];
    [_login_here_lbl release];
    [_already_login_lbl release];
    [_reenterpasswrd release];
    [super dealloc];
}


@end
