//
//  ViewController.m
//  UIKitAnimationPro
//
//  Created by demon on 12/12/12.
//  Copyright (c) 2012 NicoFun. All rights reserved.
//

#import "ViewController.h"
#import "UIView+UIAnimationCatagory.h"
#import "UIKitAnimation.h"
#import "UIImageViewAnimator.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIAnimationImageView* g = [[UIAnimationImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    
    g.contentMode = UIViewContentModeCenter;
    
    [self.view addSubview:g];
    
    
    UIAnimationImage* image = [UIAnimationImage actionWithImageArr:@"tr_ios_butterfly" StartIndex:0 EndInde:3 Duration:0.3];

    UICallbackBlock * callback = [UICallbackBlock actionWithBlock:^(id data)
    {
        NSLog(@"animation finish");
    }];
    
    UIScaleAnimation * scale = [UIScaleAnimation actionByScaleX:2.0
                                                         ScaleY:3.0
                                                       Duration:1];
    UIDisplaceAnimation * displace = [UIDisplaceAnimation actionByPoint:CGPointMake(100, 100)
                                                               Duration:3.0];
    
    UIRotateAnimation * rotate = [UIRotateAnimation actionByRotate:90
                                                          Duration:1.0];
    
    UIRotateAnimation * rotateTo = [UIRotateAnimation actionToRotate:150
                                                          Duration:1.0];

    UIAnimationSequence * seq = [[UIAnimationSequence alloc] init];
    
    [seq addAction:image];
    [seq addAction:scale];
    [seq addAction:displace];
    [seq addAction:rotate];
    [seq addAction:rotateTo];
    [seq addAction:callback];
    
    for (int i=0; i<100; i++)
    {
        int x = arc4random()%5-2;
        int y = arc4random()%5-2;
        UIDisplaceAnimation * displace0 = [UIDisplaceAnimation actionByPoint:CGPointMake(x, y)
                                                                   Duration:1.0];

        [seq addAction:displace0];
    }
    [g runAction:seq];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
