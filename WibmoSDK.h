//
//  WibmoSDK.h
//  WibmoSDK
//
//  Created by Roshit Omanakuttan on 19/08/15.
//  Copyright (c) 2015 Wow Labz. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WSTransactionInfo.h"
#import "WSCustomerInfo.h"
#import "WSMerchantInfo.h"


#define PROCESS_INAPP_PAYMENT   @"PROCESS_INAPP_PAYMENT"


@protocol WibmoSDKDelegate;

@interface WibmoSDK : UIViewController

@property (nonatomic, retain) WSTransactionInfo *transactionInfo;
@property (nonatomic, retain) WSCustomerInfo *customerInfo;
@property (nonatomic, retain) WSMerchantInfo *merchantInfo;

@property (nonatomic, retain) id<WibmoSDKDelegate> delegate;

- (void)initializePayment;

@end


@protocol WibmoSDKDelegate <NSObject>

- (void)paymentSuccessfulWithTranscation:(NSDictionary *)iTransaction;
- (void)paymentCancelled;
- (void)paymentTimedOut;

@end
