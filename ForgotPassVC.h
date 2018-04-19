//
//  ForgotPassVC.h
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 24/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPassVC : UIViewController{

}
@property (retain, nonatomic) IBOutlet UITextField *forgottxtfeild;
@property (retain, nonatomic) IBOutlet UILabel *forgot_pass_lbl;
@property (retain, nonatomic) IBOutlet UIButton *submit_btn;
@property (retain, nonatomic) IBOutlet UILabel *dentistkart_lbl;
@property (retain, nonatomic) IBOutlet UILabel *dentist_mega_store_lbl;
- (IBAction)forgotSubmit:(id)sender;

@end
