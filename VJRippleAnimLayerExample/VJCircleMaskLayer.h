//
//  VJCircleMaskLayer.h
//  VJAnimationTest
//
//  Created by Vincent on 15/12/13.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface VJCircleMaskLayer : CAShapeLayer
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat innerRadius;
@property (nonatomic, assign) CGFloat alpha;
- (void)tapAnimationLayer;
- (id)initWithAlpha:(CGFloat)alpha andDuration:(CGFloat)duration andDestinationRadius:(CGFloat)radius;
@end
