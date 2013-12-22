## Screen Shot

<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRMarqueeScrollView-1.png" alt="KRMarqueeScrollView" title="KRMarqueeScrollView" style="margin: 20px;" class="center" /> &nbsp;
<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRMarqueeScrollView-2.png" alt="KRMarqueeScrollView" title="KRMarqueeScrollView" style="margin: 20px;" class="center" /> &nbsp;
<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRMarqueeScrollView-3.png" alt="KRMarqueeScrollView" title="KRMarqueeScrollView" style="margin: 20px;" class="center" /> &nbsp;

## Supports

To implement marquee effect or carousel with images, views, and you can use it to show marquee or page by page mode.


## How To Get Started

``` objective-c
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
```

## Version

V0.5 Beta.

## License

KRMarqueeScrollView is available under the MIT license ( or Whatever you wanna do ). See the LICENSE file for more info.
