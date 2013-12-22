//
//  KRMarqueeScrollView.h
//  V0.5 Beta
//
//  Created by Kuo-Ming Lin ( ilovekalvar@gmail.com ) on 13/6/25.
//  Copyright (c) 2013年 Kuo-Ming Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    KRMarqueeScrollViewDisplayModeIsImageView = 0,
    KRMarqueeScrollViewDisplayModeIsView
}KRMarqueeScrollViewDisplayModes;

@interface KRMarqueeScrollView : UIScrollView
{
    //Displays UIImageViews
    NSArray *images;
    //Diplays UIViews
    NSArray *views;
    //General Usings
    CGFloat offsetX;
    CGFloat eachInterval;
    CGFloat timerInterval;
    BOOL isImageViewMode;
    CGFloat eachWidth;
    CGFloat eachHeight;
    KRMarqueeScrollViewDisplayModes displayMode;
    NSInteger currentPage;
    NSInteger totalPage;
    BOOL isPause;
}

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *views;
@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, assign) CGFloat eachInterval;
@property (nonatomic, assign) CGFloat timerInterval;
@property (nonatomic, assign) BOOL isImageViewMode;
@property (nonatomic, assign) CGFloat eachWidth;
@property (nonatomic, assign) CGFloat eachHeight;
@property (nonatomic, assign) KRMarqueeScrollViewDisplayModes displayMode;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger totalPage;
@property (nonatomic, assign) BOOL isPause;

-(void)initialize;
-(void)displayImages;
-(void)displayViews;
-(void)startScrollMarquee;
-(void)restartScrollMarquee;
-(void)startScrollPageByPage;
-(void)restartScrollPageByPage;
-(void)stop;
-(void)pause;
-(void)clear;

@end
