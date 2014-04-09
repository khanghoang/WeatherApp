//
//  TKWeatherManager.h
//  TKWeatherApp
//
//  Created by Triệu Khang on 10/4/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKWeatherManager : NSObject

+ (instancetype)sharedIntance;
+ (void)getWeatherWithSuccess:(void(^)(NSNumber *temp, NSTimeInterval time))successBlock andFailure:(void(^)(NSError *error))failureBlock;

@end
