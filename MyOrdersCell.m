//
//  MyOrdersCell.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 02/05/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import "MyOrdersCell.h"

@implementation MyOrdersCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_orderid_lbl release];
    [_orderdate_lbl release];
    [_orderdatevalue_lbl release];
    [_orderqty_lbl release];
    [_orderqtyvalue_lbl release];
    [_status_title_lbl release];
    [_status_value_lbl release];
    [_ordertotaltitle_lbl release];
    [_ordertotalvalue_lbl release];
    [_orderbtn release];
    [super dealloc];
}
@end
