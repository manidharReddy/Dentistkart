//
//  CartListCell.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 30/04/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import "CartListCell.h"

@implementation CartListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_cartimageview release];
    [_cartprodname_lbl release];
    [_cartpricetitle_lbl release];
    [_cartpricevalue_lbl release];
    [_cartqty_lbl release];
    [_cartqty_txtfld release];
    [_cartqtyupdate_btn release];
    [_cartremove_btn release];
    [super dealloc];
}
@end
