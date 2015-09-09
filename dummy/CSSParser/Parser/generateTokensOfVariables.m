//
//  generateTokensOfVariables.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/27/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "generateTokensOfVariables.h"

@implementation generateTokensOfVariables


-(void)scanAllTheVariables:(NSString*)start andString:(NSString*)end{
    
    NSScanner* scanner = [NSScanner scannerWithString:stringCSSromFileAtURL];
    while ([scanner isAtEnd] == NO) {
        
        [scanner setCharactersToBeSkipped:nil];
        [scanner scanUpToString:start intoString:NULL];
        if ([scanner scanString:start intoString:NULL]) {
            NSString* result = nil;
            if ([scanner scanUpToString:end intoString:&result]) {
                
                result=[start stringByAppendingString:result];
                result=[result stringByAppendingString:end];
                
                [storeData.storeAllTheVariables addObject:result];
                
            }
        }
    }
    
    // check if the results are valid
    for(int m=0;m<[storeData.storeAllTheVariables count];m++){
        
        if([[storeData.storeAllTheVariables objectAtIndex:m]containsString:@":"]){
            
            // remove all the variables from the string
            
            stringCSSromFileAtURL=[stringCSSromFileAtURL stringByReplacingOccurrencesOfString:[storeData.storeAllTheVariables objectAtIndex:m] withString:@""];
        }
        else{
            
            [storeData.storeAllTheVariables removeObject:[storeData.storeAllTheVariables objectAtIndex:m]];
        }
    }
    
}


@end
