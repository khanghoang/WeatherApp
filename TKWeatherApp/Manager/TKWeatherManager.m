//
//  TKWeatherManager.m
//  TKWeatherApp
//
//  Created by Triệu Khang on 10/4/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "TKWeatherManager.h"

@implementation TKWeatherManager

+ (instancetype)sharedIntance {
    static TKWeatherManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TKWeatherManager alloc] init];
    });
    return manager;
}

+ (void)getWeatherWithSuccess:(void(^)(NSNumber *temp, NSTimeInterval time))successBlock andFailure:(void(^)(NSError *error))failureBlock {
    [[TKWeatherManager sharedIntance] getWeatherWithSuccess:successBlock andFailure:failureBlock];
}

- (void)getWeatherWithSuccess:(void(^)(NSNumber *temp, NSTimeInterval time))successBlock andFailure:(void(^)(NSError *error))failureBlock {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *stringURL = @"http://api.openweathermap.org/data/2.5/weather?q=London,uk";

    [manager GET:stringURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        if (successBlock) {

            NSTimeInterval time = [[NSDate date] timeIntervalSince1970];

            NSDictionary *mainDict = responseObject[@"main"];
            successBlock(mainDict[@"temp"], time);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        if (failureBlock) {
            failureBlock(error);
        }

    }];


}

@end
