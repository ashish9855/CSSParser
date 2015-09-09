//
//  UILabelRenderer.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/29/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "UILabelRenderer.h"

@implementation UILabelRenderer

+(void)renderTheLabel:(UILabel *)label withClass:(NSString *)cssClass{
    
    // check if the class is present
    if([Settings isClassPresent:cssClass]){
        
        [self applyCSStoLabel:label withCSSValues:[Settings getAllTheCSSKeys:cssClass]];
    }
    else{
        
        
    }
}

+(void)applyCSStoLabel:(UILabel *)label withCSSValues:(NSDictionary *)CSSvalues{
    

    if([Settings doesClass:CSSvalues containsKey:@"font-family"] && [Settings doesClass:CSSvalues containsKey:@"font-size"]){
        
         [label setFont:[UIFont fontWithName:[CSSvalues valueForKey:@"font-family"] size:[[CSSvalues valueForKey:@"font-size"]integerValue]]];
    }
    else if(![Settings doesClass:CSSvalues containsKey:@"font-family"] && [Settings doesClass:CSSvalues containsKey:@"font-size"]){
        
        [label setFont:[UIFont fontWithName:@"" size:[[CSSvalues valueForKey:@"font-size"]integerValue]]];
                        
    }
    else if([Settings doesClass:CSSvalues containsKey:@"font-family"] && ![Settings doesClass:CSSvalues containsKey:@"font-size"]){
        
        [label setFont:[UIFont fontWithName:[CSSvalues valueForKey:@"font-family"] size:14]];
        
    }
    else{
        
        
    }
    if([Settings doesClass:CSSvalues containsKey:@"text-align"]){
        
        if([[CSSvalues valueForKey:@"text-align"]isEqualToString:@"center"]){
            
            label.textAlignment=NSTextAlignmentCenter;
        }
        else if([[CSSvalues valueForKey:@"text-align"]isEqualToString:@"left"]){
            
            label.textAlignment=NSTextAlignmentLeft;
        }
        
        else if([[CSSvalues valueForKey:@"text-align"]isEqualToString:@"right"]){
            
            label.textAlignment=NSTextAlignmentRight;
        }
        
    }
    if([Settings doesClass:CSSvalues containsKey:@"text-color"]){
        
        [label setTextColor:[UIColor colorWithHex:[CSSvalues valueForKey:@"text-color"] alpha:1.0]];
    }
    if([Settings doesClass:CSSvalues containsKey:@"text"]){
        
        [label setText:[CSSvalues valueForKey:@"text"]];
    }
}


@end
