//
//  UIView+CSSclass.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/28/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "UIView+CSSclass.h"

@implementation UIView (CSSclass)


- (void)applyCSS
{
    // Styling shouldn't be applied to inherited classes, unless CSS is explictly set
    if ([self isMemberOfClass:[UIView class]] || self.cssClass)
    {
     
        if (![self.cssClass isEqualToString:@""]) {
            NSLog(@"%@",self.cssClass);
            
            [CSSRenderer renderTheView:self withClassName:self.cssClass];
        }
    }
}

- (NSString *)cssClass {
    return objc_getAssociatedObject(self, @"cssClass");
}

- (void)setCssClass:(NSString *)cssClass{
    objc_setAssociatedObject(self, @"cssClass", cssClass, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self applyCSS];
}

@end
