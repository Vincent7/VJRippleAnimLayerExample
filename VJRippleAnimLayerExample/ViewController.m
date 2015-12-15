//
//  ViewController.m
//  VJRippleAnimLayerExample
//
//  Created by Vincent on 15/12/15.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import "ViewController.h"
#import "VJTapAnimButton.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet VJTapAnimButton *btnShare;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidLayoutSubviews{
    self.btnShare.dAlpha = .5;
    self.btnShare.dDuration = .3;
    self.btnShare.dRadius = 40;
    [self.btnShare configAnimLayer];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
