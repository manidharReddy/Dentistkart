//
//  WMMerchantInfo.h
//  WibmoSDK
//
//  Created by Roshit Omanakuttan on 19/08/15.
//  Copyright (c) 2015 Wow Labz. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface WSMerchantInfo : NSObject

@property (nonatomic, retain) NSString *merchantID;
@property (nonatomic, retain) NSString *merchantName;
@property (nonatomic, retain) NSString *merchantAppID;
@property (nonatomic, retain) NSString *merchantCountryCode;

- (NSDictionary *)merchantInformation;

@end
