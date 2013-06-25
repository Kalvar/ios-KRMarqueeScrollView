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
    self.krMarqueeScrollView.eachImageInterval = 0.5f;
    [self.krMarqueeScrollView displayImages];
    [self.krMarqueeScrollView start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
