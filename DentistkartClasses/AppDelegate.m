//
//  AppDelegate.m
//  iDate
//
//  Created by D M R on 07/08/12.
//  Copyright (c) 2012 iHubTechnologies. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "ProductsViewController.h"
#import "StartingVC.h"
//#import "GooglePlusSignIn.h"
//#import "GooglePlusSignInButton.h"
//#import <FacebookSDK/FacebookSDK.h>
#import <sqlite3.h>

//#import "JSON.h"
//#import "JSON1.h"
//#import "WibmoSDK.h"
@implementation AppDelegate

@synthesize window = _window;

@synthesize productviewcontroller;
@synthesize navController,starting_VC;
//@synthesize signInButton = signInButton_;
//@synthesize auth = auth_;
//@synthesize share = share_;

// DO NOT USE THIS CLIENT ID. IT WILL NOT WORK FOR YOUR APP.
// Please use the client ID created for you by Google.
//static NSString * const kClientID = @"946601952656.apps.googleusercontent.com";

//static NSString * const kClientSecret = @"vaUpRsHrr6cNYmcirRq-1tkG";

#define partnerID @"10";


//702427597477.apps.googleusercontent.com
//GfX0L2Ue9ev9st3zTIU7WKQ7
/*
+ (NSString *)clientID {
    
    NSLog(@"kclientID:%@",kClientID);
    return kClientID;
}

+ (NSString *)ClientSecret {
    return kClientSecret;
}
*/
/*
-(void)droptable{
    
    
    sqlite3_stmt *stmt2;
    NSString *update;
    
    
    //update=[[NSString alloc]initWithFormat:@"delete from cart;"];
    update=[[NSString alloc]initWithFormat:@"DROP TABLE cart;"];
    
    NSLog(@"upadte:%@",update);
    int x = sqlite3_prepare_v2(database, [update UTF8String], -1, &stmt2, nil);
    NSLog(@"x=%d",x);
    if (sqlite3_step(stmt2) != SQLITE_DONE)
        NSLog(@"Deletion Error.");
    sqlite3_finalize(stmt2);
    
    
}
*/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // global_partnerID_str = partnerID;
    
    
    
    // Override point for customization after application launch.
    
    //[FBLoginView class];
    //[FBProfilePictureView class];
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database) != SQLITE_OK)
    {
        sqlite3_close(database);
        NSLog(@"Failed to open db.");
    }
    else
        NSLog(@"Open DB");
    
    //Create Status Msg
    char *errorMsg;
    NSString *createSQL = @"Create table if not exists login(id integer primary key AUTOINCREMENT,userid text,login text,passwd text,email text);";
    if (sqlite3_exec (database, [createSQL UTF8String],NULL, NULL, &errorMsg) != SQLITE_OK)
    {
        sqlite3_close(database);
        NSLog(@"Error creating login table: %s",errorMsg);
    }
    
    //[self droptable];
    //Create Status Msg
    char *errorMsgCart;
    NSString *createSQLCart = @"Create table if not exists cart(id integer primary key AUTOINCREMENT,cartid text);";
    if (sqlite3_exec (database, [createSQLCart UTF8String],NULL, NULL, &errorMsgCart) != SQLITE_OK)
    {
        sqlite3_close(database);
        NSLog(@"Error creating cart table: %s",errorMsgCart);
    }
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.starting_VC = [[StartingVC alloc] initWithNibName:@"StartingVC" bundle:nil];
    //self.window.rootViewController = self.starting_VC;
    self.productviewcontroller = [[ProductsViewController alloc]initWithNibName:@"ProductsViewController" bundle:nil];
    navController=[[UINavigationController alloc] init];
    
    [[UIApplication sharedApplication]setStatusBarHidden:YES];
    [navController pushViewController:self.productviewcontroller animated:NO];
   self.window.rootViewController = self.navController;
   [self.window addSubview:navController.view];
    self.navController.navigationBar.hidden =YES;
    [self.window makeKeyAndVisible];
    return YES;

}




#pragma mark Database Path
- (NSString *)dataFilePath 
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"dentistkart.sqlite"];
    return writableDBPath;
     }
 
-(void)login_insert
{





}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    sqlite3_close(database); 
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
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

- (BOOL)application:(UIApplication *)iApplication openURL:(NSURL *)iURL sourceApplication:(NSString *)iSourceApplication
         annotation:(id)iAnnotation {
    if (iURL && [[iURL scheme] isEqualToString:@"pz52845681748451463115"]) {
      //  [[NSNotificationCenter defaultCenter] postNotificationName:PROCESS_INAPP_PAYMENT object:[iURL absoluteString]];
    }
    
    return YES;
}


@end
