//
//  OrdersViewCell.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 03/05/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrdersViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *order_imageview;
@property (retain, nonatomic) IBOutlet UILabel *orderprductname_lbl;
@property (retain, nonatomic) IBOutlet UILabel *ordersku_lbl;
@property (retain, nonatomic) IBOutlet UILabel *qty_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orderstatus_lbl;
@property (retain, nonatomic) IBOutlet UILabel *orderstatusvalue_lbl;
@property (retain, nonatomic) IBOutlet UIButton *orderarrow_btn;

@end
