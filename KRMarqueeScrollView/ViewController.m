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
    self.krMarqueeScrollView.offsetX = 10.0f;
    [self.krMarqueeScrollView displayImages];
    //[self.krMarqueeScrollView displayViews];
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
    self.krMarqueeScrollView.timerInterval = 2.0f;
    [self.krMarqueeScrollView startScrollMarquee];
    //[self.krMarqueeScrollView startScrollPageByPage];
}

-(void)decideCycleIntervalBySystemAutomatic
{
    //To set the zero second to fire.
    self.krMarqueeScrollView.timerInterval = 0.0f;
    //Each imageView shows 0.5 second. If you have 10 images to show that it will be duration at 10 * 0.5 = 5 seconds.
    self.krMarqueeScrollView.eachInterval  = 0.5f;
    [self.krMarqueeScrollView startScrollMarquee];
}

-(void)pauseAndRestart
{
    if( self.krMarqueeScrollView.isPause )
    {
        [self.krMarqueeScrollView restartScrollMarquee];
        //[self.krMarqueeScrollView restartScrollPageByPage];
    }
    else
    {
        [self.krMarqueeScrollView pause];
    }
}

@end
