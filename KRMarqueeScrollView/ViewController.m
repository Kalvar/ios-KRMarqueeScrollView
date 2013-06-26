//
//  ViewController.m
//  KRMarqueeScrollView
//
//  Created by Kalvar on 13/6/26.
//  Copyright (c) 2013年 Kuo-Ming Lin. All rights reserved.
//

#import "ViewController.h"
#import "KRMarqueeScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize krMarqueeScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.krMarqueeScrollView initialize];
	self.krMarqueeScrollView.images = [NSArray arrayWithObjects:
                                       [UIImage imageNamed:@"sample1.png"],
                                       [UIImage imageNamed:@"sample2.png"],
                                       [UIImage imageNamed:@"sample1.png"],
                                       [UIImage imageNamed:@"sample2.png"],
                                       [UIImage imageNamed:@"sample1.png"],
                                       [UIImage imageNamed:@"sample2.png"],
                                       [UIImage imageNamed:@"sample1.png"],
                                       [UIImage imageNamed:@"sample2.png"],
                                       [UIImage imageNamed:@"sample1.png"],
                                       [UIImage imageNamed:@"sample2.png"],
                                       [UIImage imageNamed:@"sample1.png"],
                                       [UIImage imageNamed:@"sample2.png"],
                                       nil];
    self.krMarqueeScrollView.offsetX           = 10.0f;
    [self.krMarqueeScrollView displayImages];
    [self decideCycleIntervalByYourself];
    //[self decideCycleIntervalBySystemAutomatic];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma --mark Methods
-(void)decideCycleIntervalByYourself
{
    //If you wanna set the recycle interval by yourself, just don't be zero second that will be fired.
    self.krMarqueeScrollView.timerInterval     = 2.0f;
    [self.krMarqueeScrollView start];
}

-(void)decideCycleIntervalBySystemAutomatic
{
    //To set the zero second to fire 
    self.krMarqueeScrollView.timerInterval     = 0.0f;
    self.krMarqueeScrollView.eachImageInterval = 0.5f;
    [self.krMarqueeScrollView start];
}

@end
