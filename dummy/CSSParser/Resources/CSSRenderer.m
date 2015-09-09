//
//  CSSRenderer.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/28/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "CSSRenderer.h"
#import "UIButtonRenderer.h"
#import "UIViewRenderer.h"
#import "UILabelRenderer.h"

@implementation CSSRenderer


+(void)renderTheView:(UIView *)nameOfView withClassName:(NSString *)nameOfClass{
    
    // check for the UIButton
    if([nameOfView isKindOfClass:[UIButton class]]){
        
        [UIButtonRenderer renderTheButton:(UIButton*)nameOfView withClass:nameOfClass];
    }
    // check for the Uiview
    else if([nameOfView isKindOfClass:[UIView class]]){
        
         // check for the Label
        if([nameOfView isKindOfClass:[UILabel class]]){
            
            [UILabelRenderer renderTheLabel:(UILabel *)nameOfView withClass:nameOfClass];
        }
        else{
            
             [UIViewRenderer renderTheView:nameOfView withClass:nameOfClass];
        }
    }
}

+ (void)rerender
{
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        UIView *rootView = [[window rootViewController] view];
        [self rerenderView:rootView];
    }
}

+ (void)rerenderView:(UIView *)view
{
    for (UIView *subview in view.subviews) {
        [self rerenderView:subview];
    }
    
    if ([view respondsToSelector:@selector(applyCSS)]){
        [view applyCSS];
    }
    
    if ([view respondsToSelector:@selector(inputAccessoryView)]){
        if ([view isFirstResponder]) {
            UIView *inputAccessoryView = [view inputAccessoryView];
            
            if (inputAccessoryView)
                [self rerenderView:inputAccessoryView];
        }
    }
}


@end
