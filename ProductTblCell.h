//
//  ProductTblCell.h
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 18/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTblCell : UITableViewCell{


    IBOutlet UILabel *product_price;
    IBOutlet UIImageView *product_img;
    IBOutlet UILabel *product_name;
    IBOutlet UIButton *addcart_btn;
}
@property (retain, nonatomic) IBOutlet UILabel *product_desc_title;
@property (retain, nonatomic) IBOutlet UILabel *specialprice_lbl;
@property (retain, nonatomic) IBOutlet UILabel *stock_data;

@property (retain, nonatomic) IBOutlet UITextField *qtytxtfeild;
@property (retain, nonatomic) IBOutlet UIButton *addcart_btn;
@property (retain, nonatomic) IBOutlet UIView *cellview;
@property (retain, nonatomic) IBOutlet UILabel *product_price;
@property (retain, nonatomic) IBOutlet UILabel *product_name;
@property (retain, nonatomic) IBOutlet UIImageView *product_img;

@property (retain, nonatomic) IBOutlet UILabel *perkg_lbl;
@property (retain, nonatomic) IBOutlet UIView *cellfirstview;

@property (retain, nonatomic) IBOutlet UIView *cellsecondview;
@property (retain, nonatomic) IBOutlet UITextView *productdesc_txtview;
@property (retain, nonatomic) IBOutlet UIButton *addtocart_btn;

@end
