//
//  TKAppDelegate.m
//  TKWeatherApp
//
//  Created by Triệu Khang on 10/4/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "TKAppDelegate.h"
#import "TKWeatherManager.h"

@implementation TKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    return YES;
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

    [TKWeatherManager getWeatherWithSuccess:^(NSNumber *temp, NSTimeInterval time) {
        NSLog(@"This is background fetch");

        [UIApplication sharedApplication].applicationIconBadgeNumber ++;

        NSDictionary *dict = @{@"temp": temp,
                               @"time": @(time)};

        [[NSNotificationCenter defaultCenter] postNotificationName:@"NewWeather"
                                                            object:dict
                                                          userInfo:nil];

        completionHandler(UIBackgroundFetchResultNewData);
    } andFailure:^(NSError *error) {
        completionHandler(UIBackgroundFetchResultNoData);
    }];

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

@end
