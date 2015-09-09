//
//  UIButton+CSSclass.h
//  dummy
//
//  Created by Ashish Maheshwari on 4/28/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "CSSRenderer.h"

@interface UIButton (CSSclass)

@property (strong, nonatomic) NSString *cssClass;

- (void)applyCSS;

@end
