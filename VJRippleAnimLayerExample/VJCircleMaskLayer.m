//
//  VJCircleMaskLayer.m
//  VJAnimationTest
//
//  Created by Vincent on 15/12/13.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import "VJCircleMaskLayer.h"
@interface VJCircleMaskLayer ()
@property (nonatomic, assign) CGFloat dAlpha;
@property (nonatomic, assign) CGFloat dDuration;
@property (nonatomic, assign) CGFloat dRadius;
@end

@implementation VJCircleMaskLayer
@dynamic radius;
@dynamic innerRadius;
@dynamic alpha;

- (id)initWithAlpha:(CGFloat)alpha andDuration:(CGFloat)duration andDestinationRadius:(CGFloat)radius{
    if ((self = [super init]))
    {
        self.bounds = CGRectMake(0, 0, 200, 200);
        self.opacity = .5;
        self.dAlpha = alpha;
        self.dDuration = duration;
        self.dRadius = radius;
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([@"radius" isEqualToString:key]){
        return YES;
    }else if ([@"innerRadius" isEqualToString:key]){
        return YES;
    }else if ([key isEqualToString:@"opacity"]){
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}
#define  DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)
- (id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:@"radius"]){
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        animation.fromValue = @([[self presentationLayer] radius]);
        animation.duration = self.dDuration;
        animation.removedOnCompletion = YES;
        
        return animation;
    }else if ([key isEqualToString:@"innerRadius"]){

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        animation.fromValue = @([[self presentationLayer] innerRadius]);
        animation.beginTime = [self convertTime:CACurrentMediaTime() fromLayer:nil]+self.dDuration/2;  ;//* CFTimeInterval(i);;
        animation.duration = self.dDuration/2;
        animation.fillMode = kCAFillModeBackwards;
        animation.removedOnCompletion = YES;

        return animation;
    }else if ([key isEqualToString:@"opacity"]){
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        animation.fromValue = @([[self presentationLayer] opacity]);
        animation.duration = self.dDuration;
        animation.fillMode = kCAFillModeBackwards;
        animation.removedOnCompletion = YES;

        return animation;
    }

    return [super actionForKey:key];
}
//- (void)drawInContext:(CGContextRef)ctx{
//    NSLog(@"radius:%f innerRadius:%f",_radius,_innerRadius);
//    float radius = _radius;//[self.presentationLayer radius];
//    float innerRadius = _innerRadius;//[self.presentationLayer innerRadius];
//    
//    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:radius startAngle:0 endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
//    UIBezierPath * bezierPathInner =
//    [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:innerRadius startAngle:0 endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
//    
//    [bezierPath appendPath:bezierPathInner];
//    [bezierPath setUsesEvenOddFillRule:YES];
//    
//    CGContextAddPath(ctx, bezierPath.CGPath);
////    CGContextAddPath(ctx, bezierPathInner.CGPath);
//    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
//    CGContextFillPath(ctx);
//
//}
- (void)display
{
    
    float radius = [self.presentationLayer radius];
    float innerRadius = [self.presentationLayer innerRadius];

    if (innerRadius == self.dRadius) {
        
        [self resetLayerState];
        
        self.fillColor = [UIColor clearColor].CGColor;
    }else{
        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:radius startAngle:0 endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
        UIBezierPath * bezierPathInner =
        [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:innerRadius startAngle:0 endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
        [bezierPath appendPath:bezierPathInner];
        self.fillRule = kCAFillRuleEvenOdd;
        self.path = bezierPath.CGPath;
        self.opacity = [self.presentationLayer opacity];
        self.fillColor = [UIColor whiteColor].CGColor;
    }
    
}
//-(void)restoreAnimation{
//    
//    //Spring animation
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"radius"];
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    animation.fromValue = @(0);
//    animation.toValue = @(self.dRadius);
//    animation.duration = self.dDuration;
//    animation.removedOnCompletion = YES;
//
//    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"innerRadius"];
//    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    animation2.fromValue = @(0);
//    animation2.toValue = @(self.dRadius);
//    animation2.beginTime = [self convertTime:CACurrentMediaTime() fromLayer:nil] + self.dDuration/2;  ;//* CFTimeInterval(i);;
//    animation2.duration = self.dDuration/2;
//    animation2.fillMode = kCAFillModeBackwards;
//    animation2.removedOnCompletion = YES;
//    
//    CAAnimationGroup *group = [CAAnimationGroup animation];
//    [group setAnimations:@[animation,animation2]];
//    [group setDuration:self.dDuration];
//    [self addAnimation:group forKey:@"restoreAnimation"];
//    
//}
-(void)tapAnimationLayer{
    [self resetLayerState];
    
    self.innerRadius = self.dRadius;
    self.radius = self.dRadius;
    self.opacity = .0;
}

-(void)resetLayerState{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.innerRadius = 0;
    self.radius = 0;
    self.opacity = self.dAlpha;
    [CATransaction commit];
}
@end
