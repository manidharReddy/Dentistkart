//
//  PolicyCell.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 20/02/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import "PolicyCell.h"

@implementation PolicyCell

-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//[self.textview setFont:[UIFont fontWithName:@"System" size:[self screenSize].width/10]];
  //  [UIFont fontWithName:@"Santor" size:22.0f];
    // Configure the view for the selected state
}

- (void)dealloc {
    [_textview release];
    [super dealloc];
}
@end
