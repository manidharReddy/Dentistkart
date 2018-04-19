//
//  StartingVC.h
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 27/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartingVC : UIViewController{
}
@property (retain, nonatomic) IBOutlet UILabel *mango_third_sub_lbl;
@property (retain, nonatomic) IBOutlet UILabel *mango_second_sub_lbl;
@property (retain, nonatomic) IBOutlet UILabel *mango_subtitle_lbl;

@property (retain, nonatomic) IBOutlet UILabel *mango_fresh_welcome_lbl;
@property (retain, nonatomic) IBOutlet UIImageView *mangofresh_img;
@property (retain, nonatomic) IBOutlet UIImageView *app_icon_img;
@property (retain, nonatomic) IBOutlet UIButton *continue_btn;
@property (retain, nonatomic) IBOutlet UIView *Starting_view;
- (IBAction)continue_btn_click:(id)sender;

@end
