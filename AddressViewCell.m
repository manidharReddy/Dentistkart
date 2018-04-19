//
//  AddressViewCell.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 02/05/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import "AddressViewCell.h"

@implementation AddressViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_myaddrusername_lbl release];
    [_myaddraddress_txtview release];
    [_myaddrtelephone_lbl release];
    [_myaddredit_btn release];
    [_myaddrremove_btn release];
    [super dealloc];
}
@end
