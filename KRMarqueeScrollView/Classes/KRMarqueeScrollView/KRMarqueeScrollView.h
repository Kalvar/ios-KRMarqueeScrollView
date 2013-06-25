//
//  KRMarqueeScrollView.h
//  V0.2 Beta
//
//  Created by Kuo-Ming Lin ( ilovekalvar@gmail.com ) on 13/6/25.
//  Copyright (c) 2013年 Kuo-Ming Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRMarqueeScrollView : UIScrollView
{
    NSArray *images;
    CGFloat imageWidth;
    CGFloat imageHeight;
    CGFloat offsetX;
    CGFloat eachImageInterval;
    
}

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) CGFloat imageWidth;
@property (nonatomic, assign) CGFloat imageHeight;
@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, assign) CGFloat eachImageInterval;

-(void)initialize;
-(void)displayImages;
-(void)start;
-(void)stop;
-(void)clear;

@end
