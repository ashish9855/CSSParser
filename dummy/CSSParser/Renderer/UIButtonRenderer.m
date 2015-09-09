//
//  UIButtonRenderer.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/28/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "UIButtonRenderer.h"

@implementation UIButtonRenderer

@synthesize getAllTheValueOfCSS;

+(void)renderTheButton:(UIButton *)button withClass:(NSString *)cssClass{
    
    // check if the class is present
    if([Settings isClassPresent:cssClass]){
        
        [self applyCSStoButton:button withCSSValues:[Settings getAllTheCSSKeys:cssClass]];
    }
    else{
        
        
    }
}

+(void)applyCSStoButton:(UIButton *)button withCSSValues:(NSDictionary *)CSSvalues{
    
    if([Settings doesClass:CSSvalues containsKey:@"background-color"]){
        
        [button setBackgroundColor:[UIColor colorWithHex:[CSSvalues valueForKey:@"background-color"] alpha:1.0]];
    }
    if([Settings doesClass:CSSvalues containsKey:@"border-width"]){
        
        [[button layer]setBorderWidth:[[CSSvalues valueForKey:@"border-width"]floatValue]];
    }
    if([Settings doesClass:CSSvalues containsKey:@"border-radius"]){
        
        [[button layer]setCornerRadius:[[CSSvalues valueForKey:@"border-radius"]floatValue] ];
        button.clipsToBounds = YES;
    }
    if([Settings doesClass:CSSvalues containsKey:@"border-color"]){
        
        [[button layer]setBorderColor:[UIColor colorWithHex:[CSSvalues valueForKey:@"border-color"] alpha:1.0].CGColor];
    }
    if([Settings doesClass:CSSvalues containsKey:@"background-image"]){
        
        [button setBackgroundImage:[UIImage imageNamed:[CSSvalues valueForKey:@"background-image"]] forState:UIControlStateNormal];
    }
    if([Settings doesClass:CSSvalues containsKey:@"padding-top"]){
        
        button.contentEdgeInsets= UIEdgeInsetsMake([[CSSvalues valueForKey:@"padding-top"] floatValue], 0, 0, 0);
    }
    if([Settings doesClass:CSSvalues containsKey:@"padding-right"]){
        
        button.contentEdgeInsets= UIEdgeInsetsMake(0, 0, 0, [[CSSvalues valueForKey:@"padding-right"] floatValue]);
    }
    if([Settings doesClass:CSSvalues containsKey:@"padding-bottom"]){
        
        button.contentEdgeInsets= UIEdgeInsetsMake(0, 0, [[CSSvalues valueForKey:@"padding-bottom"] floatValue], 0);
    }
    if([Settings doesClass:CSSvalues containsKey:@"padding-left"]){
        
        button.contentEdgeInsets= UIEdgeInsetsMake(0, [[CSSvalues valueForKey:@"padding-left"] floatValue], 0, 0);
    }
    if([Settings doesClass:CSSvalues containsKey:@"font-family"] && [Settings doesClass:CSSvalues containsKey:@"font-size"]){
        
        [button.titleLabel setFont:[UIFont fontWithName:[CSSvalues valueForKey:@"font-family"] size:[[CSSvalues valueForKey:@"font-size"] integerValue]]];
    }
    else if(![Settings doesClass:CSSvalues containsKey:@"font-family"] && [Settings doesClass:CSSvalues containsKey:@"font-size"]){
        
         [button.titleLabel setFont:[UIFont fontWithName:@"" size:[[CSSvalues valueForKey:@"font-size"] integerValue]]];
    }
    else if([Settings doesClass:CSSvalues containsKey:@"font-family"] && ![Settings doesClass:CSSvalues containsKey:@"font-size"]){
        
        [button.titleLabel setFont:[UIFont fontWithName:[CSSvalues valueForKey:@"font-family"] size:14]];
    }
    else{
        
        
    }
    if([Settings doesClass:CSSvalues containsKey:@"text-align"]){
        
        if([[CSSvalues valueForKey:@"text-align"]isEqualToString:@"center"]){
            
            button.titleLabel.textAlignment=NSTextAlignmentCenter;
        }
        else if([[CSSvalues valueForKey:@"text-align"]isEqualToString:@"left"]){
            
            button.titleLabel.textAlignment=NSTextAlignmentLeft;
        }

        else if([[CSSvalues valueForKey:@"text-align"]isEqualToString:@"right"]){
            
            button.titleLabel.textAlignment=NSTextAlignmentRight;
        }

    }
    if([Settings doesClass:CSSvalues containsKey:@"text-color"]){
        
        [button setTitleColor:[UIColor colorWithHex:[CSSvalues valueForKey:@"text-color"] alpha:1.0] forState:UIControlStateNormal];
    }
    if([Settings doesClass:CSSvalues containsKey:@"text"]){
        
        [button setTitle:[CSSvalues valueForKey:@"text"] forState:UIControlStateNormal];
    }
    
}

@end
