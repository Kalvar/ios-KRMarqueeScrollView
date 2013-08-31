//
//  KRMarqueeScrollView.m
//  V0.3 Beta
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
-(void)_startMarqueeScrolling;
-(void)_startPageByPageScrolling;
-(NSInteger)_calculateTotalPages;
-(NSInteger)_calculateCurrentPage;
-(void)_scrollToPage:(NSInteger)_toPage;
-(void)_scrollToPage:(NSInteger)_toPage animated:(BOOL)_needAnimated;

@end


@implementation KRMarqueeScrollView (fixPrivate)

-(void)_initWithVars
{
    self.images            = nil;
    self.eachWidth         = 0.0f;
    self.eachHeight        = 0.0f;
    self.views             = nil;
    self.offsetX           = 0.0f;
    self.eachInterval      = 1.5f;
    self.timerInterval     = 0.0f;
    self.isImageViewMode   = YES;
    self.currentPage       = 0;
    self.totalPage         = 0;
    self._timer            = nil;
    [self setBackgroundColor:[UIColor clearColor]];
    self.scrollEnabled                  = NO;
    self.showsVerticalScrollIndicator   = NO;
    self.showsHorizontalScrollIndicator = NO;
}

-(void)_removeAllSubviews
{
    for( UIView *_subview in self.subviews )
    {
        if( _subview )
        {
            if( [_subview isKindOfClass:[UIImageView class]] )
            {
                UIImageView *_subImageView = (UIImageView *)_subview;
                _subImageView.image = nil;
            }
            [_subview removeFromSuperview];
        }
    }
}

-(void)_calculateTimerInterval
{
    if( self.timerInterval <= 0.0f )
    {
        if( self.images || self.views )
        {
            NSInteger _count = 0;
            if( self.isImageViewMode )
            {
                _count = [self.images count];
            }
            else
            {
                _count = [self.views count];
            }
            self.timerInterval = _count * self.eachInterval;
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

-(void)_startMarqueeScrolling
{
    if( !self._timer )
    {
        self._timer = [NSTimer scheduledTimerWithTimeInterval:self.timerInterval + 0.1f
                                                       target:self
                                                     selector:@selector(_startMarqueeScrolling)
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

-(void)_startPageByPageScrolling
{
    if( !self._timer )
    {
        self._timer = [NSTimer scheduledTimerWithTimeInterval:self.timerInterval
                                                       target:self
                                                     selector:@selector(_startPageByPageScrolling)
                                                     userInfo:nil
                                                      repeats:YES];
    }
    //是第 1 頁就不要動畫
    BOOL _needAnimated = ( self.currentPage > 0 );
    [self _scrollToPage:self.currentPage animated:_needAnimated];
    ++self.currentPage;
    if( self.currentPage >= self.totalPage )
    {
        self.currentPage = 0;
    }
}

#pragma UIScrollView 換頁
-(NSInteger)_calculateTotalPages
{
    if( self.contentSize.width == 0.0f )
    {
        return 0;
    }
    CGFloat pageWidth = self.frame.size.width;
    /*
     * @ 公式
     *   - ( ( ScrollView 目前內容的寬度 - (分頁寬度 / 每頁幾張圖) ) / 分頁寬度 ) + 1
     */
    return floor( ( self.contentSize.width - ( pageWidth / 4 ) ) / pageWidth ) + 1;
}

-(NSInteger)_calculateCurrentPage
{
    //取出分頁寬
    CGFloat pageWidth = self.frame.size.width;
    /*
     * @ 公式
     *   - ( ( ScrollView 目前捲動到的 X 座標 - (分頁寬度 / 過半線中間 2 分) ) / 分頁寬度 ) + 1
     */
    return (( self.contentOffset.x - (pageWidth / 2) ) / pageWidth) + 1;
}

-(void)_scrollToPage:(NSInteger)_toPage
{
    [self _scrollToPage:_toPage animated:YES];
}

-(void)_scrollToPage:(NSInteger)_toPage animated:(BOOL)_needAnimated
{
    CGRect _frame   = self.frame;
    _frame.origin.x = _frame.size.width * _toPage;
    _frame.origin.y = 0.0f;
    [self scrollRectToVisible:_frame animated:_needAnimated];
}



@end

@implementation KRMarqueeScrollView

@synthesize images;
@synthesize eachWidth;
@synthesize eachHeight;
@synthesize views;
@synthesize offsetX;
@synthesize eachInterval;
@synthesize timerInterval;
@synthesize isImageViewMode;
@synthesize displayMode;
@synthesize currentPage;
@synthesize totalPage;
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
    self.isImageViewMode = YES;
    self.displayMode     = KRMarqueeScrollViewDisplayModeIsImageView;
    [self _removeAllSubviews];
    NSInteger _currentCount = [self.images count];
    if( self.eachHeight <= 0.0f )
    {
        self.eachHeight = self.frame.size.height;
    }
    CGFloat _x = 0.0f;
    CGFloat _y = ( self.eachHeight - self.frame.size.height ) / 2;
    for( int i=0; i<_currentCount; i++ )
    {
        UIImageView *_subImageView = [[UIImageView alloc] initWithImage:[self.images objectAtIndex:i]];
        CGRect _frame      = _subImageView.frame;
        _frame.size.height = self.eachHeight;
        _frame.origin.x    = _x;
        _frame.origin.y    = _y;
        if( self.eachWidth <= 0.0f )
        {
            self.eachWidth = _frame.size.width;
        }
        else
        {
            _frame.size.width  = self.eachWidth;
        }
        [_subImageView setFrame:_frame];
        [_subImageView setTag:i+1];
        [_subImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_subImageView];
        _x += self.eachWidth + self.offsetX;
    }
    [self setContentSize:CGSizeMake(_x, self.frame.size.height)];
}

-(void)displayViews
{
    self.isImageViewMode = NO;
    self.displayMode     = KRMarqueeScrollViewDisplayModeIsView;
    [self _removeAllSubviews];
    __block CGFloat _x = 0.0f;
    if( self.eachWidth <= 0.0f )
    {
        self.eachWidth = self.frame.size.width;
    }
    if( self.eachHeight <= 0.0f )
    {
        self.eachHeight = self.frame.size.height;
    }
    CGFloat _y = ( self.eachHeight - self.frame.size.height ) / 2;
    if( self.views )
    {
        [self.views enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
         {
             UIView *_subview   = (UIView *)obj;
             CGRect _frame      = _subview.frame;
             _frame.origin.x    = _x;
             _frame.origin.y    = _y;
             [_subview setFrame:_frame];
             [_subview setTag:idx+1];
             [_subview setContentMode:UIViewContentModeScaleAspectFit];
             [self addSubview:_subview];
             _x += self.eachWidth + self.offsetX;
         }];
    }
    [self setContentSize:CGSizeMake(_x, self.frame.size.height)];
}

-(void)startScrollMarquee
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
            [self _startMarqueeScrolling];
        }
    }];
}

/*
 * @ If you wanna use this method that you need to setup timerInterval param.
 */
-(void)startScrollPageByPage
{
    [self stop];
    [self _calculateTimerInterval];
    self.totalPage   = [self _calculateTotalPages];
    self.currentPage = [self _calculateCurrentPage];
    [self _startPageByPageScrolling];
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
    self.views  = nil;
    [self _removeAllSubviews];
}


@end
