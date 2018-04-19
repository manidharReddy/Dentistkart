//
//  OrdersViewCell.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 03/05/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import "OrdersViewCell.h"

@implementation OrdersViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_order_imageview release];
    [_orderprductname_lbl release];
    [_ordersku_lbl release];
    [_qty_lbl release];
    [_orderstatus_lbl release];
    [_orderstatusvalue_lbl release];
    [_orderarrow_btn release];
    [super dealloc];
}
@end
