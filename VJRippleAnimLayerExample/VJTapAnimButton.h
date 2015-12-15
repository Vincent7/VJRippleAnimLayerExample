//
//  VJTapAnimButton.h
//  VJAnimationTest
//
//  Created by Vincent on 15/12/14.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VJCircleMaskLayer.h"
@interface VJTapAnimButton : UIButton
@property (nonatomic, assign) CGFloat dAlpha;
@property (nonatomic, assign) CGFloat dDuration;
@property (nonatomic, assign) CGFloat dRadius;
-(void)configAnimLayer;
@end
