//
//  TKViewController.m
//  TKWeatherApp
//
//  Created by Triệu Khang on 10/4/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "TKViewController.h"
#import "TKWeatherManager.h"

@interface TKViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblTemp;
@property (weak, nonatomic) IBOutlet UILabel *lblUpdateTime;

@end

@implementation TKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [TKWeatherManager getWeatherWithSuccess:^(NSNumber *temp, NSTimeInterval updateTime) {

        NSLog(@"Temp = %@", [temp stringValue]);
        self.lblTemp.text = [temp stringValue];

        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm:ss"];
        NSDate *lastUpdateDate = [NSDate dateWithTimeIntervalSince1970:updateTime];

        self.lblUpdateTime.text = [dateFormatter stringFromDate:lastUpdateDate];

    } andFailure:^(NSError *error) {

    }];
}

@end
