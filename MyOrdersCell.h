//
//  MyOrdersCell.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 02/05/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrdersCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *orderid_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orderdate_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orderdatevalue_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orderqty_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orderqtyvalue_lbl;
@property (retain, nonatomic) IBOutlet UILabel *status_title_lbl;
@property (retain, nonatomic) IBOutlet UILabel *status_value_lbl;
@property (retain, nonatomic) IBOutlet UILabel *ordertotaltitle_lbl;
@property (retain, nonatomic) IBOutlet UILabel *ordertotalvalue_lbl;
@property (retain, nonatomic) IBOutlet UIButton *orderbtn;

@end
