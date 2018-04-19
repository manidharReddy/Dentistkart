//
//  AddressViewCell.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 02/05/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *myaddrusername_lbl;
@property (retain, nonatomic) IBOutlet UITextView *myaddraddress_txtview;
@property (retain, nonatomic) IBOutlet UILabel *myaddrtelephone_lbl;
@property (retain, nonatomic) IBOutlet UIButton *myaddredit_btn;
@property (retain, nonatomic) IBOutlet UIButton *myaddrremove_btn;

@end
