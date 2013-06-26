//
//  KRMarqueeScrollView.m
//  V0.2 Beta
//
//  Created by Kuo-Ming Lin ( ilovekalvar@gmail.com ) on 13/6/25.
//  Copyright (c) 2013年 Kuo-Ming Lin. All rights reserved.
//

#import "KRMarqueeScrollView.h"

@interface KRMarqueeScrollView ()

@property (nonatomic, strong) NSTimer *_timer;

@end

@interface KRMarqueeScrollView (fixPrivate)

-(void)_initWithVars;
-(void)_removeAllSubviews;
-(void)_calculateTimerInterval;
-(void)_backToInitialPoint;
-(void)_startScrolling;

@end


@implementation KRMarqueeScrollView (fixPrivate)

-(void)_initWithVars
{
    self.images            = nil;
    self.imageWidth        = 0.0f;
    self.imageHeight       = 0.0f;
    self.offsetX           = 0.0f;
    self.eachImageInterval = 1.5f;
    self.timerInterval     = 0.0f;
    self._timer            = nil;
}

-(void)_removeAllSubviews
{
    for( UIImageView *_subImageView in self.subviews )
    {
        if( _subImageView )
        {
            _subImageView.image = nil;
            [_subImageView removeFromSuperview];
        }
    }
}

-(void)_calculateTimerInterval
{
    if( self.timerInterval <= 0.0f )
    {
        if ( [self.images count] > 0 )
        {
            self.timerInterval = [self.images count] * self.eachImageInterval;
        }
        else
        {
            self.timerInterval = 10.0f;
        }
    }
}

-(void)_backToInitialPoint
{
    [self setContentOffset:CGPointMake(-self.frame.size.width, 0.0f) animated:NO];
}

-(void)_startScrolling
{
    if( !self._timer )
    {
        self._timer = [NSTimer scheduledTimerWithTimeInterval:self.timerInterval + 0.1f
                                                       target:self
                                                     selector:@selector(_startScrolling)
                                                     userInfo:nil
                                                      repeats:YES];
    }
    CGFloat _scrollingWidth = self.contentSize.width;
    if( _scrollingWidth < self.frame.size.width )
    {
        _scrollingWidth = self.frame.size.width;
    }
    [UIView animateWithDuration:self.timerInterval animations:^{
        [self setContentOffset:CGPointMake(_scrollingWidth, 0.0f)];
    } completion:^(BOOL finished) {
        if( finished )
        {
            [self _backToInitialPoint];
        }
    }];
}

@end

@implementation KRMarqueeScrollView

@synthesize images;
@synthesize imageWidth;
@synthesize imageHeight;
@synthesize offsetX;
@synthesize eachImageInterval;
@synthesize timerInterval;
//
@synthesize _timer;


-(id)init
{
    self = [super init];
    if( self )
    {
        [self _initWithVars];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self _initWithVars];
    }
    return self;
}

#pragma --mark Methods
-(void)initialize
{
    [self _initWithVars];
}

-(void)displayImages
{
    [self _removeAllSubviews];
    NSInteger _currentCount = [self.images count];
    if( self.imageHeight <= 0.0f )
    {
        self.imageHeight = self.frame.size.height;
    }
    CGFloat _x       = 0.0f;
    CGFloat _y       = ( self.imageHeight - self.frame.size.height ) / 2;
    for( int i=0; i<_currentCount; i++ )
    {
        UIImageView *_subImageView = [[UIImageView alloc] initWithImage:[self.images objectAtIndex:i]];
        CGRect _frame      = _subImageView.frame;
        _frame.size.height = self.imageHeight;
        _frame.origin.x    = _x;
        _frame.origin.y    = _y;
        if( self.imageWidth <= 0.0f )
        {
            self.imageWidth = _frame.size.width;
        }
        else
        {
            _frame.size.width  = self.imageWidth;
        }
        [_subImageView setFrame:_frame];
        [_subImageView setTag:i+1];
        [_subImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_subImageView];
        _x += self.imageWidth + self.offsetX;
    }
    [self setContentSize:CGSizeMake(_x, self.frame.size.height)];
    [self setBackgroundColor:[UIColor clearColor]];
    self.scrollEnabled                  = NO;
    self.showsVerticalScrollIndicator   = NO;
    self.showsHorizontalScrollIndicator = NO;
}

-(void)start
{
    [self stop];
    [self _calculateTimerInterval];
    /*
     * @ 先執行一次動畫以校準初始顯示的基準 X 軸
     */
    CGFloat _scrollingWidth = self.contentSize.width;
    if( _scrollingWidth < self.frame.size.width )
    {
        _scrollingWidth = self.frame.size.width;
    }
    [UIView animateWithDuration:0.0f animations:^{
        [self setContentOffset:CGPointMake(_scrollingWidth, 0.0f)];
    } completion:^(BOOL finished) {
        if( finished )
        {
            [self _backToInitialPoint];
            [self _startScrolling];
        }
    }];
}

-(void)stop
{
    if( self._timer )
    {
        [self._timer invalidate];
        self._timer = nil;
    }
}

-(void)clear
{
    self.images = nil;
    [self _removeAllSubviews];
}


@end
