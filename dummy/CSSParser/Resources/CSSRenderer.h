//
//  CSSRenderer.h
//  dummy
//
//  Created by Ashish Maheshwari on 4/28/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+CSSclass.h"

@interface CSSRenderer : NSObject

+(void)renderTheView:(UIView *)nameOfView withClassName:(NSString *)nameOfClass;

+ (void)rerender;
+ (void)rerenderView:(UIView *)view;

@end
