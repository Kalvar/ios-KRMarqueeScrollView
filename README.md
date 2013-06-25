## Screen Shot

<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRMarqueeScrollView-1.png" alt="KRMarqueeScrollView" title="KRMarqueeScrollView" style="margin: 20px;" class="center" /> &nbsp;
<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRMarqueeScrollView-2.png" alt="KRMarqueeScrollView" title="KRMarqueeScrollView" style="margin: 20px;" class="center" /> &nbsp;
<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRMarqueeScrollView-3.png" alt="KRMarqueeScrollView" title="KRMarqueeScrollView" style="margin: 20px;" class="center" /> &nbsp;

## Supports

To implement marquee effect with images. 

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
    self.krMarqueeScrollView.offsetX           = 10.0f;
    self.krMarqueeScrollView.eachImageInterval = 0.5f;
    [self.krMarqueeScrollView displayImages];
    [self.krMarqueeScrollView start];
}
```

## Version

V0.2 Beta.

## License

KRMarqueeScrollView is available under the MIT license ( or Whatever you wanna do ). See the LICENSE file for more info.
