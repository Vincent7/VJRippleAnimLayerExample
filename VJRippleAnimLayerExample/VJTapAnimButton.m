//
//  VJTapAnimButton.m
//  VJAnimationTest
//
//  Created by Vincent on 15/12/14.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import "VJTapAnimButton.h"
@interface VJTapAnimButton ()
@property (nonatomic, strong) VJCircleMaskLayer *animLayer;
@end
@implementation VJTapAnimButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)configAnimLayer{
    self.animLayer = [[VJCircleMaskLayer alloc] initWithAlpha:self.dAlpha andDuration:self.dDuration andDestinationRadius:self.dRadius];
    [self.layer addSublayer:self.animLayer];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchPoint = [touch locationInView:self];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.animLayer.position = touchPoint;
    [CATransaction commit];
    
    [self.animLayer tapAnimationLayer];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
