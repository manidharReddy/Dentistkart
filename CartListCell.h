//
//  CartListCell.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 30/04/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartListCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *cartimageview;
@property (retain, nonatomic) IBOutlet UILabel *cartprodname_lbl;
@property (retain, nonatomic) IBOutlet UILabel *cartpricetitle_lbl;
@property (retain, nonatomic) IBOutlet UILabel *cartpricevalue_lbl;
@property (retain, nonatomic) IBOutlet UILabel *cartqty_lbl;
@property (retain, nonatomic) IBOutlet UITextField *cartqty_txtfld;
@property (retain, nonatomic) IBOutlet UIButton *cartqtyupdate_btn;
@property (retain, nonatomic) IBOutlet UIButton *cartremove_btn;

@end
