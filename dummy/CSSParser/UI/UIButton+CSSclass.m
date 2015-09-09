//
//  UIButton+CSSclass.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/28/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "UIButton+CSSclass.h"

@implementation UIButton (CSSclass)


- (NSString *)cssClass {

    return objc_getAssociatedObject(self, @"cssClass");
}

- (void)setCssClass:(NSString *)cssClass{
    
    objc_setAssociatedObject(self, @"cssClass", cssClass, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self applyCSS];
}


- (void)applyCSS
{
    // Styling shouldn't be applied to inherited classes, unless nuiClass is explictly set
    if ([self isMemberOfClass:[UIButton class]] || self.cssClass)
    {
        if (![self.cssClass isEqualToString:@""]) {
            
            NSLog(@"%@",self.cssClass);
            [CSSRenderer renderTheView:self withClassName:self.cssClass];
        }
    }
}


@end
