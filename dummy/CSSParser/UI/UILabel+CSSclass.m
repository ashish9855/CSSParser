//
//  UILabel+CSSclass.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/29/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "UILabel+CSSclass.h"

@implementation UILabel (CSSclass)


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
    if ([self isMemberOfClass:[UILabel class]] || self.cssClass)
    {
        if (![self.cssClass isEqualToString:@""]) {
            
            NSLog(@"%@",self.cssClass);
            
            [CSSRenderer renderTheView:self withClassName:self.cssClass];
        }
    }
}



@end
