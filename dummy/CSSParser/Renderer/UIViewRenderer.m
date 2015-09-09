//
//  UIViewRenderer.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/29/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "UIViewRenderer.h"

@implementation UIViewRenderer

+(void)renderTheView:(UIView *)view withClass:(NSString *)cssClass{
    
    // check if the class is present
    if([Settings isClassPresent:cssClass]){
        
        [self applyCSStoView:view withCSSValues:[Settings getAllTheCSSKeys:cssClass]];
    }
    else{
        
        
    }
}

+(void)applyCSStoView:(UIView *)view withCSSValues:(NSDictionary *)CSSvalues{
    
    if([Settings doesClass:CSSvalues containsKey:@"background-color"]){
        
        [view setBackgroundColor:[UIColor colorWithHex:[CSSvalues valueForKey:@"background-color"] alpha:1.0]];
    }
    if([Settings doesClass:CSSvalues containsKey:@"border-width"]){
        
        [[view layer]setBorderWidth:[[CSSvalues valueForKey:@"border-width"]floatValue]];
    }
    if([Settings doesClass:CSSvalues containsKey:@"border-radius"]){
        
        [[view layer]setCornerRadius:[[CSSvalues valueForKey:@"border-radius"]floatValue] ];
        view.clipsToBounds = YES;
    }
    if([Settings doesClass:CSSvalues containsKey:@"border-color"]){
        
        [[view layer]setBorderColor:[UIColor colorWithHex:[CSSvalues valueForKey:@"border-color"] alpha:1.0].CGColor];
    }
    if([Settings doesClass:CSSvalues containsKey:@"background-image"]){
        
        [view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[CSSvalues valueForKey:@"background-image"]]]];
    }

    
}


@end
