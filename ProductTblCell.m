//
//  ProductTblCell.m
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 18/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import "ProductTblCell.h"
#import "ProductsViewController.h"
#import "AppDelegate.h"
#import "CartVC.h"
@implementation ProductTblCell
@synthesize product_img,product_name,product_price,cellview,addcart_btn,perkg_lbl,qtytxtfeild;
- (void)awakeFromNib {
    // Initialization code
    //[cellview setBackgroundColor:[UIColor colorWithRed:250/255.0 green:241/250.0 blue:140/250.0 alpha:1]];
    [addcart_btn setBackgroundColor:[UIColor colorWithRed:79/255.0 green:194/255.0 blue:234/255.0 alpha:1]];
    addcart_btn.titleLabel.font = [UIFont fontWithName:@"Santor" size:16.0f];
    //[product_name setBackgroundColor:[UIColor colorWithRed:115/255.0 green:8/255.0 blue:6/255.0 alpha:1] ];
    product_name.textColor = [UIColor colorWithRed:115/255.0 green:8/255.0 blue:6/255.0 alpha:1];
    product_name.font = [UIFont fontWithName:@"Santor" size:14.0f];
    product_price.font = [UIFont fontWithName:@"Santor" size:14.0f];
    addcart_btn.layer.borderWidth=0.0;
    addcart_btn.layer.cornerRadius = 2.0;
    addcart_btn.layer.borderColor = [UIColor clearColor].CGColor;
    perkg_lbl.font = [UIFont fontWithName:@"Santor" size:14.0f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [product_img release];
    [product_name release];
    [product_price release];
    [addcart_btn release];
    [cellview release];
    
   
    [_cellfirstview release];
    [_cellsecondview release];
    [_productdesc_txtview release];
    [_stock_data release];
    [_specialprice_lbl release];
    [_product_desc_title release];
    [_addtocart_btn release];
    [super dealloc];
}

/*
- (IBAction)addcart_click:(id)sender {
    if ([global_user_logedin_status isEqualToString:@"Yes"]) {
            tappedButton_addcart_btn = (UIButton*)sender;
        NSLog(@"tappedButton_addcart_btn value:%ld",(long)tappedButton_addcart_btn.tag);
         ProductsViewController *pvcclick = [[ProductsViewController alloc]init];
        [pvcclick addToCart];
    
    } else if ([global_user_logedin_status isEqualToString:@"No"]) {
        ProductsViewController *pvc = [[ProductsViewController alloc]init];
        //[pvc viewDidLoad];
        [pvc show_popup_login];
        NSLog(@"cell ended Addcart");
        
    
    }
 
}
*/



@end
