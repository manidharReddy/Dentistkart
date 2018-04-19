//
//  URLImageView.h
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 23/04/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URLImageView : UIImageView{
    NSMutableData *_receivedData;
    UIActivityIndicatorView *_loadingIndicatorView;
    void (^_completionBlock)(BOOL finished);
}

@property BOOL suppressLoadingIndicator;

- (void)startLoading:(NSString*)url completion:(void (^)(BOOL finished))completion;
- (void)startLoading:(NSString*)url;

@end
