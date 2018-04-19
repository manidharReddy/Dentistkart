//
//  StartingVC.m
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 27/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import "StartingVC.h"
#import "ProductsViewController.h"
#import "AppDelegate.h"

@interface StartingVC ()

@end

@implementation StartingVC
@synthesize Starting_view,mango_subtitle_lbl,mango_fresh_welcome_lbl,mangofresh_img,app_icon_img,continue_btn,mango_second_sub_lbl,mango_third_sub_lbl;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /*
    [self.view addSubview:Starting_view];
    [Starting_view setBackgroundColor:[UIColor colorWithRed:250/255.0 green:241/250.0 blue:140/250.0 alpha:1]];
    mango_fresh_welcome_lbl.font = [UIFont fontWithName:@"Santor" size:22.0f];
    mango_subtitle_lbl.font = [UIFont fontWithName:@"Santor" size:14.0f];
    mango_subtitle_lbl.textColor = [UIColor colorWithRed:3/255.0 green:132/255.0 blue:252/255.0 alpha:1];
    
    mango_second_sub_lbl.font = [UIFont fontWithName:@"Santor" size:14.0f];
    mango_second_sub_lbl.textColor = [UIColor colorWithRed:3/255.0 green:132/255.0 blue:252/255.0 alpha:1];
    
    mango_third_sub_lbl.font = [UIFont fontWithName:@"Santor" size:14.0f];
    mango_third_sub_lbl.textColor = [UIColor colorWithRed:3/255.0 green:132/255.0 blue:252/255.0 alpha:1];
     */
    [self performSelector:@selector(callMainScreen) withObject:nil afterDelay:1.0];
    
    
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


-(void)callMainScreen{
    //ProductsViewController *pvc = [[ProductsViewController alloc]initWithNibName:@"ProductsViewController" bundle:[NSBundle mainBundle]];
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
   // [self.navigationController pushViewController:pvc animated:YES];
    [self presentViewController:pvc animated:YES completion:nil];
    NSLog(@"continue_btn_click2");

}

- (void)dealloc {
        [super dealloc];
}
- (IBAction)continue_btn_click:(id)sender {
    NSLog(@"continue_btn_click");
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    [self presentViewController:pvc animated:YES completion:nil];
        NSLog(@"continue_btn_click2");
}
@end
