//
//  MenuSectionHeaderView.m
//  Example
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "MenuSectionHeaderView.h"

#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

@interface MenuSectionHeaderView ()
@property (retain, nonatomic) IBOutlet UIImageView *drop_down_img;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation MenuSectionHeaderView {
    BOOL isRotating;
}

@synthesize interactionDelegate = _interactionDelegate;

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.interactionDelegate userTapped:self];
}

-(void)openAnimated:(BOOL)animated {
    
    if (animated && !isRotating) {
        
        isRotating = YES;
        
        [UIView animateWithDuration:0.2 delay:0.0 options: UIViewAnimationOptionAllowUserInteraction |UIViewAnimationOptionCurveLinear animations:^{
            self.drop_down_img.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            isRotating = NO;
        }];
        
    } else {
        [self.layer removeAllAnimations];
        self.drop_down_img.transform = CGAffineTransformIdentity;
        isRotating = NO;
    }
    [self.drop_down_img setImage:[UIImage imageNamed:@"minusicon"]];
}

-(void)closeAnimated:(BOOL)animated {
    
    if (animated && !isRotating) {
        
        isRotating = YES;
        
        [UIView animateWithDuration:0.2 delay:0.0 options: UIViewAnimationOptionAllowUserInteraction |UIViewAnimationOptionCurveLinear animations:^{
            self.drop_down_img.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0f));
            
        } completion:^(BOOL finished) {
            isRotating = NO;
        }];
        
    } else {
        [self.layer removeAllAnimations];
        self.drop_down_img.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0f));
        isRotating = NO;
    }
    
    [self.drop_down_img setImage:[UIImage imageNamed:@"down_arrow"]];
}

- (void)dealloc {
    [_drop_down_img release];
    [super dealloc];
}
@end
